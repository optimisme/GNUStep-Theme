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
@property (nonatomic, strong) VTRow *rStyles;
@property (nonatomic, strong) VTRow *rActions;
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
*/
/*
    // Shadow example
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[NSColor blackColor]];
    [shadow setShadowOffset:NSMakeSize(0, -1)];
    [shadow setShadowBlurRadius:20];
    [shadow set];
    NSRect shadowFrame = NSMakeRect(50, 50, 100, 50);
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:shadowFrame];
    [NSGraphicsContext saveGraphicsState];
    [[NSColor whiteColor] setFill];
    [path fill];
    [NSGraphicsContext restoreGraphicsState];
*/
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {

        CGFloat buttonWidth = 100;
        CGFloat buttonHeight = 30;
        
        self.scroll = [[VTScroll alloc] initWithFrame:frameRect];
        [self addSubview:self.scroll];
        
        self.column = [[VTColumn alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        [self.scroll addSubviewToScroll:self.column];
        //[self addSubview:self.column];
               
        NSBezelStyle style;

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
/*
        // Button with shadow example
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor blackColor]];
        [shadow setShadowOffset:NSMakeSize(0, 1)];
        [shadow setShadowBlurRadius:20];
        [self.buttonDefault setShadow:shadow];
*/
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
        self.bCircular = [self createButtonWithTitle:@"Circular" frame:NSMakeRect(0, 0, buttonWidth, buttonHeight) bezelStyle:style];
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
        [self.rActions addSubview:self.bAccept];
        
        // Update layout
        [self updateLayout:frameRect];
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

- (void)updateLayout:(NSRect)frame {

    [self.rStyles setFrame:frame];
    [self.rStyles updateLayout];
    
    [self.rActions setFrame:frame];
    [self.rActions updateLayout];
    
    [self.column setFrame:frame];
    [self.column updateLayout];
    
    [self.scroll setFrame:frame]; // TODO: Sometimes produces a segmentation fault on GNUStep
    [self.scroll.documentView setFrameSize:self.column.frame.size];
    [self.scroll reflectScrolledClipView:self.scroll.contentView];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
}

@end

