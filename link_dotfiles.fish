#!/usr/bin/env fish


set current_dir (realpath (dirname (status --current-filename)))
echo $current_dir

unlink ~/.config/polybar/config; ln -s "$current_dir"/polybar/config ~/.config/polybar/config
unlink ~/.config/polybar/launch.sh; ln -s "$current_dir"/polybar/launch.sh ~/.config/polybar/launch.sh
