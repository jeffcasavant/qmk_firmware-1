#! /usr/bin/env bash

layoutfile="$1"
keeb=keebio/viterbi
rev=/rev2
layout=jeff
programmer=dfu
twice=1

qmk json2c "$layoutfile" >"keyboards/${keeb}/keymaps/${layout}/keymap.c"

cmd="make ${keeb}${rev}:${layout}:${programmer}"

$cmd

if [[ $twice ]]; then
    echo "Press enter to program 2nd half"
    read -r
    $cmd
fi
