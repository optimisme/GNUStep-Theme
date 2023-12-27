CC=clang
OBJC = clang
ADDITIONAL_OBJCFLAGS += -fobjc-arc
ADDITIONAL_OBJCFLAGS += -DGNS
#ADDITIONAL_CPPFLAGS += -DGNS

include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = TestGUI
TestGUI_APPLICATION_ICON=AppIcon.png

TestGUI_HEADERS = \
  $(wildcard lib/*.h) \
  $(wildcard libInterface/*.h)
TestGUI_OBJC_FILES = \
  $(wildcard lib/*.m) \
  $(wildcard libInterface/*.m) \
  main.m

TestGUI_RESOURCE_FILES = \
  Resources/AppIcon.png \

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble