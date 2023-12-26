//
//  VTColumn.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//
#import "VTColumn.h"

@implementation VTColumn

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Configuració inicial si és necessària
    }
    return self;
}

- (void)addSubview:(NSView *)view {
    [super addSubview:view];
}

- (BOOL)isFlipped {
    return YES;
}

- (void)updateLayout {
    NSRect containerFrame = self.frame;
    CGFloat y = 0;

    for (NSView *subview in self.subviews) {
        if ([subview respondsToSelector:@selector(updateLayout)]) {
            [subview setFrame:containerFrame];
            [subview performSelector:@selector(updateLayout)];
        }
        
        NSRect frame = subview.frame;
        frame.origin.y = y;
        frame.origin.x = subview.frame.origin.x;
        subview.frame = frame;

        y += frame.size.height;
    }

    // Actualitza la mida de la vista per ajustar-se al contingut
    NSRect frame = self.frame;
    frame.size.height = y;
    self.frame = frame;
}

@end
