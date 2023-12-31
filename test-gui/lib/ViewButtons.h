//
//  ViewButtons.h
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#ifndef ViewButtons_h
#define ViewButtons_h

#import <Cocoa/Cocoa.h>
#import "Constants.h"
#import "ViewButtonsPopOver.h"
#import "VTColumn.h"
#import "VTRow.h"
#import "VTScroll.h"

@interface ViewButtons : NSView

- (void)updateLayoutWithFrame:(NSRect)frame;

@end


#endif /* ViewButtons_h */
