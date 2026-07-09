#!/usr/bin/env python3

import argparse
import os
import sys
from multiprocessing import cpu_count
from multiprocessing.pool import ThreadPool
from pathlib import Path

from win2xcur import scale as scaler
from win2xcur.cursor import CursorFrame
from win2xcur.parser.inf import parse_inf
from win2xcur.theme import XCURSOR_ALIASES
from win2xcur.writer import to_x11


def process_cursor(name, aliases, theme, sizes, output_dir):
    cursor = getattr(theme, name)
    if cursor is None:
        return

    base_frames = cursor.frames
    if not base_frames:
        return

    original_nominal = base_frames[0][0].nominal

    frames_by_size = {}
    for size in sizes:
        scaled = [f.clone() for f in base_frames]
        scaler.apply_to_frames(scaled, scale=size / original_nominal)
        for frame in scaled:
            for img in frame:
                img.nominal = size
        frames_by_size[size] = scaled

    combined = []
    for i in range(len(base_frames)):
        images = []
        delay = base_frames[i].delay
        for size in sizes:
            images.extend(frames_by_size[size][i])
        combined.append(CursorFrame(images, delay))

    result = to_x11(combined)
    canonical = aliases[0]
    with open(output_dir / canonical, 'wb') as f:
        f.write(result)

    for alias in aliases[1:]:
        output = output_dir / alias
        try:
            os.symlink(canonical, output)
        except FileExistsError:
            os.remove(output)
            os.symlink(canonical, output)


def main():
    parser = argparse.ArgumentParser(
        description='Generate Xcursor theme with multiple embedded sizes.')
    parser.add_argument('inf', type=Path, help='Windows cursor theme INF file')
    parser.add_argument('-o', '--output', type=Path, default=os.curdir,
                        help='Output directory for cursor files')
    parser.add_argument('--sizes', type=str, default='24,32,48,64,96',
                        help='Comma-separated nominal sizes (e.g. 24,32,48,64,96)')

    args = parser.parse_args()

    if not args.inf.is_file():
        sys.exit(f'INF file not found: {args.inf}')

    sizes = [int(s.strip()) for s in args.sizes.split(',')]
    if not sizes:
        sys.exit('No sizes specified')

    theme = parse_inf(args.inf)
    if not theme.arrow:
        sys.exit(f'Basic pointer cursor not found in theme: {args.inf}')

    output_dir = args.output
    output_dir.mkdir(parents=True, exist_ok=True)

    with ThreadPool(cpu_count()) as pool:
        pool.starmap(
            process_cursor,
            [(name, aliases, theme, sizes, output_dir)
             for name, aliases in XCURSOR_ALIASES.items()]
        )


if __name__ == '__main__':
    main()
