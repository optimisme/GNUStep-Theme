//
//  VTScroll.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//

#import "VTScroll.h"

@implementation VTScroll

- (instancetype)initWithFrame:(NSRect)frame content:(NSView *)content {
    self = [super initWithFrame:frame];
    if (self) {
        self.content = content;
        self.drawsBackground = NO;
        self.backgroundColor = [NSColor clearColor];
        self.documentView = content;
        self.hasVerticalScroller = YES;
        self.autohidesScrollers = YES;
    }
    return self;
}

- (void)updateLayoutWithFrame:(NSRect)frame {
    // Accommodate content to new size
    if ([self.content respondsToSelector:@selector(updateLayoutWithWidth:)]) {
        [(id)self.content updateLayoutWithWidth:frame.size.width];
    }

    // Update layout
    NSSize contentSize = self.content.frame.size;
    [self.documentView setFrameSize:contentSize];
    [self reflectScrolledClipView:self.contentView];

    // Verifica si el nuevo frame es diferente del actual
    if (!NSEqualRects(self.frame, frame)) {
        [self setFrame:frame];
    }
    
    //NSLog(@"frame: %@ - %@", NSStringFromRect( self.content.frame), NSStringFromRect(frame));
}



@end