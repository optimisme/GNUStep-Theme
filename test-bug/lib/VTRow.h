//
//  VTRow.h
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 24/12/23.
//

#ifndef VTRow_h
#define VTRow_h

#import <Cocoa/Cocoa.h>

@interface VTRow : NSView

- (NSSize)sizeForWidth:(CGFloat)width;
- (void)updateLayoutWithWidth:(CGFloat)width;

@end



#endif /* VTRow_h */
