//
//  ViewButtons.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//
#import "Constants.h"
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
@property (nonatomic, strong) NSButton *bToolbar;
@property (nonatomic, strong) NSButton *bAccept;

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

        style = CTBezelStyleAccessoryBarAction;
        self.bRoundRect = [self createButtonWithTitle:@"R Rect" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRoundRect];
        

        style = CTBezelStylePush;
        self.bRounded = [self createButtonWithTitle:@"Rounded" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRounded];
        

        style = CTBezelStyleSmallSquare;
        self.bSmallSquare = [self createButtonWithTitle:@"Small Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bSmallSquare];
        

        style = CTBezelStyleFlexiblePush;
        self.bRegularSquare = [self createButtonWithTitle:@"Regular Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRegularSquare];


        style = CTBezelStyleShadowlessSquare;
        self.bShadowless = [self createButtonWithTitle:@"Shadowless" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bShadowless];

        // 2nd line


        style = CTBezelStyleFlexiblePush;
        self.bThicker = [self createButtonWithTitle:@"Thicker" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bThicker];


        style = CTBezelStyleFlexiblePush;
        self.bThickSquare = [self createButtonWithTitle:@"Thick Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bThickSquare];

        style = CTBezelStyleCircular;
        self.bCircular = [self createButtonWithTitle:@"Circular" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bCircular];
        

        style = CTBezelStyleDisclosure;
        self.disclosureButtonIsOpen = NO;
        self.bDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];

        [self.bDisclosure setButtonType:CTButtonTypePushOnPushOff];
        [self addSubview:self.bDisclosure];
        
        style = CTBezelStylePushDisclosure;
        self.bRoundedDisclosure = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];

        [self.bRoundedDisclosure setButtonType:CTButtonTypePushOnPushOff];
        [self addSubview:self.bRoundedDisclosure];

        style = CTBezelStyleHelpButton;
        self.bHelp = [self createButtonWithTitle:@"" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bHelp];

        // 3rd line

        style = CTBezelStyleAccessoryBar;
        self.bRecessed = [self createButtonWithTitle:@"Recessed" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bRecessed];


        style = CTBezelStyleTexturedRounded;
        self.bTexRounded = [self createButtonWithTitle:@"T Rounded" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bTexRounded];
        
        style = CTBezelStyleTexturedSquare;
        self.bTexSquare = [self createButtonWithTitle:@"T Sqr" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bTexSquare];
 
        style = CTBezelStyleToolbar;
        self.bToolbar = [self createButtonWithTitle:@"Toolbar" frame:NSMakeRect(0, 0, 0, 0) bezelStyle:style];
        [self addSubview:self.bToolbar];

        // Action styles
        self.lActions = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.lActions setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lActions setSelectable:NO];
        [self.lActions setBezeled:NO];
        [self.lActions setDrawsBackground:NO];
        [self.lActions setStringValue:@"Actions"];
        [self addSubview:self.lActions];
        

        style = CTBezelStyleTexturedRounded;

        // Definir el color d'accent
        self.bAccept = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 100, 30)];
        [self.bAccept setTitle:@"Accept"];

        [self.bAccept setButtonType:CTButtonTypeMomentaryPushIn];
        [self.bAccept setKeyEquivalent:@"\r"];
        [self addSubview:self.bAccept];
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
    CGFloat buttonY = 15;
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 30;
    CGFloat buttonSpacingHorizontal = buttonWidth + 20;
    CGFloat buttonSpacingVertical = buttonHeight + 10;
    
    // Label styles
    [self.lStyles setFrame:NSMakeRect(20, buttonY, 150, 30)];

    // 1st line
    buttonX = 20;
    buttonY = buttonY + 25;
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
    buttonX = buttonX + buttonSpacingHorizontal;
    [self.bToolbar setFrame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    
    // Label actions
    buttonX = 20;
    buttonY = buttonY + 50;
    [self.lActions setFrame:NSMakeRect(20, buttonY, 150, 30)];
    
    // 4th line
    buttonX = 20;
    buttonY = buttonY + 25;
    [self.bAccept setFrame:NSMakeRect(20, buttonY, buttonWidth, 30)];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
}

@end

