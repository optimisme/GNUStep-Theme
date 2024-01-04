//
//  ViewButtons.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#import "ViewButtons.h"

@interface ViewButtons()

@property (nonatomic, strong) VTScroll *scroll;
@property (nonatomic, strong) VTColumn *column;

@property (nonatomic, strong) NSTextField *lPush;
@property (nonatomic, strong) VTRow *rPush;
@property (nonatomic, strong) NSButton *bPushMomentary;
@property (nonatomic, strong) NSButton *bPushMomentaryBorderless;
@property (nonatomic, strong) NSButton *bPushOnOff;
@property (nonatomic, strong) NSButton *bPushOnOffDisabled;
@property (nonatomic, strong) NSButton *bPushOnOffBorderless;
@property (nonatomic, strong) NSButton *bPushAccept;
@property (nonatomic, strong) NSButton *bPushDestructive;
@property (nonatomic, strong) NSButton *bPushStyle0;
@property (nonatomic, strong) NSButton *bPushStyle1;
@property (nonatomic, strong) NSButton *bPushStyle1Disabled;
@property (nonatomic, strong) NSButton *bPushDisabled;
@property (nonatomic, strong) NSTextField *lTexRounded;
@property (nonatomic, strong) VTRow *rTexRounded;
@property (nonatomic, strong) NSButton *bTexRTitleMomentary;
@property (nonatomic, strong) NSButton *bTexRTitleToggle;
@property (nonatomic, strong) NSButton *bTRBImageMomentary;
@property (nonatomic, strong) NSImage *iTRBImageMomentaryOff;
@property (nonatomic, strong) NSImage *iTRBImageMomentaryOn;
@property (nonatomic, strong) NSButton *bTRBImageToogle;
@property (nonatomic, strong) NSButton *bTRBImageToogleNotBordered;
@property (nonatomic, strong) NSTextField *lGradient;
@property (nonatomic, strong) VTRow *rGradient;
@property (nonatomic, strong) NSButton *bGradient0;
@property (nonatomic, strong) NSButton *bGradient1;
@property (nonatomic, strong) NSTextField *lCheckbox;
@property (nonatomic, strong) VTRow *rCheckbox;
@property (nonatomic, strong) NSButton *bCheckbox0;
@property (nonatomic, strong) NSButton *bCheckbox1;
@property (nonatomic, strong) NSButton *bCheckbox2;
@property (nonatomic, strong) NSTextField *lRadio;
@property (nonatomic, strong) VTRow *rRadio;
@property (nonatomic, strong) NSButton *bRadio0;
@property (nonatomic, strong) NSButton *bRadio1;
@property (nonatomic, strong) NSTextField *lPopUp;
@property (nonatomic, strong) VTRow *rPopUp;
@property (nonatomic, strong) NSPopUpButton *bPopup;
@property (nonatomic, strong) NSPopUpButton *bPopupDisabled;
@property (nonatomic, strong) NSPopUpButton *bPopupBorderless;
@property (nonatomic, strong) NSPopUpButton *bPullDown;
@property (nonatomic, strong) NSPopUpButton *bPullDownImage;
@property (nonatomic, strong) NSTextField *lRndRect;
@property (nonatomic, strong) VTRow *rRndRect;
@property (nonatomic, strong) NSButton *bRndRect;
@property (nonatomic, strong) NSButton *bRoundRectNotBordered;
@property (nonatomic, strong) NSTextField *lRecessed;
@property (nonatomic, strong) VTRow *rRecessed;
@property (nonatomic, strong) NSButton *bRecessed;
@property (nonatomic, strong) NSButton *bRecessedNotBordered;
@property (nonatomic, strong) NSButton *bRecessedDisabled;
@property (nonatomic, strong) NSTextField *lInline;
@property (nonatomic, strong) VTRow *rInline;
@property (nonatomic, strong) NSButton *bInline;
@property (nonatomic, strong) NSButton *bInlineBorderless;
@property (nonatomic, strong) NSButton *bInlineOnOff;
@property (nonatomic, strong) NSTextField *lImage;
@property (nonatomic, strong) VTRow *rImage;
@property (nonatomic, strong) NSButton *bImageMomentary;
@property (nonatomic, strong) NSButton *bImageToggle;
@property (nonatomic, strong) NSButton *bImageMomentaryChange;
@property (nonatomic, strong) NSTextField *lDisclosure;
@property (nonatomic, strong) VTRow *rDisclosure;
@property (nonatomic, strong) NSButton *bDisclosureButton;
@property (nonatomic, strong) NSButton *bDisclosureTriangle;
@property (nonatomic, strong) NSTextField *lHelp;
@property (nonatomic, strong) VTRow *rHelp;
@property (nonatomic, strong) NSButton *bHelp;
@property (nonatomic, strong) NSTextField *lStyles;
@property (nonatomic, strong) VTRow *rStyles;
@property (nonatomic, strong) NSButton *bStyleAccessoryBarAction;
@property (nonatomic, strong) NSButton *bStyleSquare;
@property (nonatomic, strong) NSButton *bStyleFlexible;
@property (nonatomic, strong) NSButton *bStyleShadowLess;
@property (nonatomic, strong) NSButton *bStyleCircular;
@property (nonatomic, strong) NSButton *bStyleAccessoryBar;
@property (nonatomic, strong) NSButton *bStyleTextureRounded;
@property (nonatomic, strong) NSButton *bStyleTextureSquare;
@property (nonatomic, strong) NSButton *bStyleToolbar;
@property (nonatomic, strong) NSTextField *lSegmented;
@property (nonatomic, strong) VTRow *rSegmented;
@property (nonatomic, strong) NSSegmentedControl *bSegmentedOne;
@property (nonatomic, strong) NSSegmentedControl *bSegmentedAny;

