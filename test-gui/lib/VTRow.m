//
//  VTRow.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//
#import "VTRow.h"

@implementation VTRow

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Configuració inicial, si és necessària
    }
    return self;
}

- (BOOL)isFlipped {
    return YES;
}

- (void)addSubview:(NSView *)view {
    [super addSubview:view];
}

- (void)updateLayoutWithWidth:(CGFloat)width {
    CGFloat totalWidth = 0;
    CGFloat totalHeight = 0;
    CGFloat maxHeightInRow = 0;
    CGFloat horizontalSpacing = 10.0;
    CGFloat verticalSpacing = 10.0;
    CGFloat x = 0;
    CGFloat y = 0;

    for (NSView *subview in self.subviews) {
        if (subview.isHidden) continue;

        if ([subview respondsToSelector:@selector(updateLayoutWithWidth:)]) {
            [(id)subview updateLayoutWithWidth:width];
        }

        NSSize subviewSize = subview.frame.size;

        // Check if new row is needed
        if ((x + subviewSize.width) > width) {
            x = 0;
            y += maxHeightInRow + verticalSpacing;
            totalHeight += maxHeightInRow + verticalSpacing;
            maxHeightInRow = 0;
        }

        // Set subview frame
        NSRect subviewFrame = NSMakeRect(x, y, subviewSize.width, subviewSize.height);
        subview.frame = subviewFrame;

        x += subviewSize.width + horizontalSpacing;
        totalWidth = MAX(totalWidth, x);
        maxHeightInRow = MAX(maxHeightInRow, subviewSize.height);
    }

    totalHeight += maxHeightInRow;
    NSSize neededSize = NSMakeSize(width, totalHeight);

    // Update self frame size
    [self setFrameSize:neededSize];
}


@end
