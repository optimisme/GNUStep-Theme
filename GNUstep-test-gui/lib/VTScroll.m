//
//  VTScroll.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//

#import "VTScroll.h"

@implementation VTScroll

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contents = [[VTColumn alloc] initWithFrame:NSMakeRect(0, 0, frame.size.width, frame.size.height)];
        self.drawsBackground = NO;
        self.backgroundColor = [NSColor clearColor];
        self.documentView = self.contents;
        self.hasVerticalScroller = YES;
        self.autohidesScrollers = YES;
    }
    return self;
}

- (void)addSubviewToScroll:(NSView *)view {
    [self.contents addSubview:view];
}

@end
