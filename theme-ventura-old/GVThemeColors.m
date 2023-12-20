#import "GVThemeColors.h"

// List of values from: https://github.com/gnustep/plugins-themes-WinUXTheme/blob/1d9a37136b8dfc6dcea811ef28defbe52f954d0d/WinUXTheme.m

NSColor *GVThemeColorRGB(int r, int g, int b, float a) {
    return [NSColor colorWithCalibratedRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha: a];
}
NSColor *GVColorForAccentColorName(NSString *accentColorName) {

    NSColor *blueColor = GVThemeColorRGB(53, 120, 247, 1.0);
    NSColor *purpleColor = GVThemeColorRGB(139, 66, 146, 1.0);
    NSColor *pinkColor = GVThemeColorRGB(229, 92, 156, 1.0);
    NSColor *redColor = GVThemeColorRGB(207, 71, 69, 1.0);
    NSColor *orangeColor = GVThemeColorRGB(232, 136, 58, 1.0);
    NSColor *yellowColor = GVThemeColorRGB(247, 201, 78, 1.0);
    NSColor *greenColor = GVThemeColorRGB(120, 184, 86, 1.0);
    NSColor *graphiteColor = GVThemeColorRGB(153, 152, 152, 1.0);

    NSDictionary *accentColors = @{
        @"Blue": blueColor,
        @"Purple": purpleColor,
        @"Pink": pinkColor,
        @"Red": redColor,
        @"Orange": orangeColor,
        @"Yellow": yellowColor,
        @"Green": greenColor,
        @"Graphite": graphiteColor
    };

    NSColor *color = accentColors[accentColorName];
    return color ? color : accentColors[@"Blue"];
}


NSColorList *GVThemeColorList(void) {
    static NSColorList *colors = nil;

    if (colors == nil) {
        colors = [[NSColorList alloc] initWithName:@"System" fromFile:nil];

        // Verified values
        [colors setColor: GVThemeColorRGB(245, 239, 234, 1.0)  forKey:@"windowBackgroundColor"];
        
        // TODO: Guesses that must be verified
        [colors setColor: [NSColor whiteColor]                 forKey: @"controlBackgroundColor"];
        [colors setColor: GVThemeColorRGB(237, 237, 237, 1.0)  forKey: @"controlColor"];
        [colors setColor: GVThemeColorRGB(255, 255, 255, 1.0)  forKey: @"controlHighlightColor"];
        [colors setColor: GVThemeColorRGB(227, 227, 227, 1.0)  forKey: @"controlLightHighlightColor"];
        [colors setColor: GVThemeColorRGB(186, 186, 186, 1.0)  forKey: @"controlShadowColor"];
        [colors setColor: GVThemeColorRGB(153, 153, 153, 1.0)  forKey: @"controlDarkShadowColor"];
        [colors setColor: GVThemeColorRGB(0, 0, 0, 1.0)        forKey: @"controlTextColor"];
        [colors setColor: GVThemeColorRGB(128, 128, 128, 1.0)  forKey: @"disabledControlTextColor"];
        [colors setColor: [NSColor colorWithCalibratedWhite:0.5 alpha:1.0] forKey: @"gridColor"];
        [colors setColor: [NSColor colorWithCalibratedWhite:0.97 alpha:1.0] forKey: @"headerColor"];
        [colors setColor: [NSColor blackColor]          forKey: @"headerTextColor"];
        [colors setColor: GVThemeColorRGB(64, 156, 255, 1.0)   forKey: @"highlightColor"];
        [colors setColor: [NSColor blackColor]          forKey: @"keyboardFocusIndicatorColor"];
        [colors setColor: GVThemeColorRGB(215, 215, 215, 1.0)  forKey: @"knobColor"];
        [colors setColor: [NSColor blackColor]          forKey: @"labelColor"];
        [colors setColor: GVThemeColorRGB(227, 227, 227, 1.0)  forKey: @"scrollBarColor"];
        [colors setColor: GVThemeColorRGB(64, 156, 255, 1.0)   forKey: @"selectedControlColor"];
        [colors setColor: [NSColor blackColor]          forKey: @"selectedControlTextColor"];
        [colors setColor: GVThemeColorRGB(198, 198, 198, 1.0)  forKey: @"selectedKnobColor"];
        [colors setColor: GVThemeColorRGB(64, 156, 255, 1.0)   forKey: @"selectedMenuItemColor"];
        [colors setColor: [NSColor blackColor]          forKey: @"selectedMenuItemTextColor"];
        [colors setColor: GVThemeColorRGB(64, 156, 255, 1.0)   forKey: @"selectedTextBackgroundColor"];
        [colors setColor: [NSColor whiteColor]          forKey: @"selectedTextColor"];
        [colors setColor: GVThemeColorRGB(186, 186, 186, 1.0)  forKey: @"shadowColor"];
        [colors setColor: [NSColor whiteColor]          forKey: @"textBackgroundColor"];
        [colors setColor: GVThemeColorRGB(0, 0, 0, 1.0)        forKey: @"textColor"];
        [colors setColor: GVThemeColorRGB(64, 64, 64, 1.0)     forKey: @"windowFrameColor"];
        [colors setColor: GVThemeColorRGB(0, 0, 0, 1.0)        forKey: @"windowFrameTextColor"];
        [colors setColor: GVThemeColorRGB(0, 0, 0, 0.5)        forKey: @"alternateSelectedControlColor"];
        [colors setColor: [NSColor whiteColor]          forKey: @"alternateSelectedControlTextColor"];
        [colors setColor: [NSColor whiteColor]          forKey: @"rowBackgroundColor"];
        [colors setColor: [NSColor colorWithCalibratedWhite: 0.94901960784314 alpha: 1.0] forKey: @"alternateRowBackgroundColor"];
        [colors setColor: [NSColor colorWithCalibratedWhite: 0.8 alpha: 1.0] forKey: @"secondarySelectedControlColor"];
        [colors setColor: [NSColor colorWithCalibratedWhite: 0.666667 alpha: 1.0] forKey: @"selectedInactiveColor"];
    }

    return colors;
}
