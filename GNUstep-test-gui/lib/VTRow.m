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

- (void)updateLayout:(NSRect)frame {

    CGFloat horizontalSpacing = 10.0; // Espaiament horitzontal entre les subvistes
    CGFloat verticalSpacing = 10.0;   // Espaiament vertical entre les files
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat maxHeightInRow = 0;

    for (NSView *subview in self.subviews) {

        NSRect subviewFrame = subview.frame;
        if ((x + subviewFrame.size.width) > self.frame.size.width) {
            x = 0;
            y += maxHeightInRow + verticalSpacing;
            maxHeightInRow = 0;
        }

        subviewFrame.origin = NSMakePoint(x, y);
        subview.frame = subviewFrame;

        x += subviewFrame.size.width + horizontalSpacing;
        maxHeightInRow = MAX(maxHeightInRow, subviewFrame.size.height);
    }

    // Calcula l'alçada total necessària
    CGFloat totalHeight = y + maxHeightInRow;
    totalHeight = MAX(totalHeight, 0);
    
    // Actualitza el frame de la vista VTRow
    NSRect newFrame = NSMakeRect(frame.origin.x, frame.origin.y, frame.size.width, totalHeight);
    [self setFrame:newFrame];
}


@end
