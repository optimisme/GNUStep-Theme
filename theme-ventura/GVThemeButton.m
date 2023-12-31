#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

// https://mackuba.eu/2014/10/06/a-guide-to-nsbutton-styles/

/* List of related bugs
    https://github.com/gnustep/libs-gui/issues/219 prevent text movement
    https://github.com/gnustep/libs-gui/issues/224 NSCircularBezelStyle should cut text
    https://github.com/gnustep/libs-gui/issues/227 theming accpet button
    https://github.com/gnustep/libs-gui/issues/217 shadow not working
*/

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
    NSColor         *textColor = [NSColor blackColor];

    // For customizing the text and action cells
    NSMutableParagraphStyle *paragraphStyle;
    NSDictionary *attributes;
    NSAttributedString *coloredTitle;
    NSButtonCell *buttonCell = nil;
    NSString *keyEquivalent;
    if ([cell isKindOfClass:[NSButtonCell class]]) {
        buttonCell = (NSButtonCell *) cell;
        keyEquivalent = [buttonCell keyEquivalent];
    }

    // For circular buttons (and chevron square)
    CGFloat diameter = MIN(frame.size.width, frame.size.height) - ((padding * 2) - 2);
    NSRect circleSquareRect = NSMakeRect(frame.origin.x, frame.origin.y, diameter, diameter);
    circleSquareRect.origin.x += (frame.size.width - diameter) / 2;
    circleSquareRect.origin.y += (frame.size.height - diameter) / 2;
    NSBezierPath *circlePath = [NSBezierPath bezierPathWithOvalInRect:circleSquareRect];
    NSBezierPath *squarePath = [NSBezierPath bezierPathWithRoundedRect:circleSquareRect xRadius:5.0 yRadius:5.0];

    // For chevron arrows and help
    NSPoint center = NSMakePoint(NSMidX(frame), NSMidY(frame));
    NSBezierPath *chevronPath = [NSBezierPath bezierPath];
    CGFloat chevronWidth = 2.5;
    CGFloat chevronHeight = 5.0;
    NSString *questionMark = @"?";

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
        backgroundColor = [NSColor controlBackgroundColor];
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
    case NSRegularSquareBezelStyle:
    case NSThickerSquareBezelStyle:
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
        [backgroundColor set];
        [circlePath fill];
        [bezelColor setStroke];
        [circlePath setLineWidth:1.0];
        [circlePath stroke];
        break;
    case NSDisclosureBezelStyle:
        if (cell.state == NSOffState) {
            // Dibuixa chevron mirant a la dreta
            [chevronPath moveToPoint:NSMakePoint(center.x - chevronWidth, center.y + chevronHeight)];
            [chevronPath lineToPoint:NSMakePoint(center.x + chevronWidth, center.y)];
            [chevronPath lineToPoint:NSMakePoint(center.x - chevronWidth, center.y - chevronHeight)];
        } else {
            // Dibuixa chevron mirant avall
            [chevronPath moveToPoint:NSMakePoint(center.x - chevronHeight, center.y - chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x, center.y + chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x + chevronHeight, center.y - chevronWidth)];
        }

        // Estableix el dibuix
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            bezelColor = GVThemeColorRGB(64, 64, 64, 1.0);
        } else {
            bezelColor = GVThemeColorRGB(128, 128, 128, 1.0);
        }
        [bezelColor setStroke];
        [chevronPath setLineWidth:2.0];
        [chevronPath stroke];
        break;
    case NSRoundedDisclosureBezelStyle:
        [backgroundColor set];
        [squarePath fill];
        [bezelColor setStroke];
        [squarePath setLineWidth:1.0];
        [squarePath stroke];
        if (cell.state == NSOffState) {
            // Dibuixa chevron mirant avall
            [chevronPath moveToPoint:NSMakePoint(center.x - chevronHeight, center.y - chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x, center.y + chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x + chevronHeight, center.y - chevronWidth)];
        } else {
            // Dibuixa chevron mirant amunt
            [chevronPath moveToPoint:NSMakePoint(center.x - chevronHeight, center.y + chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x, center.y - chevronWidth)];
            [chevronPath lineToPoint:NSMakePoint(center.x + chevronHeight, center.y + chevronWidth)];
        }

        // Estableix el dibuix
        bezelColor = GVThemeColorRGB(35, 35, 35, 1.0);
        [bezelColor setStroke];
        [chevronPath setLineWidth:2.0];
        [chevronPath stroke];
        break;
    case NSHelpButtonBezelStyle:
        [backgroundColor set];
        [circlePath fill];
        [bezelColor setStroke];
        [circlePath setLineWidth:1.0];
        [circlePath stroke];

        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setAlignment:NSTextAlignmentCenter];
        attributes = @{NSFontAttributeName: [NSFont systemFontOfSize:diameter / 1.40],
                                    NSForegroundColorAttributeName: textColor,
                                    NSParagraphStyleAttributeName: paragraphStyle};

        // Calcular el rectangle centrat per al text
        questionMark = @"?";
        NSSize textSize = [questionMark sizeWithAttributes:attributes];
        NSRect textRect = NSMakeRect(circleSquareRect.origin.x,
                                    circleSquareRect.origin.y + (diameter - textSize.height) / 2,
                                    diameter,
                                    textSize.height);

        // Dibuixar el signe d'interrogació dins del cercle
        [questionMark drawInRect:textRect withAttributes:attributes];
        break;
    case NSRecessedBezelStyle:
        paddedFrame = NSInsetRect(frame, 0.5, padding + 1);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor lightGrayColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            backgroundColor = [[NSColor lightGrayColor] colorWithAlphaComponent:0.1];
            [backgroundColor set];
            [bezelPath fill];
        }
        if (buttonCell != nil) {
            textColor = GVThemeColorRGB(111, 111, 111, 1.0);
            paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            attributes = @{
                NSForegroundColorAttributeName: textColor,
                NSParagraphStyleAttributeName: paragraphStyle,
            };
            coloredTitle = [[NSAttributedString alloc] initWithString:[cell title] attributes:attributes];
            [buttonCell setAttributedTitle:coloredTitle];
        }
        break;
    case NSTexturedRoundedBezelStyle:
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor lightGrayColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            [bezelColor setStroke];
            [bezelPath setLineWidth:0.5];
            [bezelPath stroke];
        }
        if (buttonCell != nil) {
            textColor = GVThemeColorRGB(111, 111, 111, 1.0);
            paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            attributes = @{
                NSForegroundColorAttributeName: textColor,
                NSParagraphStyleAttributeName: paragraphStyle,
            };
            coloredTitle = [[NSAttributedString alloc] initWithString:[cell title] attributes:attributes];
            [buttonCell setAttributedTitle:coloredTitle];
        }
        break;
    case NSTexturedSquareBezelStyle:
        bezelColor = GVThemeColorRGB(111, 111, 111, 1.0);
        paddedFrame = NSInsetRect(frame, 0.5, padding - 2);
        bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
        if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
            backgroundColor = [[NSColor lightGrayColor] colorWithAlphaComponent:0.15];
            [backgroundColor set];
            [bezelPath fill];
        } else {
            backgroundColor = [[NSColor lightGrayColor] colorWithAlphaComponent:0.1];
            [backgroundColor set];
            [bezelPath fill];
        }
        if (buttonCell != nil) {
            textColor = bezelColor;
            paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            attributes = @{
                NSForegroundColorAttributeName: textColor,
                NSParagraphStyleAttributeName: paragraphStyle,
            };
            coloredTitle = [[NSAttributedString alloc] initWithString:[cell title] attributes:attributes];
            [buttonCell setAttributedTitle:coloredTitle];
        }
        break;
    default:

        if (buttonCell != nil && keyEquivalent != nil && [keyEquivalent isEqualToString:@"\r"]) {
            // Accept button style is different
            textColor = [NSColor whiteColor];
            paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            attributes = @{
                NSForegroundColorAttributeName: textColor,
                NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName: [NSFont boldSystemFontOfSize:[NSFont systemFontSize]]
            };
            coloredTitle = [[NSAttributedString alloc] initWithString:[cell title] attributes:attributes];
            [buttonCell setAttributedTitle:coloredTitle];
            //backgroundColor = GVThemeColorRGB(0, 122, 255, 1.0);
            NSColor *startColor = [theme GVGetAccentColor:@"100"];
            NSColor *endColor = [theme GVGetAccentColor:@"default"];
            NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];

            [NSGraphicsContext saveGraphicsState];
            [bezelPath setClip];
            [gradient drawInRect:frame angle:90.0]; 
            [NSGraphicsContext restoreGraphicsState];

            // Remove 'new line' image
            [cell setImage: nil];
            //NSImage *originalImage = AUTORELEASE(RETAIN([cell image]));
            //[cell setImage: originalImage];
        } else {
            [backgroundColor set];
            [bezelPath fill];
            [bezelColor setStroke];
            [bezelPath setLineWidth:1.0];
            [bezelPath stroke];
        }
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
}
