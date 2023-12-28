#!/bin/bash

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

make clean

make

openapp ./TestBUG.app
