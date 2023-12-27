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

- (void)updateLayout:(NSRect)frame {
    CGFloat y = 0;
    for (NSView *subview in self.subviews) {

        if ([subview respondsToSelector:@selector(updateLayout:)]) {
            NSRect viewFrame = NSMakeRect(0, y, frame.size.width, 0);
            NSValue *frameValue = [NSValue valueWithRect:viewFrame];
            [subview performSelector:@selector(updateLayout:) withObject:frameValue];
        }

        NSRect newFrame = NSMakeRect(0, y, subview.frame.size.width, subview.frame.size.height);
        [subview setFrame:newFrame];

        y += subview.frame.size.height;
    }

    // Update the height of the container view
    CGFloat totalHeight = MAX(y, 0); 
    
    NSRect newFrame = NSMakeRect(self.frame.origin.x, self.frame.origin.y, frame.size.width, totalHeight);
    [self setFrame:newFrame];
}

@end
