//
//  ViewButtons.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#import "ViewButtons.h"

@interface ViewButtons()

@property (nonatomic, strong) NSTextField *lStyles;
@property (nonatomic, strong) NSTextField *lActions;
@property (nonatomic, strong) NSButton *bDefault;
@property (nonatomic, strong) NSButton *bRoundRect;
@property (nonatomic, strong) NSButton *bRounded;
@property (nonatomic, strong) NSButton *bSmallSquare;
@property (nonatomic, strong) NSButton *bRegularSquare;
@property (nonatomic, strong) NSButton *bShadowless;
@property (nonatomic, strong) NSButton *bThicker;
@property (nonatomic, strong) NSButton *bThickSquare;
@property (nonatomic, strong) NSButton *bCircular;
@property (nonatomic, strong) NSButton *bDisclosure;
@property (nonatomic, assign) BOOL disclosureButtonIsOpen;
@property (nonatomic, strong) NSButton *bRoundedDisclosure;
@property (nonatomic, strong) NSButton *bHelp;
@property (nonatomic, strong) NSButton *bRecessed;
@property (nonatomic, strong) NSButton *bTexRounded;
@property (nonatomic, strong) NSButton *bTexSquare;

@end

@implementation ViewButtons
/*
- (void)drawRect:(NSRect)dirtyRect {
    NSColor *customColor = [NSColor redColor];
    [customColor set];
    NSRectFill(dirtyRect);
}
*/
- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        
        NSBezelStyle style;
        
        // Label styles
        self.lStyles = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lStyles setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lStyles setSelectable:NO];
        [self.lStyles setBezeled:NO];
        [self.lStyles setDrawsBackground:NO];
        [self.lStyles setStringValue:@"Bezel styles"];
        [self addSubview:self.lStyles];
        
        // 1st line
        
        // Default button
        self.bDefault = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.bDefault setTitle:@"Default"];
        [self.bDefault setTarget:self];
        [self.bDefault setAction:@selector(buttonClicked:)];
        [self addSubview:self.bDefault];
/*
        // Crear i aplicar l'ombra
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor blackColor]];
        [shadow setShadowOffset:NSMakeSize(0, 1)];
        [shadow setShadowBlurRadius:20];
        [self.buttonDefault setShadow:shadow];

*/
#ifdef GNS
        style = NSRoundRectBezelStyle;
#else
        style = NSBezelStyleAccessoryBarAction;
#endif
        self.bRoundRect = [self createButtonWithTitle:@"R Rect" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRoundRect];
        
#ifdef GNS
        style = NSRoundedBezelStyle;
#else
        style = NSBezelStylePush;
#endif
        self.bRounded = [self createButtonWithTitle:@"Rounded" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRounded];
        
#ifdef GNS
        style = NSSmallSquareBezelStyle;
#else
        style = NSBezelStyleSmallSquare;
