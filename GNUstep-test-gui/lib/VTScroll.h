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

@property (nonatomic, strong) VTColumn *contents;

- (void)addSubviewToScroll:(NSView *)view;

@end


#endif /* VTScroll_h */
