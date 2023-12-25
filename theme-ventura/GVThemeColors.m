#import <Cocoa/Cocoa.h>
#import "GVThemeColors.h"

NSColor *GVColorForAccentColorName(NSString *accentColorName) {

    NSColor *blueColor = GVThemeColorRGB(0, 122, 256, 1.0);
    NSColor *purpleColor = GVThemeColorRGB(175, 82, 222, 1.0);
    NSColor *pinkColor = GVThemeColorRGB(255, 45, 85, 1.0);
    NSColor *redColor = GVThemeColorRGB(255, 59, 48, 1.0);
    NSColor *orangeColor = GVThemeColorRGB(255, 149, 0, 1.0);
    NSColor *yellowColor = GVThemeColorRGB(255, 204, 0, 1.0);
    NSColor *greenColor = GVThemeColorRGB(52, 199, 89, 1.0);
    NSColor *graphiteColor = GVThemeColorRGB(142, 142, 147, 1.0);

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

NSColor *GVAdjustColor(NSColor *color, CGFloat saturationFactor, CGFloat brightnessFactor) {
    CGFloat hue, saturation, brightness, alpha;
    
    // Convertim el color a l'espai HSB
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

    // Ajustem la saturació i la lluminositat
    saturation = MIN(MAX(saturation * saturationFactor, 0.0), 1.0);
    brightness = MIN(MAX(brightness * brightnessFactor, 0.0), 1.0);

    // Creem i retornem el color ajustat
    return [NSColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

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
        [colors setColor: GVThemeColorRGB(238, 238, 238, 1.0)   forKey: @"selectedControlColor"];   // Color botó apretat
        
        // TODO: List of other colors from: https://github.com/gnustep/libs-gui/blob/master/Source/NSColor.m
    }

    return colors;
}
