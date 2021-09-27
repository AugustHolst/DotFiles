#!/usr/bin/env bash

ColorsPath="$HOME/.cache/wal/colors"
XMonadPath="$HOME/.xmonad/xmonad.hs"
XMobarPath="$HOME/.config/xmobar/.xmobarrc"

#should check for existence of files with [[ -e FILE ]]

mapfile -t ColArray < ${ColorsPath}

#echo ${ColArray[@]}\n

sed -i~ "
	s/bgColor[[:blank:]]=[[:blank:]]*\"#[a-f0-9]\{6\}\"/bgColor =      \"${ColArray[0]}\"/g
	s/fgColor[[:blank:]]=[[:blank:]]*\"#[a-f0-9]\{6\}\"/fgColor =      \"${ColArray[15]}\"/g
	s/borderColor[[:blank:]]=[[:blank:]]*\"#[a-f0-9]\{6\}\"/borderColor =  \"${ColArray[0]}\"/g" ~/.config/xmobar/.xmobarrc
