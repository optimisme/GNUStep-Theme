#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

void GVThemeButtonDrawing(NSRect frame, 
                          NSCell *cell, 
                          NSView *view, 
                          int style, 
                          GSThemeControlState state, 
                          GVTheme *theme) {

    CGFloat         padding = 5.0;
    NSRect          paddedFrame = NSInsetRect(frame, padding, padding);
    NSBezierPath    *bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
    NSColor         *bezelColor = [NSColor lightGrayColor];
    NSBezierPath    *borderPath = [NSBezierPath bezierPathWithRect:frame];
    NSColor         *backgroundColor = [NSColor whiteColor]; 

/* Què és això?
    NSString	*name = [theme nameForElement: cell];
    if (name == nil) {
      name = GSStringFromBezelStyle(style);
    }
    NSLog(@"TODO GVThemeButton name %@", name);
    backgroundColor = [theme colorNamed: name state: state];
*/
    
    if (state == GSThemeNormalState) {
        backgroundColor = [NSColor controlBackgroundColor];
    }
    else if (state == GSThemeHighlightedState || state == GSThemeHighlightedFirstResponderState) {
        backgroundColor = [NSColor selectedControlColor];
    }
    else if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
        // This is while the button is being clicked
        backgroundColor = [NSColor selectedControlColor];
    }
    else {
        backgroundColor = [NSColor whiteColor];
    }



    switch (style)
    {
    case NSRoundRectBezelStyle:
        paddedFrame = NSInsetRect(frame, 0.5, padding + 1);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        }
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
        break;
    case NSRoundedBezelStyle:
        [backgroundColor set];
        [bezelPath fill];
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
        break;
    case NSSmallSquareBezelStyle:
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = GVThemeColorRGB(179, 179, 179, 1.0);
        } else {
            backgroundColor = GVThemeColorRGB(247, 247, 247, 1.0);
        }
        [backgroundColor set];
        NSRectFill(frame);
        borderPath = [NSBezierPath bezierPathWithRect:frame];
        bezelColor = GVThemeColorRGB(166, 166, 166, 1.0); // [NSColor colorWithCalibratedHue:0.0 saturation:0.0 brightness:0.2 alpha:1.0];
        [bezelColor setStroke];
        [borderPath setLineWidth:1.0];
        [borderPath stroke];
        break;
    case NSRegularSquareBezelStyle:
        paddedFrame = NSInsetRect(frame, 0.5, padding - 2);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        [backgroundColor set];
        [bezelPath fill];
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
        break;
    case NSShadowlessSquareBezelStyle:
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = GVThemeColorRGB(179, 179, 179, 1.0);
            [backgroundColor set];
            NSRectFill(frame);
        } else {
            NSColor *startColor = GVThemeColorRGB(225, 225, 225, 1.0);
            NSColor *endColor = GVThemeColorRGB(246, 246, 246, 1.0);
            NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];
            [gradient drawInRect:frame angle:90.0]; 
        }
        borderPath = [NSBezierPath bezierPathWithRect:frame];
        bezelColor = GVThemeColorRGB(166, 166, 166, 1.0); // [NSColor colorWithCalibratedHue:0.0 saturation:0.0 brightness:0.2 alpha:1.0];
        [bezelColor setStroke];
        [borderPath setLineWidth:1.0];
        [borderPath stroke];
        break;
    case NSThickerSquareBezelStyle:
        paddedFrame = NSInsetRect(frame, 0.5, padding - 2);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        [backgroundColor set];
        [bezelPath fill];
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
        break;
    case NSThickSquareBezelStyle:
        paddedFrame = NSInsetRect(frame, padding, padding - 2);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        [backgroundColor set];
        [bezelPath fill];
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
        break;
    case NSCircularBezelStyle:
        NSLog(@"TODO GVThemeButton NSCircularBezelStyle");
        break;
    case NSDisclosureBezelStyle:
        NSLog(@"TODO GVThemeButton NSDisclosureBezelStyle");
        break;
    case NSRoundedDisclosureBezelStyle:
        NSLog(@"TODO GVThemeButton NSRoundedDisclosureBezelStyle");
        break;
    case NSHelpButtonBezelStyle:
        NSLog(@"TODO GVThemeButton NSHelpButtonBezelStyle");
        break;

    case NSRecessedBezelStyle:
        paddedFrame = NSInsetRect(frame, 0.5, padding + 1);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.1];
            [backgroundColor set];
            [bezelPath fill];
        }
        break;
    case NSTexturedRoundedBezelStyle:
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            [bezelColor setStroke];
            [bezelPath setLineWidth:1.0];
            [bezelPath stroke];
        }
        break;
    case NSTexturedSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSTexturedSquareBezelStyle");
        paddedFrame = NSInsetRect(frame, 0.5, padding - 2);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            backgroundColor = [[NSColor blackColor] colorWithAlphaComponent:0.1];
            [backgroundColor set];
            [bezelPath fill];
        }
        break;
    default:
        [backgroundColor set];
        [bezelPath fill];
        [bezelColor setStroke];
        [bezelPath setLineWidth:1.0];
        [bezelPath stroke];
    }

   

/* TODO : Revisar perquè la següent shadow no es veu
// BUG https://github.com/gnustep/libs-gui/issues/217

    // Ajustar el frame original per a l'ombra, no el paddedFrame
    NSRect shadowFrame = NSInsetRect(frame, 5.0, 5.0);
    shadowFrame.origin.x += 5.0;
    shadowFrame.origin.y += 5.0;

    // Definir el color de l'ombra
    NSColor *shadowColor = [NSColor redColor];

    // Definir l'ombra
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:shadowColor];
    [shadow setShadowOffset:NSMakeSize(0, -1)];
    [shadow setShadowBlurRadius:10]; 

    // Aplicar l'ombra
    [NSGraphicsContext saveGraphicsState];
    [shadow set];

    // Dibuixar l'ombra (Això dibuixa una "caixa" d'ombra al voltant de l'àrea del botó)
    NSBezierPath *shadowPath = [NSBezierPath bezierPathWithRect:shadowFrame];
    [[NSColor clearColor] set];
    [shadowPath fill];

    // Restaurar l'estat gràfic per a que la configuració de l'ombra no afecti el fons del botó
    [NSGraphicsContext restoreGraphicsState];
*/






    
    // On es dibuixa el titol si no aquí?

/*
    // Dibuixar el text

BUG : https://github.com/gnustep/libs-gui/issues/219 per treure el moviment del text

    NSDictionary *attributes = @{
        NSFontAttributeName: [NSFont systemFontOfSize:[NSFont systemFontSize]],
        NSForegroundColorAttributeName: textColor
    };

    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:[cell title] attributes:attributes];
    NSRect titleRect;
    titleRect.size = [attributedTitle size];
    titleRect.origin.x = NSMidX(paddedFrame) - (titleRect.size.width / 2);
    titleRect.origin.y = NSMidY(paddedFrame) - (titleRect.size.height / 2);

    [attributedTitle drawInRect:titleRect];
     */

}
