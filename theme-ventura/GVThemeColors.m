#import <Cocoa/Cocoa.h>
#import "GVThemeColors.h"

NSColor *GVThemeColorRGB(int r, int g, int b, float a) {
    return [NSColor colorWithCalibratedRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha: a];
}

NSColorList *GVThemeColors(void) {
    static NSColorList *colors = nil;

    if (colors == nil) {
        colors = [[NSColorList alloc] initWithName:@"System" fromFile:nil];

        // Verified values
        [colors setColor: [NSColor whiteColor]                  forKey: @"controlBackgroundColor"]; // Color de menu?
        [colors setColor: GVThemeColorRGB(245, 245, 245, 1.0)   forKey: @"windowBackgroundColor"];
        [colors setColor: GVThemeColorRGB(64, 156, 255, 1.0)    forKey: @"selectedMenuItemColor"];  // TODO: action color
        [colors setColor: [NSColor blackColor]                  forKey: @"selectedMenuItemTextColor"];
        [colors setColor: GVThemeColorRGB(240, 240, 240, 1.0)   forKey: @"selectedControlColor"];   // Color botó apretat
        
        // TODO: List of other colors from: https://github.com/gnustep/libs-gui/blob/master/Source/NSColor.m
    }

    return colors;
}
