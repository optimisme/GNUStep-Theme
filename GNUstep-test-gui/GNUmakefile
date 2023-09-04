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

ADDITIONAL_CPPFLAGS += -DGNS

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble