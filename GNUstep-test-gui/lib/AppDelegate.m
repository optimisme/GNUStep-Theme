//  AppDelegate.m
//  WidgetTool
//
//  Created by Albert Palacios Jimenez on 12/3/23.
//

#import "AppDelegate.h"
#import "MenuBuilder.h"
#import "ViewButtons.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) ViewButtons *vButtons;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Window
    NSRect contentRect = NSMakeRect(0, 0, 800, 600);
    NSWindowStyleMask styleMask = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    self.window = [[NSWindow alloc] initWithContentRect:contentRect styleMask:styleMask backing:NSBackingStoreBuffered defer:NO];
    [self.window setTitle:@"Window Hello"];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
    [self.window makeMainWindow];

    // Setup menu
    [MenuBuilder setupMenu];

    // Label
    self.label = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 560, 80, 30)];
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.label setSelectable:NO];
    [self.label setBezeled:NO];
    [self.label setDrawsBackground:NO];
    [self.label setStringValue:@"buttons"];
    [[self.window contentView] addSubview:self.label];
    
    
    self.vButtons = [[ViewButtons alloc] initWithFrame:NSMakeRect(20, 200, 100, 30)];
    [[self.window contentView] addSubview:self.vButtons];
    
/*
    // Buttons
    CGFloat buttonY = 520;
    CGFloat buttonX = 20;
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 30;
    CGFloat buttonSpacing = 120;

    // Botó Per Defecte
    NSButton *buttonDefault = [self createButtonWithTitle:@"Default" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    [[self.window contentView] addSubview:buttonDefault];
*/

/*
    // Botó Acció
    buttonX += buttonSpacing;
    NSButton *actionButton = [self createButtonWithTitle:@"Action" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];

#ifdef GNS
    [self.actionButton setButtonType:NSToggleButton];
    [self.actionButton setBezelStyle:NSRoundedBezelStyle];
#else
    [self.actionButton setButtonType:NSButtonTypeToggle];
    [self.actionButton setBezelStyle:NSBezelStyleRounded];
    [self.actionButton setKeyEquivalent:@"\r"];
    [self.actionButton setHighlighted: YES];
#endif
    
    [[self.window contentView] addSubview:actionButton];

    // Botó Destructiu
    buttonX += buttonSpacing;
    NSButton *destructiveButton = [self createButtonWithTitle:@"Destructive" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
#ifdef GNS
    [self.destructiveButton setBezelStyle:NSRoundedBezelStyle];
#else
    [self.destructiveButton setBezelStyle:NSBezelStyleRegularSquare];
#endif
    [[self.window contentView] addSubview:destructiveButton];

    // Botó Acció Deshabilitat
    buttonX += buttonSpacing;
    NSButton *disabledActionButton = [self createButtonWithTitle:@"Disabled Action" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    [disabledActionButton setEnabled:NO];
    [[self.window contentView] addSubview:disabledActionButton];

    // Botó Destructiu Deshabilitat
    buttonX += buttonSpacing;
    NSButton *disabledDestructiveButton = [self createButtonWithTitle:@"Disabled Destructive" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    [disabledDestructiveButton setEnabled:NO];
    [[self.window contentView] addSubview:disabledDestructiveButton];


    [[self.window contentView] addSubview:self.button];
 */

    // Manage constraints positioning (GNUStep does not have constraints autolayouts)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidResize:)
                                                 name:NSWindowDidResizeNotification
                                               object:self.window];
    [self windowDidResize:nil];
}

- (void)windowDidResize:(NSNotification *)notification {
    NSView *contentView = (NSView *)self.window.contentView;
    NSRect contentViewBounds = contentView.bounds;
    NSRect newLabelFrame = NSMakeRect(20, contentViewBounds.size.height - 50, 80, 30);
    [self.label setFrame:newLabelFrame];
    NSRect newButtonFrame = NSMakeRect(20, contentViewBounds.size.height - 90, 100, 30);
    [self.vButtons setFrame:newButtonFrame];
}

- (NSButton *)createButtonWithTitle:(NSString *)title frame:(NSRect)frame {
    NSButton *button = [[NSButton alloc] initWithFrame:frame];
    [button setTitle:title];
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
    return button;
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked");
}

// Terminates the application when the window is closed.
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

@end

