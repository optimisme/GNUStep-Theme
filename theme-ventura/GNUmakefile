ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif
ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

#
# Main
#
PACKAGE_NAME = Ventura
BUNDLE_NAME = Ventura
BUNDLE_EXTENSION = .theme
VERSION = 1

Ventura_PRINCIPAL_CLASS = GVenturaTheme
# Ventura_INSTALL_DIR=$(GNUSTEP_LIBRARY)/Themes
Ventura_INSTALL_DIR=$(GNUSTEP_USER_LIBRARY)/Themes
Ventura_RESOURCE_FILES = \
	Resources/config.plist \
	Resources/imgVentura.png \
	Resources/imgVenturaIcon.png \
	Resources/ThemeImages/*

#
# Class files
#
Ventura_OBJC_FILES = \
	AnimationData.m \
	AnimationController.m \
	MethodSwizzling.m \
	GV+NSProgressIndicator.m \
	GV+NSTextField.m \
	GV+NSWindow.m \
	GVThemeColors.m \
	GVWindowTitleBarView.m \
	GVTheme.m

-include GNUmakefile.preamble

include $(GNUSTEP_MAKEFILES)/bundle.make

-include GNUmakefile.postamble