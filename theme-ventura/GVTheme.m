#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

@implementation GVTheme

- (NSColorList*) colors
{
    return GVThemeColorList(); 
}

- (void) drawButton: (NSRect)frame 
                 in: (NSCell*)cell 
               view: (NSView*)view 
              style: (int)style 
              state: (GSThemeControlState)state
{
	[GVThemeButtonDrawing:frame in:cell view:view style:style state:state theme:self];
}

@end
