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
