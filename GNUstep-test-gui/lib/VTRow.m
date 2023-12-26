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

- (void)updateLayout {
    NSRect containerFrame = self.frame;
    CGFloat horizontalSpacing = 10.0; // Espaiament horitzontal entre les subvistes
    CGFloat verticalSpacing = 10.0;   // Espaiament vertical entre les files
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat maxHeightInRow = 0;

    for (NSView *subview in self.subviews) {
        if ([subview respondsToSelector:@selector(updateLayout)]) {
            [subview setFrame:containerFrame];
            [subview performSelector:@selector(updateLayout)];
        }
        
        if (x + subview.frame.size.width > self.frame.size.width) {
            // Comença una nova fila
            x = 0;
            y += maxHeightInRow + verticalSpacing;
            maxHeightInRow = 0;
        }

        NSRect newFrame = NSMakeRect(x, y, subview.frame.size.width, subview.frame.size.height);
        subview.frame = newFrame;

        x += subview.frame.size.width + horizontalSpacing;
        if (subview.frame.size.height > maxHeightInRow) {
            maxHeightInRow = subview.frame.size.height;
        }
    }

    // Calcula l'alçada total necessària
    CGFloat totalHeight = y + maxHeightInRow;

    // Actualitza el frame de la vista VTRow
    self.frame = NSMakeRect(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, totalHeight);
}

@end
