#!/usr/bin/env fish

set -l current_layer (niri msg -j layers | jq -r '.[] | select(.namespace | startswith("noctalia-bar")) | .layer')

echo current layer: $current_layer

if test "$current_layer" = Overlay
	echo set layer to Top
    noctalia msg bar-layer-set top > /dev/null
else
	echo set layer to Overlay
    noctalia msg bar-layer-set overlay > /dev/null
end
