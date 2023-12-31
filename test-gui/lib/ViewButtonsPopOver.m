//
//  ViewButtonsPopOver.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 27/12/23.
//

#import "ViewButtonsPopOver.h"

@interface ViewButtonsPopOver()

@end

@implementation ViewButtonsPopOver

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
     // View background color
     NSColor *customColor = [NSColor greenColor];
     [customColor set];
     NSRectFill(dirtyRect);
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    if (self) {
        
        [self updateLayout:frameRect];
    }
    return self;
}

- (BOOL) isFlipped {
    return YES;
}

- (void)updateLayout:(NSRect)frame {
    [self setFrame:frame];
}

@end
