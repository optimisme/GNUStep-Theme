#import "GV+NSWindow.h"
#import "GVTheme.h"
#import "GVWindowTitleBarView.h"
#import "MethodSwizzling.h"

@implementation NSWindow (GVTheme)
/* TODO: Fer que la barra de títol de la finestra sigui com a OSX

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:@selector(initWithContentRect:styleMask:backing:defer:) withMethod:@selector(swizzled_initWithContentRect:styleMask:backing:defer:)];
    });
}

- (instancetype)swizzled_initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)styleMask backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
    NSLog(@"NSWindow+Ventura.m:swizzled_initWithContentRect - Begin");
    self = [self swizzled_initWithContentRect:contentRect styleMask:styleMask backing:backingStoreType defer:flag];
    if (self) {
        NSView *contentView = (NSView *)self.contentView;
        GVWindowTitleBarView *titleBarView = [[GVWindowTitleBarView alloc] initWithFrame:NSMakeRect(0, contentView.bounds.size.height - 22, contentView.bounds.size.width, 22)];
        [contentView addSubview:titleBarView];
    }
    NSLog(@"NSWindow+Ventura.m:swizzled_initWithContentRect - End");
    return self;
}
*/

@end
