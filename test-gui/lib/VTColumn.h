//
//  VTColumn.h
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//

#ifndef VTColumn_h
#define VTColumn_h

#import <Cocoa/Cocoa.h>

@interface VTColumn : NSView

- (NSSize)sizeForWidth:(CGFloat)width;
- (void)updateLayoutWithWidth:(CGFloat)width;

@end


#endif /* VTColumn_h */