@end

@implementation ViewButtons

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

}

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    if (self) {

        CGFloat buttonWidth = 100;
        CGFloat buttonHeight = 30;

        self.column = [[VTColumn alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        self.scroll= [[VTScroll alloc] initWithFrame:frameRect content:self.column];
        [self addSubview:self.scroll];
        
        self.lPush = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lPush setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lPush setSelectable:NO];
        [self.lPush setBezeled:NO];
        [self.lPush setDrawsBackground:NO];
        [self.lPush setStringValue:@"Push Button"];
        [self.lPush sizeToFit]; // After setting the string
        [self.column addSubview:self.lPush];
        
        self.rPush = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rPush];
        
        self.bPushMomentary = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushMomentary setTitle:@"Momentary"];
        [self.bPushMomentary setBezelStyle:CTBezelStyleRounded];
        [self.bPushMomentary setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bPushMomentary setTarget:self];
        [self.bPushMomentary setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushMomentary];
/*
        // Button with shadow example
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor blackColor]];
        [shadow setShadowOffset:NSMakeSize(0, 1)];
        [shadow setShadowBlurRadius:20];
        [self.bPushMomentary setShadow:shadow];
*/
        self.bPushMomentaryBorderless = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushMomentaryBorderless setTitle:@"Borderless"];
        [self.bPushMomentaryBorderless setBezelStyle:CTBezelStyleRounded];
        [self.bPushMomentaryBorderless setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bPushMomentaryBorderless setBordered:NO];
        [self.bPushMomentaryBorderless setTarget:self];
        [self.bPushMomentaryBorderless setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushMomentaryBorderless];
        
        self.bPushDisabled = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushDisabled setTitle:@"Disabled"];
        [self.bPushDisabled setBezelStyle:CTBezelStyleRounded];
        [self.bPushDisabled setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bPushDisabled setEnabled:NO];
        [self.bPushDisabled setTarget:self];
        [self.bPushDisabled setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushDisabled];
        
        // TODO Fix this toggle
        self.bPushOnOff = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushOnOff setTitle:@"OnOff"];
        [self.bPushOnOff setBezelStyle:CTBezelStyleRounded];
        [self.bPushOnOff setButtonType:CTButtonTypeOnOff];
        [self.bPushOnOff setState:CTControlStateValueOn];
        [self.bPushOnOff setTarget:self];
        [self.bPushOnOff setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushOnOff];
        
        self.bPushOnOffBorderless = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushOnOffBorderless setTitle:@"OnOff"];
        [self.bPushOnOffBorderless setBezelStyle:CTBezelStyleRounded];
        [self.bPushOnOffBorderless setButtonType:CTButtonTypeOnOff];
        [self.bPushOnOffBorderless setState:CTControlStateValueOn];
        [self.bPushOnOffBorderless setEnabled:NO];
        [self.bPushOnOffBorderless setBordered:NO];
        [self.bPushOnOffBorderless setTarget:self];
        [self.bPushOnOffBorderless setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushOnOffBorderless];
        
        self.bPushOnOffDisabled = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushOnOffDisabled setTitle:@"OnOff Dis"];
        [self.bPushOnOffDisabled setBezelStyle:CTBezelStyleRounded];
        [self.bPushOnOffDisabled setButtonType:CTButtonTypeOnOff];
        [self.bPushOnOffDisabled setState:CTControlStateValueOn];
        [self.bPushOnOffDisabled setEnabled:NO];
        [self.bPushOnOffDisabled setTarget:self];
        [self.bPushOnOffDisabled setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushOnOffDisabled];
        
        self.bPushAccept = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushAccept setTitle:@"Accept"];
        [self.bPushAccept setBezelStyle:CTBezelStyleRounded];
        [self.bPushAccept setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bPushAccept setKeyEquivalent:@"\r"];
        [self.bPushAccept setTarget:self];
        [self.bPushAccept setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushAccept];
                
        self.bPushDestructive = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushDestructive setTitle:@"Destructive"];
        [self.bPushDestructive setBezelStyle:CTBezelStyleRounded];
#ifndef GNS
        [self.bPushDestructive setHasDestructiveAction:YES];
#endif
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self.bPushDestructive attributedTitle]];
        NSRange range = NSMakeRange(0, [attrTitle length]);
        [attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:range];
        [attrTitle fixAttributesInRange:range];
        [self.bPushDestructive setAttributedTitle:attrTitle];
        [self.bPushDestructive setTarget:self];
        [self.bPushDestructive setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushDestructive];
#ifndef GNS
        self.bPushStyle0 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushStyle0 setTitle:@"Style 0"];
        [self.bPushStyle0 setBezelStyle:CTBezelStyleRounded];
        [self.bPushStyle0 setBezelColor:[NSColor yellowColor]];
        [self.bPushStyle0 setTarget:self];
        [self.bPushStyle0 setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushStyle0];
       
        self.bPushStyle1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushStyle1 setTitle:@"Style 1"];
        [self.bPushStyle1 setBezelStyle:CTBezelStyleRounded];
        [self.bPushStyle1 setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bPushStyle1 setBezelColor:[NSColor orangeColor]];
        [self.bPushStyle1 setTarget:self];
        [self.bPushStyle1 setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushStyle1];

        self.bPushStyle1Disabled = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bPushStyle1Disabled setTitle:@"1 Disabled"];
        [self.bPushStyle1Disabled setBezelStyle:CTBezelStyleRounded];
        [self.bPushStyle1Disabled setBezelColor:[NSColor orangeColor]];
        [self.bPushStyle1Disabled setEnabled:NO];
        [self.bPushStyle1Disabled setTarget:self];
        [self.bPushStyle1Disabled setAction:@selector(buttonClicked:)];
        [self.rPush addSubview:self.bPushStyle1Disabled];

#endif
        self.lTexRounded = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lTexRounded setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lTexRounded setSelectable:NO];
        [self.lTexRounded setBezeled:NO];
        [self.lTexRounded setDrawsBackground:NO];
        [self.lTexRounded setStringValue:@"Texured Rounded Button"];
        [self.lTexRounded sizeToFit]; // After setting the string
        [self.column addSubview:self.lTexRounded];

        self.rTexRounded = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rTexRounded];
        
        self.bTexRTitleMomentary = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bTexRTitleMomentary setTitle:@"TexR Mom"];
        [self.bTexRTitleMomentary setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTexRTitleMomentary setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bTexRTitleMomentary setTarget:self];
        [self.bTexRTitleMomentary setAction:@selector(buttonClicked:)];
        [self.rTexRounded addSubview:self.bTexRTitleMomentary];
        
        self.bTexRTitleToggle = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bTexRTitleToggle setTitle:@"TexR Tog"];
        [self.bTexRTitleToggle setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTexRTitleToggle setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bTexRTitleToggle setButtonType:CTButtonTypeOnOff];
        [self.bTexRTitleToggle setState:CTControlStateValueOn];
        [self.bTexRTitleToggle setTarget:self];
        [self.bTexRTitleToggle setAction:@selector(buttonClicked:)];
        [self.rTexRounded addSubview:self.bTexRTitleToggle];
        
        self.bTexRTitleToggle = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bTexRTitleToggle setTitle:@"TexR TBL"];
        [self.bTexRTitleToggle setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTexRTitleToggle setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bTexRTitleToggle setButtonType:CTButtonTypeOnOff];
        [self.bTexRTitleToggle setState:CTControlStateValueOn];
        [self.bTexRTitleToggle setBordered:NO];
        [self.bTexRTitleToggle setTarget:self];
        [self.bTexRTitleToggle setAction:@selector(buttonClicked:)];
        [self.rTexRounded addSubview:self.bTexRTitleToggle];

        NSSize imgSize = NSMakeSize(12, 18);
#ifdef GNS
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"imglock" ofType:@"png"];
        NSImage *iTRBImageMomentary = [[NSImage alloc] initWithContentsOfFile:imagePath];
#else
        NSImage *iTRBImageMomentary = [NSImage imageNamed:@"imglock"];
#endif
        iTRBImageMomentary = [self resizeImage:[NSImage imageNamed:@"imglock"] toSize:imgSize];

        self.bTexRTitleMomentary = [[NSButton alloc] init];
        [self.bTexRTitleMomentary setImage:iTRBImageMomentary];
        
        self.bTRBImageMomentary = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bTRBImageMomentary setImage:iTRBImageMomentary];
        [self.bTRBImageMomentary setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTRBImageMomentary setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bTRBImageMomentary setTarget:self];
        [self.bTRBImageMomentary setAction:@selector(buttonClicked:)];
        [self.bTRBImageMomentary sizeToFit]; // After setting the image
        [self.rTexRounded addSubview:self.bTRBImageMomentary];

