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

- (void)updateLayout:(NSRect)frame {

    if ([self.content respondsToSelector:@selector(updateLayout:)]) {
        NSValue *frameValue = [NSValue valueWithRect:frame];
        [self.content performSelector:@selector(updateLayout:) withObject:frameValue];
    }

    NSSize contentSize = self.content.frame.size;
    contentSize.height = MAX(contentSize.height, 1);
    [self.documentView setFrameSize:contentSize];
    [self reflectScrolledClipView:self.contentView];
    [self setFrame:frame];
}



@end