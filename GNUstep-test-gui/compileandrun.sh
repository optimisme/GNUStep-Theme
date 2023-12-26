#!/bin/bash

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

make clean

make

cp Resources/*.png TestGUI.app/Resources/

openapp ../GNUstep-test-gui/TestGUI.app
