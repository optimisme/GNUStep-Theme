#ifndef GNUstep_GVTHEMEBUTTON_H
#define GNUstep_GVTHEMEBUTTON_H

#import <Cocoa/Cocoa.h>
#import "GVTheme.h"

void GVThemeButtonDrawing(NSRect frame, 
                          NSCell *cell, 
                          NSView *view, 
                          int style, 
                          GSThemeControlState state, 
                          GVTheme *theme);


#endif