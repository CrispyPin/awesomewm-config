#!/bin/bash
path=$(xdg-user-dir PICTURES)/screenshots/screenshot-$(date "+%Y.%m.%d-%H:%M:%S").png
mkdir -p $(xdg-user-dir PICTURES)/screenshots
maim -o $path
xclip -selection clipboard -target image/png -i $path
