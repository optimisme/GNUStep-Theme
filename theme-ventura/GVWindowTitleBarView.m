#import "GVWindowTitleBarView.h"

@implementation GVWindowTitleBarView

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Inicialització
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
        NSLog(@"GVWindowTitleBarView.m:drawRect - Begin");

    [super drawRect:dirtyRect];

    // Estableix el color de fons de la barra de títol
    [[NSColor colorWithCalibratedRed:0.9 green:0.9 blue:0.9 alpha:1.0] setFill];
    NSRectFill(dirtyRect);

    // Dibuixa la línia de separació entre la barra de títol i el contingut de la finestra
    [[NSColor blackColor] setStroke];
    [NSBezierPath strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect), NSMinY(dirtyRect))
                              toPoint:NSMakePoint(NSMaxX(dirtyRect), NSMinY(dirtyRect))];

    // Dibuixa el text del títol de la finestra
    NSString *title = self.window.title;
    if (title) {
        NSDictionary *attributes = @{NSFontAttributeName: [NSFont systemFontOfSize:14],
                                     NSForegroundColorAttributeName: [NSColor blackColor]};
        NSSize titleSize = [title sizeWithAttributes:attributes];
        NSPoint titleOrigin = NSMakePoint(NSMidX(dirtyRect) - titleSize.width / 2, NSMidY(dirtyRect) - titleSize.height / 2);
        [title drawAtPoint:titleOrigin withAttributes:attributes];
    }
    NSLog(@"GVWindowTitleBarView.m:drawRect - End");
}

@end
