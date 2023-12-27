#!/bin/bash

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

make clean

make

cp Resources/*.png TestGUI.app/Resources/

openapp ../test-gui/TestGUI.app
