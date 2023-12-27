//
//  ViewButtons.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#import "Constants.h"
#import "ViewButtons.h"
#import "VTColumn.h"
#import "VTRow.h"
#import "VTScroll.h"

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
@property (nonatomic, strong) NSButton *bCheckboxPopup;
@property (nonatomic, strong) NSButton *bCheckboxPopupOver;
@property (nonatomic, strong) NSButton *bCheckboxPullDown;
@property (nonatomic, strong) NSTextField *lRoundRect;
@property (nonatomic, strong) VTRow *rRoundRect;
@property (nonatomic, strong) NSButton *bRoundRect;
@property (nonatomic, strong) NSButton *bRoundRectTransparent;
@property (nonatomic, strong) NSButton *bRoundRectNotBordered;
@property (nonatomic, strong) NSButton *bRoundRectTransparentNotBordered;
@property (nonatomic, strong) NSTextField *lRecesed;
@property (nonatomic, strong) VTRow *rRecesed;
@property (nonatomic, strong) NSButton *bRecesed;
@property (nonatomic, strong) NSButton *RecesedTransparent;
@property (nonatomic, strong) NSButton *bRecesedNotBordered;
@property (nonatomic, strong) NSButton *bRecesedTransparentNotBordered;
@property (nonatomic, strong) NSTextField *lInline;
@property (nonatomic, strong) VTRow *rInline;
@property (nonatomic, strong) NSButton *bInline0;
@property (nonatomic, strong) NSButton *bInline1;
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

@end

@implementation ViewButtons

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
/*
    // View background color
    NSColor *customColor = [NSColor redColor];
    [customColor set];
    NSRectFill(dirtyRect);
*/

/*
    // Clipped gradient example
    NSColor *startColor = [NSColor greenColor];
    NSColor *endColor = [NSColor blueColor];
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];

    NSRect frame = NSMakeRect(50, 50, 100, 50);
    NSBezierPath *bezelPath = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:15.0 yRadius:15.0];
    [NSGraphicsContext saveGraphicsState];
    [bezelPath setClip];
    [gradient drawInRect:frame angle:90.0];
    [NSGraphicsContext restoreGraphicsState];


    // Star
    NSColor *starStartColor = [NSColor redColor];
    NSColor *starEndColor = [NSColor yellowColor];
    NSGradient *starGradient = [[NSGradient alloc] initWithStartingColor:starStartColor endingColor:starEndColor];

    NSBezierPath *starPath = [NSBezierPath bezierPath];
    CGFloat starRadius = 50.0;  // Radi exterior de la estrella
    CGFloat innerRadius = starRadius * sin(M_PI / 10) / sin(7 * M_PI / 10); // Radi interior
    NSPoint center = NSMakePoint(250, 100); // Centre de l'estrella

    for (int i = 0; i < 10; i++) {
        // Calculem l'angle per a cada punt
        CGFloat angle = (CGFloat)(2 * M_PI / 10 * i);

        // Alternem entre radi exterior i interior
        CGFloat radius = i % 2 == 0 ? starRadius : innerRadius;
        CGFloat x = center.x + sin(angle) * radius;
        CGFloat y = center.y + cos(angle) * radius;

        if (i == 0) {
            [starPath moveToPoint:NSMakePoint(x, y)];
        } else {
            [starPath lineToPoint:NSMakePoint(x, y)];
        }
    }
    [starPath closePath];

    [NSGraphicsContext saveGraphicsState];
    [starPath setClip];
    [starGradient drawInBezierPath:starPath angle:90.0];
    [NSGraphicsContext restoreGraphicsState];

    // 45 degrees Oval
    NSRect ovalRect = NSMakeRect(350, 50, 100, 50);
    NSBezierPath *ovalPath = [NSBezierPath bezierPathWithOvalInRect:ovalRect];
    [NSGraphicsContext saveGraphicsState];
    NSAffineTransform *transform = [NSAffineTransform transform];
    NSPoint centerOval = NSMakePoint(NSMidX(ovalRect), NSMidY(ovalRect));
    [transform translateXBy:centerOval.x yBy:centerOval.y];
    [transform rotateByDegrees:45];
    [transform translateXBy:-centerOval.x yBy:-centerOval.y];
    [ovalPath transformUsingAffineTransform:transform];
    [ovalPath setClip];
    [NSGraphicsContext restoreGraphicsState];
    [gradient drawInBezierPath:ovalPath angle:-25.0];

    // Shadow example 0
    NSShadow *shadow0 = [[NSShadow alloc] init];
    [shadow0 setShadowColor:[[NSColor blackColor] colorWithAlphaComponent:0.5]];
    [shadow0 setShadowOffset:NSMakeSize(0, -2)];
    [shadow0 setShadowBlurRadius:2];
    [shadow0 set];

    NSRect shadowFrame0 = NSMakeRect(50, 250, 100, 50);
    NSBezierPath *path0 = [NSBezierPath bezierPathWithRoundedRect:shadowFrame0 xRadius:25.0 yRadius:25.0];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path0 fill];
    [NSGraphicsContext restoreGraphicsState];

    // Shadow example 1
    NSShadow *shadow1 = [[NSShadow alloc] init];
    [shadow1 setShadowColor:[NSColor blackColor]];
    [shadow1 setShadowOffset:NSMakeSize(5, -15)];
    [shadow1 setShadowBlurRadius:20];
    [shadow1 set];

    NSRect shadowFrame1 = NSMakeRect(250, 250, 100, 50);
    NSBezierPath *path1 = [NSBezierPath bezierPathWithRect:shadowFrame1];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path1 fill];
    [NSGraphicsContext restoreGraphicsState];

    // Shadow example 2
    NSShadow *shadow2 = [[NSShadow alloc] init];
    [shadow2 setShadowColor:[NSColor blackColor]];
    [shadow2 setShadowOffset:NSMakeSize(5, -15)];
    [shadow2 setShadowBlurRadius:20];
    [shadow2 set];
    NSRect shadowFrame2 = NSMakeRect(450, 250, 100, 50);
    NSBezierPath *path2 = [NSBezierPath bezierPathWithRect:shadowFrame2];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path2 fill];
    [NSGraphicsContext restoreGraphicsState];
*/
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    if (self) {

        CGFloat buttonWidth = 100;
        CGFloat buttonHeight = 30;

        self.column = [[VTColumn alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        self.scroll = [[VTScroll alloc] initWithFrame:frameRect content:self.column];
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

        /*
        @property (nonatomic, strong) VTRow *rGradient;
        @property (nonatomic, strong) NSButton *bGradient0;
        @property (nonatomic, strong) NSButton *bGradient1;
        @property (nonatomic, strong) VTRow *rCheckbox;
        @property (nonatomic, strong) NSButton *bCheckbox0;
        @property (nonatomic, strong) NSButton *bCheckbox1;
        @property (nonatomic, strong) NSButton *bCheckbox2;
        @property (nonatomic, strong) VTRow *rRadio;
        @property (nonatomic, strong) NSButton *bRadio0;
        @property (nonatomic, strong) NSButton *bRadio1;
        @property (nonatomic, strong) VTRow *rPopUp;
        @property (nonatomic, strong) NSButton *bCheckboxPopup;
        @property (nonatomic, strong) NSButton *bCheckboxPopupOver;
        @property (nonatomic, strong) NSButton *bCheckboxPullDown;
        @property (nonatomic, strong) VTRow *rRoundRect;
        @property (nonatomic, strong) NSButton *bRoundRect;
        @property (nonatomic, strong) NSButton *bRoundRectTransparent;
        @property (nonatomic, strong) NSButton *bRoundRectNotBordered;
        @property (nonatomic, strong) NSButton *bRoundRectTransparentNotBordered;
        @property (nonatomic, strong) VTRow *rRecesed;
        @property (nonatomic, strong) NSButton *bRecesed;
        @property (nonatomic, strong) NSButton *RecesedTransparent;
        @property (nonatomic, strong) NSButton *bRecesedNotBordered;
        @property (nonatomic, strong) NSButton *bRecesedTransparentNotBordered;
        @property (nonatomic, strong) VTRow *rInline;
        @property (nonatomic, strong) NSButton *bInline0;
        @property (nonatomic, strong) NSButton *bInline1;
        @property (nonatomic, strong) VTRow *rImage;
        @property (nonatomic, strong) NSButton *bImageMomentary;
        @property (nonatomic, strong) NSButton *bImageToggle;
        @property (nonatomic, strong) NSButton *bImageMomentaryChange;
        @property (nonatomic, strong) VTRow *rDisclosure;
        @property (nonatomic, strong) NSButton *bDisclosureButton;
        @property (nonatomic, strong) NSButton *bDisclosureTriangle;
        @property (nonatomic, strong) VTRow *rHelp;
        @property (nonatomic, strong) NSButton *bHelp;*/
        
        /*
        // Label styles
        self.lStyles = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lStyles setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lStyles setSelectable:NO];
        [self.lStyles setBezeled:NO];
        [self.lStyles setDrawsBackground:NO];
        [self.lStyles setStringValue:@"Bezel styles"];
        [self.lStyles sizeToFit]; // After setting the string
        [self.column addSubview:self.lStyles];

        self.rStyles = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rStyles];

        // Default button
        self.bDefault = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bDefault setTitle:@"Default"];
        [self.bDefault setTarget:self];
        [self.bDefault setAction:@selector(buttonClicked:)];
        [self.rStyles addSubview:self.bDefault];
/ *
        // Button with shadow example
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor blackColor]];
        [shadow setShadowOffset:NSMakeSize(0, 1)];
        [shadow setShadowBlurRadius:20];
        [self.buttonDefault setShadow:shadow];
* /
        style = CTBezelStyleAccessoryBarAction;
        self.bRoundRect = [self createButtonWithTitle:@"R Rect" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bRoundRect];

        style = CTBezelStylePush;
        self.bRounded = [self createButtonWithTitle:@"Rounded" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bRounded];

        style = CTBezelStyleSmallSquare;
        self.bSmallSquare = [self createButtonWithTitle:@"Small Sqr" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bSmallSquare];

        style = CTBezelStyleFlexiblePush;
        self.bRegularSquare = [self createButtonWithTitle:@"Regular Sqr" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bRegularSquare];

        style = CTBezelStyleShadowlessSquare;
        self.bShadowless = [self createButtonWithTitle:@"Shadowless" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bShadowless];

        style = CTBezelStyleFlexiblePush;
        self.bThicker = [self createButtonWithTitle:@"Thicker" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bThicker];

        style = CTBezelStyleFlexiblePush;
        self.bThickSquare = [self createButtonWithTitle:@"Thick Sqr" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bThickSquare];

        style = CTBezelStyleCircular;
        self.bCircular = [self createButtonWithTitle:@"Ci" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bCircular];
        
        style = CTBezelStyleDisclosure;
        self.disclosureButtonIsOpen = NO;
        self.bDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.bDisclosure setButtonType:CTButtonTypePushOnPushOff];
        [self.rStyles addSubview:self.bDisclosure];

        style = CTBezelStylePushDisclosure;
        self.bRoundedDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.bRoundedDisclosure setButtonType:CTButtonTypePushOnPushOff];
        [self.rStyles addSubview:self.bRoundedDisclosure];

        style = CTBezelStyleHelpButton;
        self.bHelp = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bHelp];

        style = CTBezelStyleAccessoryBar;
        self.bRecessed = [self createButtonWithTitle:@"Recessed" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.bRecessed setButtonType:CTButtonTypeOnOff];
        [self.rStyles addSubview:self.bRecessed];

        style = CTBezelStyleTexturedRounded;
        self.bTexRounded = [self createButtonWithTitle:@"T Rounded" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bTexRounded];

        style = CTBezelStyleTexturedSquare;
        self.bTexSquare = [self createButtonWithTitle:@"T Sqr" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bTexSquare];

        style = CTBezelStyleToolbar;
        self.bToolbar = [self createButtonWithTitle:@"Toolbar" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.rStyles addSubview:self.bToolbar];

        // Action types
        self.lTypes = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lTypes setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lTypes setSelectable:NO];
        [self.lTypes setBezeled:NO];
        [self.lTypes setDrawsBackground:NO];
        [self.lTypes setStringValue:@"Types"];
        [self.lTypes sizeToFit]; // After setting the string
        [self.column addSubview:self.lTypes];

        self.rTypes = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rTypes];

        style = CTBezelStyleAccessoryBar;
        self.bToolBarPushOnPushOff = [self createButtonWithTitle:@"Recessed OnOff" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.bToolBarPushOnPushOff setButtonType:CTButtonTypePushOnPushOff];
        [self.rTypes addSubview:self.bToolBarPushOnPushOff];

        self.bToogle = [self createButtonWithTitle:@"Toggle" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
        [self.bToogle setButtonType:CTButtonTypeToggle];
        [self.rTypes addSubview:self.bToogle];

        self.bCheckbox = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bCheckbox setTitle:@"Checkbox"];
        [self.bCheckbox setButtonType:CTButtonTypeSwitch];
        [self.bCheckbox setState:NSControlStateValueOn];
        [self.bCheckbox setTarget:self];
        [self.bCheckbox setAction:@selector(checkboxClicked:)];
        [self.bCheckbox sizeToFit];
        [self.rTypes addSubview:self.bCheckbox];

        self.bCheckboxMixed = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bCheckboxMixed setTitle:@"Checkbox"];
        [self.bCheckboxMixed setButtonType:CTButtonTypeSwitch];
        [self.bCheckboxMixed setAllowsMixedState:YES];
        [self.bCheckboxMixed setState:NSControlStateValueMixed];
        [self.bCheckboxMixed setTarget:self];
        [self.bCheckboxMixed setAction:@selector(checkboxClicked:)];
        [self.bCheckboxMixed sizeToFit];
        [self.rTypes addSubview:self.bCheckboxMixed];

        self.bRadio0 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bRadio0 setTitle:@"Radio 0"];
        [self.bRadio0 setButtonType:CTButtonTypeRadio];
        [self.bRadio0 setState:NSControlStateValueOn];
        [self.bRadio0 setTarget:self];
        [self.bRadio0 setAction:@selector(radioClicked:)];
        [self.bRadio0 sizeToFit];
        [self.rTypes addSubview:self.bRadio0];

        self.bRadio1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bRadio1 setTitle:@"Radio 1"];
        [self.bRadio1 setButtonType:CTButtonTypeRadio];
        [self.bRadio1 setTarget:self];
        [self.bRadio1 setAction:@selector(radioClicked:)];
        [self.bRadio1 sizeToFit];
        [self.rTypes addSubview:self.bRadio1];

        // Action styles
        self.lActions = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lActions setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lActions setSelectable:NO];
        [self.lActions setBezeled:NO];
        [self.lActions setDrawsBackground:NO];
        [self.lActions setStringValue:@"Actions"];
        [self.lActions sizeToFit]; // After setting the string
        [self.column addSubview:self.lActions];

        self.rActions = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rActions];

        // Definir el color d'accent
        self.bAccept = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, buttonWidth, buttonHeight)];
        [self.bAccept setTitle:@"Accept"];
        [self.bAccept setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bAccept setKeyEquivalent:@"\r"];
        [self.bAccept setTarget:self];
        [self.bAccept setAction:@selector(buttonClicked:)];
        [self.rActions addSubview:self.bAccept];

        // TODO: hasDestructiveAction
        // TODO: custom bezelColor

        // Controls styles
        self.lControls = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lControls setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lControls setSelectable:NO];
        [self.lControls setBezeled:NO];
        [self.lControls setDrawsBackground:NO];
        [self.lControls setStringValue:@"Controls"];
        [self.lControls sizeToFit]; // After setting the string
        [self.column addSubview:self.lControls];

        self.rControls = [[VTRow alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.column addSubview:self.rControls];

        // Update layout
        [self updateLayout:frameRect];*/
        [self updateLayout:frameRect];
 }
    return self;
}

- (BOOL) isFlipped {
    return YES;
}

- (void)updateLayout:(NSRect)frame {
    [self.scroll updateLayout:frame];
    [self setFrame:frame];
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

@end
