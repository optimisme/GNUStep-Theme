#import "GV+NSMenuItemCell.h"
#import "GVTheme.h"

@interface NSMenuItemCell (GVThemePrivate)
- (NSSize)_sizeKeyEquivalentText:(NSString *)text;
- (NSString *)_keyEquivalentString;
@end

@implementation NSMenuItemCell (GVTheme)

- (void) calcSize
{
  NSSize   componentSize;
  NSImage *anImage = nil;
  CGFloat  neededMenuItemHeight = 20;
 
  // Check if _mcell_belongs_to_popupbutton = NO while cell owned by 
  // popup button. FIXME
  if (!_mcell_belongs_to_popupbutton && [[_menuView menu] _ownedByPopUp])
    {
      _mcell_belongs_to_popupbutton = YES;
      [self setImagePosition: NSImageRight];
    }

  // State Image
  if ([_menuItem changesState])
    {
      // NSOnState
      if ([_menuItem onStateImage])
        componentSize = [[_menuItem onStateImage] size];
      else
        componentSize = NSMakeSize(0,0);
      _stateImageWidth = componentSize.width;
      if (componentSize.height > neededMenuItemHeight)
        neededMenuItemHeight = componentSize.height;

      // NSOffState
      if ([_menuItem offStateImage])
        componentSize = [[_menuItem offStateImage] size];
      else
        componentSize = NSMakeSize(0,0);
      if (componentSize.width > _stateImageWidth)
        _stateImageWidth = componentSize.width;
      if (componentSize.height > neededMenuItemHeight)
        neededMenuItemHeight = componentSize.height;

      // NSMixedState
      if ([_menuItem mixedStateImage])
        componentSize = [[_menuItem mixedStateImage] size];
      else
        componentSize = NSMakeSize(0,0);
      if (componentSize.width > _stateImageWidth)
        _stateImageWidth = componentSize.width;
      if (componentSize.height > neededMenuItemHeight)
        neededMenuItemHeight = componentSize.height;
    }
  else
    {
      _stateImageWidth = 0.0;
    }

  // Image
  if ((anImage = [_menuItem image]) && _cell.image_position == NSNoImage)
    [self setImagePosition: NSImageLeft];
  if (anImage)
    {
      componentSize = [anImage size];
      _imageWidth = componentSize.width;
      if (componentSize.height > neededMenuItemHeight)
        neededMenuItemHeight = componentSize.height;
    }
  else
    {
      _imageWidth = 0.0;
    }

  // Title and Key Equivalent
  componentSize = [self _sizeText: [_menuItem title]];
  _titleWidth = componentSize.width;
  if (componentSize.height > neededMenuItemHeight)
    neededMenuItemHeight = componentSize.height;
  componentSize = [self _sizeKeyEquivalentText: [self _keyEquivalentString]];
  _keyEquivalentWidth = componentSize.width;
  if (componentSize.height > neededMenuItemHeight)
    neededMenuItemHeight = componentSize.height;

  // Submenu Arrow
  if ([_menuItem hasSubmenu])
    {
      NSImage	*arrow = [NSImage imageNamed: @"NSMenuArrow"];

      if (arrow != nil)
	{
          componentSize = [arrow size];
	}
      else
	{
	  componentSize = NSMakeSize(0, 0);
	}
      _keyEquivalentWidth = componentSize.width;
      if (componentSize.height > neededMenuItemHeight)
        neededMenuItemHeight = componentSize.height;
    }

  // Cache definitive height
  _titleWidth = _titleWidth + 50;
  neededMenuItemHeight = neededMenuItemHeight + 50;

  // At the end we set sizing to NO.
  _needs_sizing = NO;
}


@end