#ifdef GNS
        imagePath = [[NSBundle mainBundle] pathForResource:@"imglock" ofType:@"png"];
        self.iTRBImageMomentaryOff = [[NSImage alloc] initWithContentsOfFile:imagePath];
#else
        self.iTRBImageMomentaryOff = [NSImage imageNamed:@"imglock"];
#endif
        self.iTRBImageMomentaryOff = [self resizeImage:[NSImage imageNamed:@"imglock"] toSize:imgSize];

#ifdef GNS
        imagePath = [[NSBundle mainBundle] pathForResource:@"imgunlock" ofType:@"png"];
        self.iTRBImageMomentaryOn = [[NSImage alloc] initWithContentsOfFile:imagePath];
#else
        self.iTRBImageMomentaryOn = [NSImage imageNamed:@"imgunlock"];
#endif
        self.iTRBImageMomentaryOn = [self resizeImage:[NSImage imageNamed:@"imgunlock"] toSize:imgSize];

        self.bTRBImageToogle = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bTRBImageToogle setImage:self.iTRBImageMomentaryOff];
        [self.bTRBImageToogle setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTRBImageToogle setButtonType:CTButtonTypeToggle];
        [self.bTRBImageToogle setTarget:self];
        [self.bTRBImageToogle setAction:@selector(buttonClickedToggleImage:)];
        [self.bTRBImageToogle sizeToFit]; // After setting the image
        [self.rTexRounded addSubview:self.bTRBImageToogle];
        
        self.bTRBImageToogleNotBordered = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bTRBImageToogleNotBordered setImage:self.iTRBImageMomentaryOff];
        [self.bTRBImageToogleNotBordered setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bTRBImageToogleNotBordered setButtonType:CTButtonTypeToggle];
        [self.bTRBImageToogleNotBordered setBordered:NO];
        [self.bTRBImageToogleNotBordered setTarget:self];
        [self.bTRBImageToogleNotBordered setAction:@selector(buttonClickedToggleImage:)];
        [self.bTRBImageToogleNotBordered sizeToFit]; // After setting the image
        [self.rTexRounded addSubview:self.bTRBImageToogleNotBordered];

        self.lGradient = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lGradient setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lGradient setSelectable:NO];
        [self.lGradient setBezeled:NO];
        [self.lGradient setDrawsBackground:NO];
        [self.lGradient setStringValue:@"Gradient Button"];
        [self.lGradient sizeToFit]; // After setting the string
        [self.column addSubview:self.lGradient];

        self.rGradient = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rGradient];

        self.bGradient0 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 32, 32)];
        [self.bGradient0 setImage:iTRBImageMomentary];
        [self.bGradient0 setBezelStyle:CTBezelStyleSmallSquare];
        [self.bGradient0 setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bGradient0 setTarget:self];
        [self.bGradient0 setAction:@selector(buttonClicked:)];
        [self.rGradient addSubview:self.bGradient0];
        
        self.bGradient1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 32, 32)];
        [self.bGradient1 setImage:iTRBImageMomentary];
        [self.bGradient1 setBezelStyle:CTBezelStyleSmallSquare];
        [self.bGradient1 setButtonType:CTButtonTypeToggle];
        [self.bGradient1 setBordered:NO];
        [self.bGradient1 setTarget:self];
        [self.bGradient1 setAction:@selector(buttonClickedToggleImage:)];
        [self.rGradient addSubview:self.bGradient1];
        
        self.lCheckbox = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lCheckbox setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lCheckbox setSelectable:NO];
        [self.lCheckbox setBezeled:NO];
        [self.lCheckbox setDrawsBackground:NO];
        [self.lCheckbox setStringValue:@"Checkbox buttons"];
        [self.lCheckbox sizeToFit]; // After setting the string
        [self.column addSubview:self.lCheckbox];

        self.rCheckbox = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rCheckbox];
      
        self.bCheckbox0 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bCheckbox0 setTitle:@"Checkbox 0"];
        [self.bCheckbox0 setButtonType:CTButtonTypeSwitch];
        [self.bCheckbox0 setTarget:self];
        [self.bCheckbox0 setAction:@selector(checkboxClicked:)];
        [self.bCheckbox0 sizeToFit];
        [self.column addSubview:self.bCheckbox0];
        
        self.bCheckbox1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bCheckbox1 setTitle:@"Checkbox 1"];
        [self.bCheckbox1 setButtonType:CTButtonTypeSwitch];
        [self.bCheckbox1 setState:NSControlStateValueOn];
        [self.bCheckbox1 setTarget:self];
        [self.bCheckbox1 setAction:@selector(checkboxClicked:)];
        [self.bCheckbox1 sizeToFit];
        [self.column addSubview:self.bCheckbox1];
        
        self.bCheckbox2 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bCheckbox2 setTitle:@"Checkbox mixed"];
        [self.bCheckbox2 setButtonType:CTButtonTypeSwitch];
        [self.bCheckbox2 setAllowsMixedState:YES];
        [self.bCheckbox2 setState:NSControlStateValueMixed];
        [self.bCheckbox2 setTarget:self];
        [self.bCheckbox2 setAction:@selector(checkboxClicked:)];
        [self.bCheckbox2 sizeToFit];
        [self.column addSubview:self.bCheckbox2];
        
        self.lRadio = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lRadio setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lRadio setSelectable:NO];
        [self.lRadio setBezeled:NO];
        [self.lRadio setDrawsBackground:NO];
        [self.lRadio setStringValue:@"Radio buttons"];
        [self.lRadio sizeToFit]; // After setting the string
        [self.column addSubview:self.lRadio];

        self.rRadio = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rRadio];
        
        self.bRadio0 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bRadio0 setTitle:@"Radio 0"];
        [self.bRadio0 setButtonType:CTButtonTypeRadio];
        [self.bRadio0 setState:NSControlStateValueOn];
        [self.bRadio0 setTarget:self];
        [self.bRadio0 setAction:@selector(radioClicked:)];
        [self.bRadio0 sizeToFit];
        [self.rRadio addSubview:self.bRadio0];

        self.bRadio1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bRadio1 setTitle:@"Radio 1"];
        [self.bRadio1 setButtonType:CTButtonTypeRadio];
        [self.bRadio1 setTarget:self];
        [self.bRadio1 setAction:@selector(radioClicked:)];
        [self.bRadio1 sizeToFit];
        [self.rRadio addSubview:self.bRadio1];
        
        self.lPopUp = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lPopUp setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lPopUp setSelectable:NO];
        [self.lPopUp setBezeled:NO];
        [self.lPopUp setDrawsBackground:NO];
        [self.lPopUp setStringValue:@"Pop Up Buttons"];
        [self.lPopUp sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lPopUp];

        self.rPopUp = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rPopUp];

        self.bPopup = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0) pullsDown:NO];
        [self.bPopup addItemWithTitle:@"Option 1"];
        [self.bPopup addItemWithTitle:@"Option 2"];
        [self.bPopup addItemWithTitle:@"Option 3"];
        [self.bPopup setTarget:self];
        [self.bPopup setAction:@selector(popupButtonSelectionChanged:)];
        [self.bPopup sizeToFit];
        [self.rPopUp addSubview:self.bPopup];

        self.bPopupDisabled = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0) pullsDown:NO];
        [self.bPopupDisabled addItemWithTitle:@"Option D1"];
        [self.bPopupDisabled addItemWithTitle:@"Option D2"];
        [self.bPopupDisabled setTarget:self];
        [self.bPopupDisabled setEnabled:NO];
        [self.bPopupDisabled setAction:@selector(popupButtonSelectionChanged:)];
        [self.bPopupDisabled sizeToFit];
        [self.rPopUp addSubview:self.bPopupDisabled];
        
        self.bPopupBorderless = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0) pullsDown:NO];
        [self.bPopupBorderless addItemWithTitle:@"Option D1"];
        [self.bPopupBorderless addItemWithTitle:@"Option D2"];
        [self.bPopupBorderless setTarget:self];
        [self.bPopupBorderless setBordered:NO];
        [self.bPopupBorderless setAction:@selector(popupButtonSelectionChanged:)];
        [self.bPopupBorderless sizeToFit];
        [self.rPopUp addSubview:self.bPopupBorderless];
        
        self.bPullDown = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0) pullsDown:YES];
        [self.bPullDown addItemWithTitle:@"Title"];
        [self.bPullDown addItemWithTitle:@"Option A"];
        [self.bPullDown addItemWithTitle:@"Option B"];
        [self.bPullDown setTarget:self];
        [self.bPullDown setAction:@selector(pullDownButtonSelectionChanged:)];
        [self.bPullDown sizeToFit];
        [self.rPopUp addSubview:self.bPullDown];
        
        self.bPullDownImage = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 32, 32) pullsDown:YES];
        [self.bPullDownImage addItemWithTitle:@""];
        NSMenuItem *iPullDown = (NSMenuItem *)[self.bPullDownImage itemAtIndex:0];
        [iPullDown setImage:[self resizeImage:[NSImage imageNamed:@"imglock"] toSize:imgSize]];
        [self.bPullDownImage setBordered:NO];
        [self.bPullDownImage addItemWithTitle:@"Option IA"];
        [self.bPullDownImage addItemWithTitle:@"Option IB"];
        [self.bPullDownImage setTarget:self];
        [self.bPullDownImage setAction:@selector(pullDownButtonSelectionChanged:)];
        [self.rPopUp addSubview:self.bPullDownImage];
        
        self.lRndRect = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lRndRect setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lRndRect setSelectable:NO];
        [self.lRndRect setBezeled:NO];
        [self.lRndRect setDrawsBackground:NO];
        [self.lRndRect setStringValue:@"Round Rect Buttons"];
        [self.lRndRect sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lRndRect];

        self.rRndRect = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rRndRect];
        
        self.bRndRect = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bRndRect setTitle:@"Round R"];
        [self.bRndRect setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bRndRect setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bRndRect setTarget:self];
        [self.bRndRect setAction:@selector(buttonClicked:)];
        [self.rRndRect addSubview:self.bRndRect];
               
        self.bRoundRectNotBordered = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bRoundRectNotBordered setTitle:@"RR Borderless"];
        [self.bRoundRectNotBordered setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bRoundRectNotBordered setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bRoundRectNotBordered setBordered:NO];
        [self.bRoundRectNotBordered setTarget:self];
        [self.bRoundRectNotBordered setAction:@selector(buttonClicked:)];
        [self.rRndRect addSubview:self.bRoundRectNotBordered];

        self.lRecessed = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lRecessed setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lRecessed setSelectable:NO];
        [self.lRecessed setBezeled:NO];
        [self.lRecessed setDrawsBackground:NO];
        [self.lRecessed setStringValue:@"Recessed Buttons"];
        [self.lRecessed sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lRecessed];

        self.rRecessed = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rRecessed];
        
        self.bRecessed = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bRecessed setTitle:@"Rec OnOff"];
        [self.bRecessed setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bRecessed setButtonType:CTButtonTypePushOnPushOff];
        [self.bRecessed setTarget:self];
        [self.bRecessed setAction:@selector(buttonClicked:)];
        [self.rRecessed addSubview:self.bRecessed];
        
        self.bRecessedNotBordered = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bRecessedNotBordered setTitle:@"Recessed Tr"];
        [self.bRecessedNotBordered setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bRecessedNotBordered setButtonType:CTButtonTypePushOnPushOff];
        [self.bRecessedNotBordered setBordered:NO];
        [self.bRecessedNotBordered setTarget:self];
        [self.bRecessedNotBordered setAction:@selector(buttonClicked:)];
        [self.rRecessed addSubview:self.bRecessedNotBordered];
        
        self.bRecessedDisabled = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bRecessedDisabled setTitle:@"Recessed"];
        [self.bRecessedDisabled setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bRecessedDisabled setButtonType:CTButtonTypePushOnPushOff];
        [self.bRecessedDisabled setEnabled:NO];
        [self.bRecessedDisabled setTarget:self];
        [self.bRecessedDisabled setAction:@selector(buttonClicked:)];
        [self.rRecessed addSubview:self.bRecessedDisabled];
        
        self.lInline = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lInline setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lInline setSelectable:NO];
        [self.lInline setBezeled:NO];
        [self.lInline setDrawsBackground:NO];
        [self.lInline setStringValue:@"Inline Buttons"];
        [self.lInline sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lInline];

        self.rInline = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rInline];
        
        self.bInline = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bInline setTitle:@"Inline"];
        [self.bInline setBezelStyle:CTBezelStyleInline];
        [self.bInline setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bInline setTarget:self];
        [self.bInline setAction:@selector(buttonClicked:)];
        [self.bInline sizeToFit];
        [self.rInline addSubview:self.bInline];

        self.bInlineBorderless = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bInlineBorderless setTitle:@"Inline Brdss"];
        [self.bInlineBorderless setBezelStyle:CTBezelStyleInline];
        [self.bInlineBorderless setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bInlineBorderless setBordered:NO];
        [self.bInlineBorderless setTarget:self];
        [self.bInlineBorderless setAction:@selector(buttonClicked:)];
        [self.bInlineBorderless sizeToFit];
        [self.rInline addSubview:self.bInlineBorderless];
        
        self.bInlineOnOff = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bInlineOnOff setTitle:@"Inline OnOff"];
        [self.bInlineOnOff setBezelStyle:CTBezelStyleInline];
        [self.bInlineOnOff setButtonType:CTButtonTypeOnOff];
        [self.bInlineOnOff setTarget:self];
        [self.bInlineOnOff setAction:@selector(buttonClicked:)];
        [self.bInlineOnOff sizeToFit];
        [self.rInline addSubview:self.bInlineOnOff];
        
        self.lDisclosure = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lDisclosure setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lDisclosure setSelectable:NO];
        [self.lDisclosure setBezeled:NO];
        [self.lDisclosure setDrawsBackground:NO];
        [self.lDisclosure setStringValue:@"Disclosure Buttons"];
        [self.lDisclosure sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lDisclosure];

        self.rDisclosure = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rDisclosure];
        
        self.bDisclosureButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bDisclosureButton setTitle:@""];
        [self.bDisclosureButton setBezelStyle:CTBezelStyleDisclosure];
        [self.bDisclosureButton setButtonType:CTButtonTypeOnOff];
        [self.bDisclosureButton setTarget:self];
        [self.bDisclosureButton setAction:@selector(buttonClicked:)];
        [self.bDisclosureButton sizeToFit];
        [self.rDisclosure addSubview:self.bDisclosureButton];
        
        self.bDisclosureTriangle = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bDisclosureTriangle setTitle:@""];
        [self.bDisclosureTriangle setBezelStyle:CTBezelStylePushDisclosure];
        [self.bDisclosureTriangle setButtonType:CTButtonTypeOnOff];
        [self.bDisclosureTriangle setTarget:self];
        [self.bDisclosureTriangle setAction:@selector(buttonClicked:)];
        [self.bDisclosureTriangle sizeToFit];
        [self.rDisclosure addSubview:self.bDisclosureTriangle];
        
        self.lHelp = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lHelp setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lHelp setSelectable:NO];
        [self.lHelp setBezeled:NO];
        [self.lHelp setDrawsBackground:NO];
        [self.lHelp setStringValue:@"Help Button"];
        [self.lHelp sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lHelp];

        self.rHelp = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rHelp];
        
        self.bHelp = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bHelp setTitle:@""];
        [self.bHelp setBezelStyle:CTBezelStyleHelpButton];
        [self.bHelp setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bHelp setTarget:self];
        [self.bHelp setAction:@selector(buttonClicked:)];
        [self.bHelp sizeToFit];
        [self.rHelp addSubview:self.bHelp];

        self.lStyles = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lStyles setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lStyles setSelectable:NO];
        [self.lStyles setBezeled:NO];
        [self.lStyles setDrawsBackground:NO];
        [self.lStyles setStringValue:@"Styles"];
        [self.lStyles sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lStyles];

        self.rStyles = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rStyles];
        
        self.bStyleAccessoryBarAction = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleAccessoryBarAction setTitle:@"Acc Bar Act"];
        [self.bStyleAccessoryBarAction setBezelStyle:CTBezelStyleAccessoryBarAction];
        [self.bStyleAccessoryBarAction setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleAccessoryBarAction setTarget:self];
        [self.bStyleAccessoryBarAction setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleAccessoryBarAction];

        self.bStyleSquare = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleSquare setTitle:@"Square"];
        [self.bStyleSquare setBezelStyle:CTBezelStyleSmallSquare];
        [self.bStyleSquare setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleSquare setTarget:self];
        [self.bStyleSquare setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleSquare];

        self.bStyleFlexible = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleFlexible setTitle:@"Flexible"];
        [self.bStyleFlexible setBezelStyle:CTBezelStyleFlexiblePush];
        [self.bStyleFlexible setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleFlexible setTarget:self];
        [self.bStyleFlexible setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleFlexible];
        
        self.bStyleShadowLess = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleShadowLess setTitle:@"Shadowless"];
        [self.bStyleShadowLess setBezelStyle:CTBezelStyleShadowlessSquare];
        [self.bStyleShadowLess setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleShadowLess setTarget:self];
        [self.bStyleShadowLess setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleShadowLess];
        
        self.bStyleCircular = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleCircular setTitle:@"Circular"];
        [self.bStyleCircular setBezelStyle:CTBezelStyleCircular];
        [self.bStyleCircular setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleCircular setTarget:self];
        [self.bStyleCircular setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleCircular];
        
        self.bStyleAccessoryBar = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleAccessoryBar setTitle:@"Acc Bar"];
        [self.bStyleAccessoryBar setBezelStyle:CTBezelStyleAccessoryBar];
        [self.bStyleAccessoryBar setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleAccessoryBar setTarget:self];
        [self.bStyleAccessoryBar setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleAccessoryBar];
        
        self.bStyleTextureRounded = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleTextureRounded setTitle:@"Texture R"];
        [self.bStyleTextureRounded setBezelStyle:CTBezelStyleTexturedRounded];
        [self.bStyleTextureRounded setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleTextureRounded setTarget:self];
        [self.bStyleTextureRounded setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleTextureRounded];
        
        self.bStyleTextureSquare = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleTextureSquare setTitle:@"Texture Sq"];
        [self.bStyleTextureSquare setBezelStyle:CTBezelStyleTexturedSquare];
        [self.bStyleTextureSquare setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleTextureSquare setTarget:self];
        [self.bStyleTextureSquare setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleTextureSquare];
        
        self.bStyleToolbar = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bStyleToolbar setTitle:@"Toolbar"];
        [self.bStyleToolbar setBezelStyle:CTBezelStyleToolbar];
        [self.bStyleToolbar setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bStyleToolbar setTarget:self];
        [self.bStyleToolbar setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bStyleToolbar];
        
        self.lSegmented = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lSegmented setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lSegmented setSelectable:NO];
        [self.lSegmented setBezeled:NO];
        [self.lSegmented setDrawsBackground:NO];
        [self.lSegmented setStringValue:@"Segmented Control"];
        [self.lSegmented sizeToFit]; // Després d'establir el text
        [self.column addSubview:self.lSegmented];

        self.rSegmented = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rSegmented];
        
        self.bSegmentedOne = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(0, 0, 200, 20)];
        [self.bSegmentedOne setSegmentCount:3];
        [self.bSegmentedOne setLabel:@"Primer" forSegment:0];
        [self.bSegmentedOne setLabel:@"Segon" forSegment:1];
        [self.bSegmentedOne setLabel:@"Tercer" forSegment:2];
        [self.bSegmentedOne setTarget:self];
        [self.bSegmentedOne setAction:@selector(segmentedControlChanged:)];
        //[self.bSegmentedOne sizeToFit];
        [self.rSegmented addSubview:self.bSegmentedOne];
        
        self.bSegmentedAny = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(0, 0, 200, 20)];
        [self.bSegmentedAny setSegmentCount:3];
        [self.bSegmentedAny setLabel:@"Primer" forSegment:0];
        [self.bSegmentedAny setLabel:@"Segon" forSegment:1];
        [self.bSegmentedAny setLabel:@"Tercer" forSegment:2];
#ifndef GNS
        [self.bSegmentedAny setTrackingMode:NSSegmentSwitchTrackingSelectAny];
#endif
        [self.bSegmentedAny setTarget:self];
        [self.bSegmentedAny setAction:@selector(segmentedControlChanged:)];
        //[self.bSegmentedOne sizeToFit];
        [self.rSegmented addSubview:self.bSegmentedAny];
        
        [self updateLayoutWithFrame:frameRect];
 }
    return self;
}

- (BOOL) isFlipped {
    return YES;
}

- (void)updateLayoutWithFrame:(NSRect)frame {
    [self setFrame:frame];
    [self.scroll updateLayoutWithFrame:frame];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
}

- (void)buttonClickedToggleImage:(NSButton *)sender {
    if (sender.state == NSControlStateValueOn) {
        [sender setImage:self.iTRBImageMomentaryOn];
    } else {
        [sender setImage:self.iTRBImageMomentaryOff];
    }
}

- (void)checkboxClicked:(id)sender {
    NSButton *checkbox = (NSButton *)sender;
    
    if (checkbox) {
        NSLog(@"Checkbox state %ld", (long)checkbox.state);
    }
}

- (void)radioClicked:(id)sender {
    NSButton *radio = (NSButton *)sender;
    
    if (radio) {
        NSLog(@"Radio state %ld", (long)radio.state);
    }

    if (sender == self.bRadio0) {
        NSLog(@"Sender radio 0");
    } else if (sender == self.bRadio1) {
        NSLog(@"Sender radio 1");
    }
}

- (NSImage *) resizeImage:(NSImage *)sourceImage toSize:(NSSize)newSize {
    NSRect targetFrame = NSMakeRect(0, 0, newSize.width, newSize.height);
    NSImage *targetImage = [[NSImage alloc] initWithSize:newSize];

    [targetImage lockFocus];
    [sourceImage drawInRect:targetFrame fromRect:NSZeroRect operation:CTCompositingOperationCopy fraction:1.0];
    [targetImage unlockFocus];

    return targetImage;
}

- (void)popupButtonSelectionChanged:(NSPopUpButton *)sender {
    NSInteger selectedIndex = [sender indexOfSelectedItem];
    NSLog(@"Popup selected index: %ld", (long)selectedIndex);
}

- (void)pullDownButtonSelectionChanged:(NSPopUpButton *)sender {
    NSInteger selectedIndex = [sender indexOfSelectedItem];
    NSString *selectedTitle = [[sender itemAtIndex:selectedIndex] title];
    NSLog(@"Pull down selected index: %ld, title: %@", (long)selectedIndex, selectedTitle);
}

- (void)segmentedControlChanged:(NSSegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegment;
    switch (selectedSegment) {
        case 0:
            NSLog(@"Primer segment seleccionat");
            break;
        case 1:
            NSLog(@"Segon segment seleccionat");
            break;
        case 2:
            NSLog(@"Tercer segment seleccionat");
            break;
        default:
            break;
    }
    NSLog(@"Estat dels segments: %ld, %ld, %ld",
          (long)[sender isSelectedForSegment:0],
          (long)[sender isSelectedForSegment:1],
          (long)[sender isSelectedForSegment:2]);
}

@end
