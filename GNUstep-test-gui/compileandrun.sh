#!/bin/bash

reset

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

make clean

make

openapp ../GNUstep-test-gui/TestGUI.app
