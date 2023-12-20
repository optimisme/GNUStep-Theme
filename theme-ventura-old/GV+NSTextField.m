#import "GV+NSTextField.h"
#import "GVTheme.h"
#import "MethodSwizzling.h"

@implementation NSTextField (GVTheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:@selector(init) withMethod:@selector(swizzled_init)];
        [self swizzleInstanceMethod:@selector(initWithFrame:) withMethod:@selector(swizzled_initWithFrame:)];
    });
}

- (instancetype)swizzled_init {
    self = [self swizzled_init];
    if (self) {
        [self setTextColor:[NSTextField labelTextColor]];
    }
    return self;
}

- (instancetype)swizzled_initWithFrame:(NSRect)frameRect {
    self = [self swizzled_initWithFrame:frameRect];
    if (self) {
        [self setTextColor:[NSTextField labelTextColor]];

    }
    return self;
}

// TODO: Remove this, just for testing purposes
+ (NSColor *)labelTextColor
{
    return [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:1.0];
}

@end
