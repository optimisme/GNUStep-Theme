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

- (void)updateLayout {
    NSRect containerFrame = self.frame;
    //NSLog(@"Container Frame: %@", NSStringFromRect(containerFrame));
    
    if ([self.content respondsToSelector:@selector(updateLayout)]) {
        [self.content setFrame:containerFrame];
        [self.content performSelector:@selector(updateLayout)];
    }

    [self.documentView setFrameSize:self.content.frame.size];
    [self reflectScrolledClipView:self.contentView];
}

@end