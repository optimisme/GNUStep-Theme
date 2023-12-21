#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

@implementation GVTheme

- (NSColorList*) colors {
    return GVThemeColors(); 
}

- (void) drawButton: (NSRect)frame 
                 in: (NSCell*)cell 
               view: (NSView*)view 
              style: (int)style 
              state: (GSThemeControlState)state {
	GVThemeButtonDrawing(frame, cell, view, style, state, self);
}

@end
