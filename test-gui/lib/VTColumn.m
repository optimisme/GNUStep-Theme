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

- (NSSize)sizeForWidth:(CGFloat)width {
    CGFloat maxWidth = 0;
    CGFloat totalHeight = 0;

    for (NSView *subview in self.subviews) {
        if (subview.isHidden) continue;

        NSSize subviewSize;
        if ([subview respondsToSelector:@selector(sizeForWidth:)]) {
            subviewSize = [(id)subview sizeForWidth:width];
        } else {
            subviewSize = subview.frame.size;
        }

        maxWidth = MAX(maxWidth, subviewSize.width);
        totalHeight += subviewSize.height;
    }

    return NSMakeSize(maxWidth, totalHeight);
}

- (void)updateLayoutWithWidth:(CGFloat)width {

    NSSize neededSize = [self sizeForWidth:width];

    NSRect newFrame = NSMakeRect(self.frame.origin.x, self.frame.origin.y, neededSize.width, neededSize.height);
    [self setFrame:newFrame];

    CGFloat y = 0;
    for (NSView *subview in self.subviews) {
        if (subview.isHidden) continue;

        if ([subview respondsToSelector:@selector(updateLayoutWithWidth:)]) {
            [(id)subview updateLayoutWithWidth:width];
        }

        NSSize subviewSize = subview.frame.size;
        NSRect subviewFrame = NSMakeRect(0, y, subviewSize.width, subviewSize.height);
        subview.frame = subviewFrame;

        y += subviewSize.height;
    }
}

@end
