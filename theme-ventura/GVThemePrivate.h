/** <title>GSThemePrivate</title>

   <abstract>Private utilities for GSTheme</abstract>

   Copyright (C) 2007,2008 Free Software Foundation, Inc.

   Author: Richard Frith-Macdonald <rfm@gnu.org>
   Date:  2007,2008
   
   This file is part of the GNU Objective C User interface library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; see the file COPYING.LIB.
   If not, see <http://www.gnu.org/licenses/> or write to the 
   Free Software Foundation, 51 Franklin Street, Fifth Floor, 
   Boston, MA 02110-1301, USA.
*/
#ifndef	_INCLUDED_GSTHEMEPRIVATE_H
#define	_INCLUDED_GSTHEMEPRIVATE_H

#import	<Foundation/NSProxy.h>
#import	"AppKit/NSPanel.h"
#import "AppKit/NSButtonCell.h"
#import "AppKit/NSSegmentedControl.h"
#import "GNUstepGUI/GSTheme.h"

NSString *GSStringFromBezelStyle(NSBezelStyle bezelStyle);



/** This category defines private methods for internal use by GSTheme
 */
@interface	GSTheme (internal)

// These two drawing method may be made public later on
- (void) drawCircularBezel: (NSRect)cellFrame
		 withColor: (NSColor*)backgroundColor;
         
- (void) drawRoundBezel: (NSRect)cellFrame
	      withColor: (NSColor*)backgroundColor;
@end


#endif
