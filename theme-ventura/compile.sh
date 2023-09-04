#!/bin/bash

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

make clean

make

make install # GNUSTEP_INSTALLATION_DOMAIN=USER