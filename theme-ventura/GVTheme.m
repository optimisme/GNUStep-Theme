#import "GVTheme.h"
#import "GVThemeColors.h"
#import "GVThemePrivate.h"

@implementation GVTheme

- (NSColorList*) colors
{
    return GVThemeColorList(); 
}

- (void) drawButton: (NSRect)frame 
                 in: (NSCell*)cell 
               view: (NSView*)view 
              style: (int)style 
              state: (GSThemeControlState)state
{
  GSDrawTiles	*tiles = nil;
  NSColor	*color = nil;
  NSString	*name = [self nameForElement: cell];

  if (name == nil)
    {
      name = GSStringFromBezelStyle(style);
    }

  color = [self colorNamed: name state: state];
  if (color == nil)
    {
      if (state == GSThemeNormalState)
	{
          color = [NSColor controlBackgroundColor];
	}
      else if (state == GSThemeHighlightedState
	       || state == GSThemeHighlightedFirstResponderState)
	{
          color = [NSColor selectedControlColor];
	}
      else if (state == GSThemeSelectedState
	       || state == GSThemeSelectedFirstResponderState)
	{
          color = [NSColor selectedControlColor];
	}
      else
    	{
          color = [NSColor controlBackgroundColor];
	}
    }
    color = [NSColor greenColor];

  tiles = [self tilesNamed: name state: state];
  if (tiles == nil)
    {
      tiles = [self tilesNamed: @"NSButton" state: state];
    }

  if (tiles == nil)
    {
      switch (style)
        {
	  case NSRoundRectBezelStyle:
	  case NSTexturedRoundedBezelStyle:
	  case NSRoundedBezelStyle:
	    [self drawRoundBezel: frame withColor: color];
	    break;
	  case NSTexturedSquareBezelStyle:
	    frame = NSInsetRect(frame, 0, 1);
	  case NSSmallSquareBezelStyle:
	  case NSRegularSquareBezelStyle:
	  case NSShadowlessSquareBezelStyle:
	    [color set];
	    NSRectFill(frame);
	    [[NSColor controlShadowColor] set];
	    NSFrameRectWithWidth(frame, 1);
	    break;
	  case NSThickSquareBezelStyle:
	    [color set];
	    NSRectFill(frame);
	    [[NSColor controlShadowColor] set];
	    NSFrameRectWithWidth(frame, 1.5);
	    break;
	  case NSThickerSquareBezelStyle:
	    [color set];
	    NSRectFill(frame);
	    [[NSColor controlShadowColor] set];
	    NSFrameRectWithWidth(frame, 2);
	    break;
	  case NSCircularBezelStyle:
	    frame = NSInsetRect(frame, 3, 3);
	    [self drawCircularBezel: frame withColor: color]; 
	    break;
	  case NSHelpButtonBezelStyle:
	    [self drawCircularBezel: frame withColor: color];
	    {
	      NSDictionary *attributes = [NSDictionary dictionaryWithObject: [NSFont controlContentFontOfSize: 0]
								     forKey: NSFontAttributeName];
	      NSAttributedString *questionMark = [[[NSAttributedString alloc]
						    initWithString: _(@"?")
							attributes: attributes] autorelease];

	      NSRect textRect;
	      textRect.size = [questionMark size];
	      textRect.origin.x = NSMidX(frame) - (textRect.size.width / 2);
	      textRect.origin.y = NSMidY(frame) - (textRect.size.height / 2);

	      [questionMark drawInRect: textRect];
	    }
	    break;
	  case NSDisclosureBezelStyle:
	  case NSRoundedDisclosureBezelStyle:
	  case NSRecessedBezelStyle:
	    // FIXME
	    break;
	  default:
	    [color set];
	    NSRectFill(frame);

	    if (state == GSThemeNormalState || state == GSThemeHighlightedState)
	      {
		[self drawButton: frame withClip: NSZeroRect];
	      }
	    else if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState)
	      {
		[self drawGrayBezel: frame withClip: NSZeroRect];
	      }
	    else
	      {
		[self drawButton: frame withClip: NSZeroRect];
	      }
	}
    }
  else
    {
      /* Use tiles to draw button border with central part filled with color
       */
      [self fillRect: frame
	   withTiles: tiles
	  background: color];
    }
}

@end