#endif
        self.bSmallSquare = [self createButtonWithTitle:@"Small Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bSmallSquare];
        
#ifdef GNS
        style = NSRegularSquareBezelStyle;
#else
        style = NSBezelStyleFlexiblePush;
#endif
        self.bRegularSquare = [self createButtonWithTitle:@"Regular Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRegularSquare];

#ifdef GNS
        style = NSShadowlessSquareBezelStyle;
#else
        style = NSBezelStyleShadowlessSquare;
#endif
        self.bShadowless = [self createButtonWithTitle:@"Shadowless" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bShadowless];

        // 2nd line

#ifdef GNS
        style = NSThickerSquareBezelStyle;
#else
        style = NSBezelStyleFlexiblePush;
#endif
        self.bThicker = [self createButtonWithTitle:@"Thicker" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bThicker];

#ifdef GNS
        style = NSThickSquareBezelStyle;
#else
        style = NSBezelStyleFlexiblePush;
#endif
        self.bThickSquare = [self createButtonWithTitle:@"Thick Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bThickSquare];
        
#ifdef GNS
        style = NSCircularBezelStyle;
#else
        style = NSBezelStyleCircular;
#endif
        self.bCircular = [self createButtonWithTitle:@"Circular" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bCircular];
        
#ifdef GNS
        style = NSDisclosureBezelStyle;
#else
        style = NSBezelStyleDisclosure;
#endif
        self.disclosureButtonIsOpen = NO;
        self.bDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
#ifdef GNS
        [self.bDisclosure setButtonType:NSPushOnPushOffButton];
#else
        [self.bDisclosure setButtonType:NSButtonTypePushOnPushOff];
#endif
        [self addSubview:self.bDisclosure];
        
#ifdef GNS
        style = NSRoundedDisclosureBezelStyle;
#else
        style = NSBezelStylePushDisclosure;
#endif
        self.bRoundedDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
#ifdef GNS
        [self.bRoundedDisclosure setButtonType:NSPushOnPushOffButton];
#else
        [self.bRoundedDisclosure setButtonType:NSButtonTypePushOnPushOff];
#endif
        [self addSubview:self.bRoundedDisclosure];
        
#ifdef GNS
        style = NSHelpButtonBezelStyle;
#else
        style = NSBezelStyleHelpButton;
#endif
        self.bHelp = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bHelp];

        // 3rd line

#ifdef GNS
        style = NSRecessedBezelStyle;
#else
        style = NSBezelStyleAccessoryBar;
#endif
        self.bRecessed = [self createButtonWithTitle:@"Recessed" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRecessed];

#ifdef GNS
        style = NSTexturedRoundedBezelStyle;
#else
        style = NSBezelStyleToolbar;
#endif
        self.bTexRounded = [self createButtonWithTitle:@"T Rounded" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bTexRounded];
        
#ifdef GNS
        style = NSTexturedSquareBezelStyle;
#else
        style = NSBezelStyleTexturedSquare;
#endif
        self.bTexSquare = [self createButtonWithTitle:@"T Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bTexSquare];
 
        // Action styles
        self.lActions = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lActions setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lActions setSelectable:NO];
        [self.lActions setBezeled:NO];
        [self.lActions setDrawsBackground:NO];
        [self.lActions setStringValue:@"Actions"];
        [self addSubview:self.lActions];
        
    }
    
    return self;
}

- (NSButton *)createButtonWithTitle:(NSString *)title frame:(NSRect)frame bezelStyle:(NSBezelStyle)bezelStyle {
    NSButton *button = [[NSButton alloc] initWithFrame:frame];
    [button setTitle:title];
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
    [button setBezelStyle:bezelStyle];
    return button;
}

- (BOOL) isFlipped {
    return YES;
}

- (void)windowDidResize:(NSRect)frame {

    // Reposicionar els elements en base a les noves mides
    CGFloat buttonX = 20;
    CGFloat buttonY = 35;
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 30;
    CGFloat buttonSpacingHorizontal = buttonWidth + 20;
    CGFloat buttonSpacingVertical = buttonHeight + 20;
    
    // Label styles
    [self.lStyles setFrame:NSMakeRect(20, buttonY, 150, 30)];

    // 1st line
    buttonX = 20;
    buttonY = buttonY + buttonSpacingVertical;
    [self.bDefault setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bRoundRect setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bRounded setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bSmallSquare setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bRegularSquare setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bShadowless setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    
    // 2nd line
    buttonX = 20;
    buttonY = buttonY + buttonSpacingVertical;
    [self.bThicker setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bThickSquare setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bCircular setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bDisclosure setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bRoundedDisclosure setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bHelp setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    
    // 3rd line
    buttonX = 20;
    buttonY = buttonY + buttonSpacingVertical;
    [self.bRecessed setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bTexRounded setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bTexSquare setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    
    // Label actions
    buttonX = 20;
    buttonY = buttonY + 35;
    [self.lActions setFrame:NSMakeRect(20, buttonY, 150, 30)];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
}

@end
