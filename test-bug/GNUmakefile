CC=clang
OBJC = clang
ADDITIONAL_OBJCFLAGS += -fobjc-arc
ADDITIONAL_OBJCFLAGS += -DGNS
#ADDITIONAL_CPPFLAGS += -DGNS

include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = TestBUG
TestBUG_APPLICATION_ICON=AppIcon.png

TestBUG_HEADERS = \
  $(wildcard lib/*.h) \
  $(wildcard libInterface/*.h)

TestBUG_OBJC_FILES = \
  $(wildcard lib/*.m) \
  $(wildcard libInterface/*.m) \
  main.m

TestBUG_RESOURCE_FILES = \
  Resources/*.png \

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble