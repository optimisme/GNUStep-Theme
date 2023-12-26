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
@property (nonatomic, strong) VTRow *rTypes;
@property (nonatomic, strong) VTRow *rActions;
@property (nonatomic, strong) VTRow *rControls;
@property (nonatomic, strong) NSTextField *lStyles;
@property (nonatomic, strong) NSTextField *lTypes;
@property (nonatomic, strong) NSTextField *lActions;
@property (nonatomic, strong) NSTextField *lControls;
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
@property (nonatomic, strong) NSButton *bToolBarPushOnPushOff;
@property (nonatomic, strong) NSButton *bToogle;
@property (nonatomic, strong) NSButton *bAccept;
@property (nonatomic, strong) NSButton *bCheckbox;
@property (nonatomic, strong) NSButton *bCheckboxMixed;
@property (nonatomic, strong) NSButton *bRadio0;
@property (nonatomic, strong) NSButton *bRadio1;

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
    [self.scroll updateLayout:frame];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
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

@end
