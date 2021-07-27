#!/usr/bin/env bash

defaults write com.apple.dock springboard-columns -int 9
defaults write com.apple.dock springboard-rows -int 8
killall Dock

# Revert:
# defaults delete com.apple.dock springboard-rows
# defaults delete com.apple.dock springboard-columns
# killall Dock
