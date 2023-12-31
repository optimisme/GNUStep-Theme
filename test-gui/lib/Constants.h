//
//  Constants.h
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#ifndef Constants_h
#define Constants_h

#ifdef GNS

#define CTBezelStyleAccessoryBarAction NSRoundRectBezelStyle
#define CTBezelStyleRounded NSRoundedBezelStyle
#define CTBezelStyleSmallSquare NSSmallSquareBezelStyle
#define CTBezelStyleFlexiblePush NSRegularSquareBezelStyle // Same as : NSThickerSquareBezelStyle, NSThickSquareBezelStyle
#define CTBezelStyleShadowlessSquare NSShadowlessSquareBezelStyle
#define CTBezelStyleCircular NSCircularBezelStyle
#define CTBezelStyleDisclosure NSDisclosureBezelStyle
#define CTBezelStylePushDisclosure NSRoundedDisclosureBezelStyle
#define CTBezelStyleHelpButton NSHelpButtonBezelStyle
#define CTBezelStyleAccessoryBar NSRecessedBezelStyle
#define CTBezelStyleTexturedSquare NSTexturedSquareBezelStyle
#define CTBezelStyleTexturedRounded NSTexturedRoundedBezelStyle
#define CTBezelStyleToolbar NSTexturedRoundedBezelStyle
#define CTBezelStyleInline 15 // NSInlineBezelStyle

#define CTButtonTypeMomentaryPushIn NSMomentaryPushInButton
#define CTButtonTypePushOnPushOff NSPushOnPushOffButton
#define CTButtonTypeOnOff NSOnOffButton
#define CTButtonTypeToggle NSToggleButton
#define CTButtonTypeSwitch NSSwitchButton
#define CTButtonTypeRadio NSRadioButton
#define NSButtonTypeToggle NSToggleButton

#define CTControlStateValueOn NSControlStateValueOn
#define CTCompositingOperationCopy NSCompositeCopy

#else

#define CTBezelStyleRounded NSBezelStyleRounded
#define CTBezelStyleAccessoryBarAction NSBezelStyleAccessoryBarAction
#define CTBezelStyleSmallSquare NSBezelStyleSmallSquare
#define CTBezelStyleFlexiblePush NSBezelStyleFlexiblePush
#define CTBezelStyleShadowlessSquare NSBezelStyleShadowlessSquare
#define CTBezelStyleCircular NSBezelStyleCircular
#define CTBezelStyleDisclosure NSBezelStyleDisclosure
#define CTBezelStylePushDisclosure NSBezelStylePushDisclosure
#define CTBezelStyleHelpButton NSBezelStyleHelpButton
#define CTBezelStyleAccessoryBar NSBezelStyleAccessoryBar
#define CTBezelStyleTexturedSquare NSBezelStyleTexturedSquare
#define CTBezelStyleTexturedRounded NSBezelStyleTexturedRounded
#define CTBezelStyleToolbar NSBezelStyleToolbar
#define CTBezelStyleInline NSBezelStyleInline

#define CTButtonTypeMomentaryPushIn NSButtonTypeMomentaryPushIn
#define CTButtonTypePushOnPushOff NSButtonTypePushOnPushOff
#define CTButtonTypeOnOff NSButtonTypeOnOff
#define CTButtonTypeToggle NSButtonTypeToggle
#define CTButtonTypeSwitch NSButtonTypeSwitch
#define CTButtonTypeRadio NSButtonTypeRadio
#define CTButtonTypeToggle NSButtonTypeToggle


#define CTControlStateValueOn NSControlStateValueOn
#define CTCompositingOperationCopy NSCompositingOperationCopy

#endif

#endif /* Constants_h */
