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

- (NSSize)sizeForWidth:(CGFloat)width {
    CGFloat totalWidth = 0;
    CGFloat totalHeight = 0;
    CGFloat maxHeightInRow = 0;
    CGFloat horizontalSpacing = 10.0;
    CGFloat verticalSpacing = 10.0;

    for (NSView *subview in self.subviews) {
        if (subview.isHidden) continue;

        NSSize subviewSize = subview.frame.size;
        if ((totalWidth + subviewSize.width) > width) {
            totalWidth = 0;
            totalHeight += maxHeightInRow + verticalSpacing;
            maxHeightInRow = 0;
        }

        totalWidth += subviewSize.width + horizontalSpacing;
        maxHeightInRow = MAX(maxHeightInRow, subviewSize.height);
    }

    totalHeight += maxHeightInRow;
    return NSMakeSize(width, totalHeight);
}

- (void)updateLayoutWithWidth:(CGFloat)width {
    NSSize neededSize = [self sizeForWidth:width];
    [self setFrameSize:neededSize];

    CGFloat horizontalSpacing = 10.0;
    CGFloat verticalSpacing = 10.0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat maxHeightInRow = 0;
    for (NSView *subview in self.subviews) {
        if (subview.isHidden) continue;

        // Actualizar la subvista si responde a updateLayoutWithWidth:
        if ([subview respondsToSelector:@selector(updateLayoutWithWidth:)]) {
            [(id)subview updateLayoutWithWidth:width];
        }

        // Calcular el tamaño de la subvista
        NSSize subviewSize = subview.frame.size;
        if ((x + subviewSize.width) > width) {
            x = 0;
            y += maxHeightInRow + verticalSpacing;
            maxHeightInRow = 0;
        }

        // Ajustar el frame de la subvista
        NSRect subviewFrame = NSMakeRect(x, y, subviewSize.width, subviewSize.height);
        subview.frame = subviewFrame;

        x += subviewSize.width + horizontalSpacing;
        maxHeightInRow = MAX(maxHeightInRow, subviewSize.height);
    }
}


@end
