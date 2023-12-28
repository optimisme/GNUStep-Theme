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
/*
- (void)updateLayout:(NSRect)frame {

    if ([self.content respondsToSelector:@selector(updateLayout:)]) {
        NSValue *frameValue = [NSValue valueWithRect:frame];
        [self.content performSelector:@selector(updateLayout:) withObject:frameValue];
    }

    NSSize contentSize = self.content.frame.size;
    contentSize.width = MAX(contentSize.width, 0);
    contentSize.height = MAX(contentSize.height, 0);
    [self.documentView setFrameSize:contentSize];
    [self reflectScrolledClipView:self.contentView];
    [self setFrame:frame];
}*/

- (void)updateLayout:(NSRect)frame {

    NSSize contentSize;
    if ([self.content respondsToSelector:@selector(sizeForWidth:)]) {
        contentSize = [(id)self.content sizeForWidth:frame.size.width];
    } else {
        contentSize = [self.content intrinsicContentSize];
        if (contentSize.width == NSViewNoIntrinsicMetric || contentSize.height == NSViewNoIntrinsicMetric) {
            contentSize = frame.size;
        }
    }

    [self.content setFrameSize:contentSize];
    contentSize.width = MAX(contentSize.width, 0); 
    contentSize.height = MAX(contentSize.height, 0); 
    [self.documentView setFrameSize:contentSize];
    [self reflectScrolledClipView:self.contentView];
    [self setFrame:frame];

    if ([self.content respondsToSelector:@selector(updateLayoutWithWidth:)]) {
        [(id)self.content updateLayoutWithWidth:frame.size.width];
    }
}


@end