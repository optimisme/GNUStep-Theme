#!/bin/bash

./compile.sh

cd ../GNUstep-test-gui

defaults write NSGlobalDomain GSTheme Ventura

./compileandrun.sh

defaults delete NSGlobalDomain GSTheme

cd ../theme-ventura