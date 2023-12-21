#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemePrivate.h"

void GVThemeButtonDrawing(NSRect frame, 
                          NSCell *cell, 
                          NSView *view, 
                          int style, 
                          GSThemeControlState state, 
                          GVTheme *theme) {

  NSColor	*color = nil;
  NSColor   *backgroundColor = [NSColor whiteColor]; 
  NSColor   *textColor = [NSColor blackColor];

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
        backgroundColor = [NSColor selectedControlColor];
    }
    else {
        backgroundColor = [NSColor whiteColor];
    }

    switch (style)
    {
    case NSRoundRectBezelStyle:
        NSLog(@"TODO GVThemeButton NSRoundRectBezelStyle");
        break;
    case NSTexturedRoundedBezelStyle:
        NSLog(@"TODO GVThemeButton NSTexturedRoundedBezelStyle");
        break;
    case NSRoundedBezelStyle:
        NSLog(@"TODO GVThemeButton NSRoundedBezelStyle");
        break;
    case NSTexturedSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSTexturedSquareBezelStyle");
        break;
    case NSSmallSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSSmallSquareBezelStyle");
        break;
    case NSRegularSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSRegularSquareBezelStyle");
        break;
    case NSShadowlessSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSShadowlessSquareBezelStyle");
        break;
    case NSThickSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSThickSquareBezelStyle");
        break;
    case NSThickerSquareBezelStyle:
        NSLog(@"TODO GVThemeButton NSThickerSquareBezelStyle");
        break;
    case NSCircularBezelStyle:
        NSLog(@"TODO GVThemeButton NSCircularBezelStyle");
        break;
    case NSHelpButtonBezelStyle:
        NSLog(@"TODO GVThemeButton NSHelpButtonBezelStyle");
        break;
    case NSDisclosureBezelStyle:
        NSLog(@"TODO GVThemeButton NSDisclosureBezelStyle");
        break;
    case NSRoundedDisclosureBezelStyle:
        NSLog(@"TODO GVThemeButton NSRoundedDisclosureBezelStyle");
        break;
    case NSRecessedBezelStyle:
        NSLog(@"TODO GVThemeButton NSRecessedBezelStyle");
        break;
    default:
        NSLog(@"TODO GVThemeButton button default");
    }

    // Definir el padding desitjat
    CGFloat padding = 5.0;

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

    // Dibuixar el botó amb el padding
    NSRect paddedFrame = NSInsetRect(frame, padding, padding);

    // Dibuixar el fons del botó
    [backgroundColor set];
    NSBezierPath *bezelPath = [NSBezierPath bezierPathWithRoundedRect:paddedFrame xRadius:5.0 yRadius:5.0];
    [bezelPath fill];

    // Dibuixar el relleu del botó
    NSColor *bezelColor = [NSColor lightGrayColor];  // Relleu gris
    [bezelColor setStroke];
    [bezelPath setLineWidth:1.0];
    [bezelPath stroke];


    
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
