//
//  VTScroll.h
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//

#ifndef VTScroll_h
#define VTScroll_h

#import <Cocoa/Cocoa.h>
#import "VTColumn.h"

@interface VTScroll : NSScrollView

@property (nonatomic, strong) NSView *content;

- (instancetype)initWithFrame:(NSRect)frame content:(NSView *)content;
- (void)updateLayout:(NSRect)frame;

@end


#endif /* VTScroll_h */
