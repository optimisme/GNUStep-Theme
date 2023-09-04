include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = TestGUI
TestGUI_APPLICATION_ICON=AppIcon.png

TestGUI_HEADERS = \
  AppDelegate.h \

TestGUI_OBJC_FILES = \
  main.m \
  AppDelegate.m \

TestGUI_RESOURCE_FILES = \
  Resources/AppIcon.png \


ADDITIONAL_CPPFLAGS += -DGNS

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble