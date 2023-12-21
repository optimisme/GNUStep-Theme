#import "GV+NSButtonCell.h"
#import "GVTheme.h"

@implementation NSButtonCell (GVTheme)

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView*)controlView
{
    
  unsigned mask;
  NSImage *imageToDisplay;
  NSRect imageRect;
  NSAttributedString *titleToDisplay;
  NSRect titleRect;
  NSSize imageSize = {0, 0};
  NSSize titleSize = {0, 0};
  BOOL flippedView = [controlView isFlipped];
  NSCellImagePosition ipos = _cell.image_position;

  // transparent buttons never draw
  if (_buttoncell_is_transparent)
    return;

  _control_view = controlView;

  cellFrame = [self drawingRectForBounds: cellFrame];

  if (_cell.is_highlighted)
    {
      mask = _highlightsByMask;

      if (_cell.state)
        mask &= ~_showAltStateMask;
    }
  else if (_cell.state)
    mask = _showAltStateMask;
  else
    mask = NSNoCellMask;

  if (mask & NSContentsCellMask)
    {
      imageToDisplay = _altImage;
      if (!imageToDisplay)
        {
          imageToDisplay = _cell_image;
        }
      titleToDisplay = [self attributedAlternateTitle];
      if (titleToDisplay == nil || [titleToDisplay length] == 0)
        {
          titleToDisplay = [self attributedTitle];
        }
    }
  else
    {
      imageToDisplay = _cell_image;
      titleToDisplay = [self attributedTitle];
    }

  if (imageToDisplay && ipos != NSNoImage)
    {
      imageSize = [imageToDisplay size];
    }
  else
    {
      // When there is no image to display, ignore it in the calculations
      imageToDisplay = nil;
      ipos = NSNoImage;
    }

  if (titleToDisplay && ipos != NSImageOnly)
    {
      titleSize = [titleToDisplay size];
    }
  else
    {
      // When there is no text to display, ignore it in the calculations
      titleToDisplay = nil;
      ipos = NSImageOnly;
    }

  if (flippedView == YES)
    {
      if (ipos == NSImageAbove)
        {
          ipos = NSImageBelow;
        }
      else if (ipos == NSImageBelow)
        {
          ipos = NSImageAbove;
        }
    }
  

  switch (ipos)
    {
      default:
      case NSNoImage: 
        imageToDisplay = nil;
        titleRect = cellFrame;
         imageRect = NSZeroRect;
        if (titleSize.width + 6 <= titleRect.size.width)
          {
            titleRect.origin.x += 3;
            titleRect.size.width -= 6;
          }
        break;

      case NSImageOnly: 
        titleToDisplay = nil;
        imageRect = cellFrame;
        titleRect = NSZeroRect;
        break;

      case NSImageLeft: 
        imageRect.origin = cellFrame.origin;
        imageRect.size.width = imageSize.width;
        imageRect.size.height = cellFrame.size.height;
        if (_cell.is_bordered || _cell.is_bezeled) 
          {
            imageRect.origin.x += 3;
          }
        titleRect = imageRect;
        titleRect.origin.x += imageSize.width + GSCellTextImageXDist;
        titleRect.size.width = NSMaxX(cellFrame) - titleRect.origin.x;
        if (titleSize.width + 3 <= titleRect.size.width)
          {
            titleRect.size.width -= 3;
          }
        break;

      case NSImageRight: 
        imageRect.origin.x = NSMaxX(cellFrame) - imageSize.width;
        imageRect.origin.y = cellFrame.origin.y;
        imageRect.size.width = imageSize.width;
        imageRect.size.height = cellFrame.size.height;
        if (_cell.is_bordered || _cell.is_bezeled) 
          {
            imageRect.origin.x -= 3;
          }
        titleRect.origin = cellFrame.origin;
        titleRect.size.width = imageRect.origin.x - titleRect.origin.x
                               - GSCellTextImageXDist;
        titleRect.size.height = cellFrame.size.height;
        if (titleSize.width + 3 <= titleRect.size.width)
          {
            titleRect.origin.x += 3;
            titleRect.size.width -= 3;
          }
        break;

      case NSImageAbove: 

        titleRect.origin = cellFrame.origin;
        titleRect.size.width = cellFrame.size.width;
        titleRect.size.height = titleSize.height;
        if (_cell.is_bordered || _cell.is_bezeled) 
          {
            titleRect.origin.y += 3;
          }

        imageRect.origin.x = cellFrame.origin.x;
        imageRect.origin.y = NSMaxY(titleRect) + GSCellTextImageYDist;
        imageRect.size.width = cellFrame.size.width;
        imageRect.size.height = NSMaxY(cellFrame) - imageRect.origin.y;

        if (_cell.is_bordered || _cell.is_bezeled) 
          {
            imageRect.size.height -= 3;
          }
        if (titleSize.width + 6 <= titleRect.size.width)
          {
            titleRect.origin.x += 3;
            titleRect.size.width -= 6;
          }
        break;

      case NSImageBelow: 

        titleRect.origin.x = cellFrame.origin.x;
        titleRect.origin.y = NSMaxY(cellFrame) - titleSize.height;
        titleRect.size.width = cellFrame.size.width;
        titleRect.size.height = titleSize.height;
        if (_cell.is_bordered || _cell.is_bezeled)
          {
            titleRect.origin.y -= 3;
          }

        imageRect.origin.x = cellFrame.origin.x;
        imageRect.origin.y = cellFrame.origin.y;
        imageRect.size.width = cellFrame.size.width;
        imageRect.size.height
          = titleRect.origin.y - GSCellTextImageYDist - imageRect.origin.y;

        if (_cell.is_bordered || _cell.is_bezeled) 
          {
            imageRect.origin.y += 3;
            imageRect.size.height -= 3;
          }
        if (titleSize.width + 6 <= titleRect.size.width)
          {
            titleRect.origin.x += 3;
            titleRect.size.width -= 6;
          }
        break;

      case NSImageOverlaps: 
        imageRect = cellFrame;
        titleRect = cellFrame;
        if (titleSize.width + 6 <= titleRect.size.width)
          {
            titleRect.origin.x += 3;
            titleRect.size.width -= 6;
          }
        break;
    }

  // Draw image
  if (imageToDisplay != nil)
    {
      [self drawImage: imageToDisplay
            withFrame: imageRect
               inView: controlView];
    }

  // Draw title
  if (titleToDisplay != nil)
    {
       [self drawTitle: titleToDisplay withFrame: titleRect inView: controlView];
    }
}

@end