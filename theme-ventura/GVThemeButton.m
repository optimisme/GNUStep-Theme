#import "GVTheme.h"
#import "GVThemeButton.h"
#import "GVThemePrivate.h"

void GVThemeButtonDrawing(NSRect frame, 
                          NSCell *cell, 
                          NSView *view, 
                          int style, 
                          GSThemeControlState state, 
                          GVTheme *theme) {
  GSDrawTiles	*tiles = nil;
  NSColor	*color = nil;
  NSString	*name = [theme nameForElement: cell];

  if (name == nil)
    {
      name = GSStringFromBezelStyle(style);
    }

  color = [theme colorNamed: name state: state];
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
    color = [NSColor redColor];

  tiles = [theme tilesNamed: name state: state];
  if (tiles == nil)
    {
      tiles = [theme tilesNamed: @"NSButton" state: state];
    }

  if (tiles == nil)
    {
      switch (style)
        {
	  case NSRoundRectBezelStyle:
	  case NSTexturedRoundedBezelStyle:
	  case NSRoundedBezelStyle:
	    [theme drawRoundBezel: frame withColor: color];
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
	    [theme drawCircularBezel: frame withColor: color]; 
	    break;
	  case NSHelpButtonBezelStyle:
	    [theme drawCircularBezel: frame withColor: color];
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
		[theme drawButton: frame withClip: NSZeroRect];
	      }
	    else if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState)
	      {
		[theme drawGrayBezel: frame withClip: NSZeroRect];
	      }
	    else
	      {
		[theme drawButton: frame withClip: NSZeroRect];
	      }
	}
    }
  else
    {
      [theme fillRect: frame
	   withTiles: tiles
	  background: color];
    }
}