#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

@interface GVTheme ()

@property (nonatomic, strong) NSDictionary *adjustedAccents;

@end


@implementation GVTheme

- (void)activate
{
    [super activate];
    [self GVLoadColorsFromConfigPlist];
}

- (void)GVLoadColorsFromConfigPlist {

    NSArray *roots = @[
        NSHomeDirectory(),
        NSOpenStepRootDirectory(),
        NSTemporaryDirectory(),
        NSHomeDirectory()
    ];

    NSString *plistPath = nil;

    for (NSString *root in roots) {
        NSString *themesPath = [root stringByAppendingPathComponent:@"GNUstep/Library/Themes"];
        NSString *themePath = [themesPath stringByAppendingPathComponent:@"Ventura.theme"];
        NSString *potentialPlistPath = [themePath stringByAppendingPathComponent:@"Resources/config.plist"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:potentialPlistPath]) {
            plistPath = potentialPlistPath;
            break;
        }
    }

    if (plistPath) {
        NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        [self GVSetAccentColor:plistData[@"GVThemeAccentColor"]];
    } else {
        [self GVSetAccentColor:@"Blue"];
    }
}

- (NSColorList*) colors {
    return GVThemeColors(); 
}

- (void)GVSetAccentColor:(NSString *) accentColorName {
    NSColor *themeColor = GVColorForAccentColorName(accentColorName);
    self.adjustedAccents = @{
        @"50": GVAdjustColor(themeColor,1 ,1.5), 
        @"60": GVAdjustColor(themeColor,1 ,1.46), 
        @"70": GVAdjustColor(themeColor,1 ,1.42),
        @"80": GVAdjustColor(themeColor,1 ,1.38), 
        @"90": GVAdjustColor(themeColor,1 ,1.34), 
        @"100": GVAdjustColor(themeColor,1 ,1.3), 
        @"200": GVAdjustColor(themeColor,1 ,1.2), 
        @"300": GVAdjustColor(themeColor,1 ,1.1), 
        @"400": GVAdjustColor(themeColor,1 ,1.0), 
        @"500": GVAdjustColor(themeColor,1 ,0.9), 
        @"600": GVAdjustColor(themeColor,1 ,0.8), 
        @"700": GVAdjustColor(themeColor,1 ,0.7),
        @"800": GVAdjustColor(themeColor,1 ,0.6)
    };
}

- (NSColor *)GVGetAccentColor:(NSString *)shade {
    NSColor *color = self.adjustedAccents[shade];
    if (color) {
        return color;
    } else {
        return self.adjustedAccents[@"400"];
    }
}

- (void) drawButton: (NSRect)frame 
                 in: (NSCell*)cell 
               view: (NSView*)view 
              style: (int)style 
              state: (GSThemeControlState)state {
	GVThemeButtonDrawing(frame, cell, view, style, state, self);
}

- (CGFloat) menuBarHeight
{
  CGFloat height = [[NSUserDefaults standardUserDefaults]
		     floatForKey: @"GSMenuBarHeight"];
  if (height <= 0)
    {
      return 32;
    }
  return height;
}

- (void) drawMenuRect: (NSRect)rect
               inView: (NSView *)view
         isHorizontal: (BOOL)horizontal
            itemCells: (NSArray *)itemCells
{
    int i = 0;
    int howMany = [itemCells count];
    NSMenuView *menuView = (NSMenuView *)view;
    NSRect bounds = [view bounds];
    CGFloat padding = 5.0;
    CGFloat cornerRadius = 10.0; // Ajusta aquest valor per controlar la corba

    // Crear un camí amb cantons arrodonits per tot el fons de la vista del menú
    NSBezierPath *roundedBackground = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: cornerRadius yRadius: cornerRadius];
    [[NSColor windowBackgroundColor] set]; // Canvia el color segons necessitis
    [roundedBackground fill];

    // Draw the menu cells with padding.
    for (i = 0; i < howMany; i++)
    {
        NSRect aRect;
        NSMenuItemCell *aCell;
        
        aRect = [menuView rectOfItemAtIndex: i];

        // Ajustar el rectangle per afegir padding
        if (horizontal) {
            aRect.origin.x += padding;
            aRect.size.width -= padding * 2;
        } else {
            aRect.origin.y += padding;
        }

        if (NSIntersectsRect(rect, aRect) == YES)
        {
            aCell = [menuView menuItemCellForItemAtIndex: i];
            [aCell drawWithFrame: aRect inView: menuView];
        }
    }
}




@end
