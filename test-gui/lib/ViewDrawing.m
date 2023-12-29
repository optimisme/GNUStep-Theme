//
//  ViewDrawing.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 27/12/23.
//

#import "ViewDrawing.h"

@interface ViewDrawing()

@end

@implementation ViewDrawing

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
     // View background color
     NSColor *customColor = [NSColor whiteColor];
     [customColor set];
     NSRectFill(dirtyRect);
     
    
    // Clipped gradient example
    NSColor *startColor = [NSColor greenColor];
    NSColor *endColor = [NSColor blueColor];
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];
    
    NSRect frame = NSMakeRect(50, 50, 100, 50);
    NSBezierPath *bezelPath = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:15.0 yRadius:15.0];
    [NSGraphicsContext saveGraphicsState];
    [bezelPath setClip];
    [gradient drawInRect:frame angle:90.0];
    [NSGraphicsContext restoreGraphicsState];
    
    
    // Star
    NSColor *starStartColor = [NSColor redColor];
    NSColor *starEndColor = [NSColor yellowColor];
    NSGradient *starGradient = [[NSGradient alloc] initWithStartingColor:starStartColor endingColor:starEndColor];
    
    NSBezierPath *starPath = [NSBezierPath bezierPath];
    CGFloat starRadius = 50.0;  // Radi exterior de la estrella
    CGFloat innerRadius = starRadius * sin(M_PI / 10) / sin(7 * M_PI / 10); // Radi interior
    NSPoint center = NSMakePoint(250, 100); // Centre de l'estrella
    
    for (int i = 0; i < 10; i++) {
        // Calculem l'angle per a cada punt
        CGFloat angle = (CGFloat)(2 * M_PI / 10 * i);
        
        // Alternem entre radi exterior i interior
        CGFloat radius = i % 2 == 0 ? starRadius : innerRadius;
        CGFloat x = center.x + sin(angle) * radius;
        CGFloat y = center.y + cos(angle) * radius;
        
        if (i == 0) {
            [starPath moveToPoint:NSMakePoint(x, y)];
        } else {
            [starPath lineToPoint:NSMakePoint(x, y)];
        }
    }
    [starPath closePath];
    
    [NSGraphicsContext saveGraphicsState];
    [starPath setClip];
    [starGradient drawInBezierPath:starPath angle:90.0];
    [NSGraphicsContext restoreGraphicsState];
    
    // 45 degrees Oval
    NSRect ovalRect = NSMakeRect(350, 50, 100, 50);
    NSBezierPath *ovalPath = [NSBezierPath bezierPathWithOvalInRect:ovalRect];
    [NSGraphicsContext saveGraphicsState];
    NSAffineTransform *transform = [NSAffineTransform transform];
    NSPoint centerOval = NSMakePoint(NSMidX(ovalRect), NSMidY(ovalRect));
    [transform translateXBy:centerOval.x yBy:centerOval.y];
    [transform rotateByDegrees:45];
    [transform translateXBy:-centerOval.x yBy:-centerOval.y];
    [ovalPath transformUsingAffineTransform:transform];
    [ovalPath setClip];
    [NSGraphicsContext restoreGraphicsState];
    [gradient drawInBezierPath:ovalPath angle:-25.0];
    
    // Shadow example 0
    NSShadow *shadow0 = [[NSShadow alloc] init];
    [shadow0 setShadowColor:[[NSColor blackColor] colorWithAlphaComponent:0.5]];
    [shadow0 setShadowOffset:NSMakeSize(0, -2)];
    [shadow0 setShadowBlurRadius:2];
    [shadow0 set];
    
    NSRect shadowFrame0 = NSMakeRect(50, 250, 100, 50);
    NSBezierPath *path0 = [NSBezierPath bezierPathWithRoundedRect:shadowFrame0 xRadius:25.0 yRadius:25.0];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path0 fill];
    [NSGraphicsContext restoreGraphicsState];
    
    // Shadow example 1
    NSShadow *shadow1 = [[NSShadow alloc] init];
    [shadow1 setShadowColor:[NSColor blackColor]];
    [shadow1 setShadowOffset:NSMakeSize(5, -15)];
    [shadow1 setShadowBlurRadius:20];
    [shadow1 set];
    
    NSRect shadowFrame1 = NSMakeRect(250, 250, 100, 50);
    NSBezierPath *path1 = [NSBezierPath bezierPathWithRect:shadowFrame1];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path1 fill];
    [NSGraphicsContext restoreGraphicsState];
    
    // Shadow example 2
    NSShadow *shadow2 = [[NSShadow alloc] init];
    [shadow2 setShadowColor:[NSColor blackColor]];
    [shadow2 setShadowOffset:NSMakeSize(5, -15)];
    [shadow2 setShadowBlurRadius:20];
    [shadow2 set];
    NSRect shadowFrame2 = NSMakeRect(450, 250, 100, 50);
    NSBezierPath *path2 = [NSBezierPath bezierPathWithRect:shadowFrame2];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path2 fill];
    [NSGraphicsContext restoreGraphicsState];
    
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    if (self) {
        
        [self updateLayout:frameRect];
    }
    return self;
}

- (BOOL) isFlipped {
    return YES;
}

- (void)updateLayout:(NSRect)frame {
    [self setFrame:frame];
}

@end
