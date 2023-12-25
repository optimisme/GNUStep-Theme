#ifndef GNUstep_GVTHEMECOLORS_H
#define GNUstep_GVTHEMECOLORS_H

#import <Cocoa/Cocoa.h>

NSColor         *GVColorForAccentColorName(NSString *accentColorName);
NSColor         *GVAdjustColor(NSColor *color, CGFloat saturationFactor, CGFloat brightnessFactor);
NSColor         *GVThemeColorRGB(int r, int g, int b, float a);
NSColorList     *GVThemeColors(void);

#endif