#import "Animation.h"
#import "AnimationController.h"
#import "GV+NSProgressIndicator.h"
#import "GVTheme.h"

@implementation NSProgressIndicator (GVTheme)

AnimationController *animationController;

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {

        CGFloat wHalf = (self.bounds.size.width / 5.0);
        CGFloat xHalf = ((self.bounds.size.width / 2) - (wHalf / 2));
        CGFloat xEnd = (self.bounds.size.width - 5);

        NSArray *keyframes = @[
            [[NSDictionary alloc] initWithObjectsAndKeys:@(0.0), @"percentage", @("in-sine"), @"timing", @{@"x": @(0.0), @"width": @(5.0)}, @"values", nil],
            [[NSDictionary alloc] initWithObjectsAndKeys:@(50.0), @"percentage", @("in-sine"), @"timing",@{@"x": @(xHalf), @"width": @(wHalf)}, @"values", nil],
            [[NSDictionary alloc] initWithObjectsAndKeys:@(100.0), @"percentage", @("in-sine"), @"timing",@{@"x": @(xEnd), @"width": @(5.0)}, @"values", nil]
        ];

        AnimationData *animationData = [[AnimationData alloc] initWithDuration:2.0 iterations:INFINITY direction:@"alternate" keyframes:keyframes];
        animationController = [[[AnimationController alloc] initWithAnimationData:animationData] retain];
        [animationController start];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {

    [super drawRect:dirtyRect];

    const CGFloat radius = 2;
    const CGFloat progressBarHeight = 5;
    const CGFloat verticalOffset = (self.bounds.size.height - progressBarHeight) / 2;

    // Draw background
    NSRect backgroundRect = NSMakeRect(0, verticalOffset, self.bounds.size.width, progressBarHeight);
    NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRoundedRect:backgroundRect xRadius:radius yRadius:radius];
    NSColor *supportColor = [GVTheme supportColor];
    if (supportColor) {
        [supportColor set];
    }
    [backgroundPath fill];

    // Draw background relief
    NSRect reliefRect = NSMakeRect(0, verticalOffset, self.bounds.size.width, progressBarHeight);
    NSBezierPath *reliefPath = [NSBezierPath bezierPathWithRoundedRect:reliefRect xRadius:radius yRadius:radius];
    NSColor *supportColorRelief = [GVTheme supportColor];
    [reliefPath setLineWidth:0.5];
    if (supportColorRelief) {
        [supportColorRelief set];
    }
    [reliefPath stroke];

    // Draw progress
    CGFloat x = 0.0;
    CGFloat percentage = 0.0;
    CGFloat width = 0.0;
    if (self.isIndeterminate) {
        if (![animationController isEnded]) {
            NSDictionary *propertyValues = [animationController run];
            x = [propertyValues[@"x"] floatValue];
            width = [propertyValues[@"width"] floatValue];
        }
    } else {
        percentage = self.doubleValue / self.maxValue;
        width = self.bounds.size.width * percentage;
    }
    NSRect progressRect = NSMakeRect(x, verticalOffset, width, progressBarHeight);
    NSBezierPath *progressPath = [NSBezierPath bezierPathWithRoundedRect:progressRect xRadius:radius yRadius:radius];
    NSColor *accentColor = [GVTheme accentColor];
    if (accentColor) {
        [accentColor set];
    }
    [progressPath fill];

    if ([animationController isEnded]) {
        [self setNeedsDisplay:NO];
    } else {
        [self setNeedsDisplay:YES];
    }
}

@end
