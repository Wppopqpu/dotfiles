---
name: customize-user-config
description: Manage all user configuration files. Use this skill whenever the user asks to modify, create, or delete ANY configuration file - including app configs, shell configs, dotfiles, system files, or scripts. Covers ~/dotfiles/*, ~/etcfiles/*, ~/.config/*, ~/scripts/*, and ~/projects/chezfl/*.
license: MIT
compatibility: opencode
metadata:
  category: workflow
  scope: configuration
---

# Customize User Config

The user's configuration lives in three repositories with different deployment
mechanisms and different safety boundaries. Pick the right tier, respect its
boundary, and hand the commit back to the user.

## Three tiers

| Tier | Repo | Deploys to | Mechanism | Who runs it |
|------|------|-----------|-----------|-------------|
| User dotfiles | `~/dotfiles/<package>/` | `~` (symlinks) | GNU Stow, one package per app | You may run `stow` |
| System files | `~/etcfiles/<package>/` | `/etc`, `/usr` | `~/etcfiles/update_etc.fish` (needs sudo) | **User only** |
| System state | `~/projects/chezfl/src/bin/chezfl.rs` | packages, repos, services | `cargo run -- apply` (Rust, edition 2024) | You may run `check`/`plan`; `apply` only on request |

Each stow package mirrors the target layout, e.g.
`~/dotfiles/fish/.config/fish/config.fish` → `~/.config/fish/config.fish`.
Scripts live in `~/dotfiles/utils/scripts/` and are stowed to `~/scripts/`.
External projects are git submodules under `~/dotfiles/<pkg>/projects/<name>/`
(or `src/`) and stow to `~/projects` / `~/src`.

## Where does this config go?

```
Reusable script?                    → ~/dotfiles/utils/scripts/<name>.fish
Root-owned file under /etc or /usr? → ~/etcfiles/<package>/<full path>
External project (not your config)? → submodule in ~/dotfiles/<pkg>/projects/, then stow
Stateful action (install package,
  clone repo, enable service)?      → chezfl target + task (cfg branch)
Anything else in ~                  → ~/dotfiles/<package>/ + stow
```

## Hard constraints

- **Never `git add`, `git commit`, or `git push`.** The user decides when to
  commit. `git status`/`diff`/`log`/`branch` are fine, and `git submodule add`
  and `git checkout` are allowed because the workflows below need them.
- **Never run `update_etc.fish`.** It needs sudo and touches the live system;
  tell the user the etcfiles change is ready and suggest previewing with `-p`.
- **chezfl: check the branch before editing.** Personal config is on `cfg`;
  `main` is the upstream library. Run `git branch` first; if not on `cfg`,
  stop and ask the user before doing anything else.
- **Edit in `~/dotfiles`, not in `~`.** Files in `~` are symlinks; editing the
  repo copy keeps git history meaningful.
- **Run `add_stowed_flags.fish` from inside `~/dotfiles`** after creating a
  new package. It writes the `.stowed/<package>` marker that tracks
  deployment and only works with `~/dotfiles` as cwd.
- **Don't delete unused scripts or configs.** The user keeps them in the repo
  for reference; move or comment out instead.
- **Dry-run first.** `stow -n -v` and `cargo run -- plan` are cheap and show
  exactly what will change.

## Quick reference

### Stow

```bash
stow -n -v -d ~/dotfiles -t ~ <pkg>   # preview
stow -d ~/dotfiles -t ~ <pkg>         # deploy
stow -R -d ~/dotfiles -t ~ <pkg>      # re-stow after adding files
stow -D -d ~/dotfiles -t ~ <pkg>      # remove
cd ~/dotfiles && ./utils/scripts/add_stowed_flags.fish   # after new package
```

Conflict ("existing target is not owned by stow"): inspect with `ls -la`,
then either back up / remove the real file and re-stow, or use
`stow --adopt` and immediately `git diff` in `~/dotfiles`. `--adopt` moves
the file from `~` into the package, overwriting the repo copy, so review
before accepting.

### New script

Create `~/dotfiles/utils/scripts/<name>.fish` with `#!/bin/fish`, `chmod +x`,
then `stow -R utils` so it appears at `~/scripts/<name>.fish`.

### External project

```bash
cd ~/dotfiles
mkdir -p <pkg>/projects
git submodule add <url> <pkg>/projects/<name>
stow -d ~/dotfiles -t ~ <pkg>
```

### etcfiles

Place the file at `~/etcfiles/<pkg>/<absolute path without leading slash>`
(e.g. `~/etcfiles/locale/etc/locale.conf`). Do not deploy; report it as ready.

### chezfl

```bash
cd ~/projects/chezfl
git branch                 # must show * cfg
cargo run -- check         # target satisfaction
cargo run -- plan          # what apply would do
cargo run -- apply --label <label>   # only if user asks
```

Before writing a target/task, read `CONTEXT.md` (domain glossary) and skim
`examples/` for the current `Target`/`Task`/`tools::*` API rather than
guessing signatures. Tasks run at most once per apply and there is no
rollback, so keep `plan` output in front of the user before `apply`.

## Finishing

State which paths changed in which repo, and suggest a commit message.
Example: "Added `~/dotfiles/foot/.config/foot/foot.ini` and stowed it.
Suggested commit in ~/dotfiles: `foot: add initial config`."
