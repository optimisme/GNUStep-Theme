//  AppDelegate.m
//  WidgetTool
//
//  Created by Albert Palacios Jimenez on 12/3/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) NSButton *button;
@property (nonatomic, strong) NSProgressIndicator *progressBar1;
@property (nonatomic, strong) NSProgressIndicator *progressBar2;
@property (nonatomic, strong) NSButton *toggleButton;

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
    [self setupMenu];

    // Label
    self.label = [[NSTextField alloc] initWithFrame: NSMakeRect(30, 30, 80, 30)];
    [self.label setSelectable:NO];
    [self.label setBezeled:NO];
    [self.label setDrawsBackground:NO];
    [self.label setStringValue:@"Hello World"];
    [[self.window contentView] addSubview:self.label];

    // Button
    self.button = [[NSButton alloc] initWithFrame:NSMakeRect(120, 30, 100, 30)];
    [self.button setTitle:@"Click me"];
    #ifdef GNS
        [self.button setButtonType:NSMomentaryPushButton];
        [self.button setBezelStyle:NSRoundedBezelStyle];
    #else 
        [self.button setButtonType:NSButtonTypeMomentaryPushIn];
        [self.button setBezelStyle:NSBezelStyleRounded];
    #endif
    [self.button setTarget:self];
    [self.button setAction:@selector(buttonClicked:)];
    [[self.window contentView] addSubview:self.button];

    // Progress Bar 1 (Indeterminate)
    self.progressBar1 = [[NSProgressIndicator alloc] initWithFrame:NSMakeRect(30, 550, 200, 20)];
    [self.progressBar1 setStyle:NSProgressIndicatorBarStyle];
    [self.progressBar1 setIndeterminate:YES];
    [self.progressBar1 startAnimation:nil];
    [[self.window contentView] addSubview:self.progressBar1];

    NSBox *border1 = [[NSBox alloc] initWithFrame:NSMakeRect(30, 500, 200, 20)];
    [border1 setBoxType:NSBoxPrimary];
    [border1 setBorderType:NSLineBorder];
    [border1 setBorderColor:[NSColor blackColor]];
    [border1 setBorderWidth:1];
    [border1 setContentViewMargins:NSMakeSize(0, 0)];
    [border1 setTitle:@"Progress Bar 1"];
    [border1 setTitlePosition:NSAtBottom];
    [[self.window contentView] addSubview:border1];

    // Progress Bar 2 (Determinate at 75%)
    self.progressBar2 = [[NSProgressIndicator alloc] initWithFrame:NSMakeRect(240, 550, 200, 20)];
    [self.progressBar2 setStyle:NSProgressIndicatorBarStyle];
    [self.progressBar2 setIndeterminate:NO];
    [self.progressBar2 setMaxValue:100];
    [self.progressBar2 setDoubleValue:75];
    [[self.window contentView] addSubview:self.progressBar2];

    // Button to toggle progress bar value
    self.toggleButton = [[NSButton alloc] initWithFrame:NSMakeRect(450, 550, 100, 30)];
    [self.toggleButton setTitle:@"Toggle Value"];
    #ifdef GNS
        [self.toggleButton setButtonType:NSToggleButton];
        [self.toggleButton setBezelStyle:NSRoundedBezelStyle];
    #else
        [self.toggleButton setButtonType:NSButtonTypeMomentaryPushIn];
        [self.toggleButton setBezelStyle:NSBezelStyleRounded];
    #endif
    [self.toggleButton setTarget:self];
    [self.toggleButton setAction:@selector(toggleProgressValue:)];
    [[self.window contentView] addSubview:self.toggleButton];

    NSBox *border2 = [[NSBox alloc] initWithFrame:NSMakeRect(240, 550, 200, 20)];
    [border2 setBoxType:NSBoxCustom];
    [border2 setBorderType:NSLineBorder];
    [border2 setBorderColor:[NSColor blackColor]];
    [border2 setBorderWidth:1];
    [border2 setContentViewMargins:NSMakeSize(0, 0)];
    [border2 setTitle:@"DEF"];
    [[self.window contentView] addSubview:border2];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked");
}

- (void)toggleProgressValue:(id)sender {
    NSLog(@"Toggle progress bar value from: %f", self.progressBar2.doubleValue);
    if (self.progressBar2 != nil) {
        if (self.progressBar2.doubleValue == 25) {
            [self.progressBar2 setDoubleValue:75];
        } else {
            [self.progressBar2 setDoubleValue:25];
        }
        NSLog(@"Toggle progress bar value to: %f", self.progressBar2.doubleValue);
    } else {
        NSLog(@"Progress bar is nil!");
    }
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

- (void) menuAction: (id)sender {
    NSLog(@"%@", sender);
}

- (void) setupMenu {
    NSMenu *menubar = [NSMenu new];

    // Main application menu
    [menubar addItemWithTitle:@"About" action:@selector(aboutAction:) keyEquivalent:@""];
    [menubar addItem:[NSMenuItem separatorItem]];
    [menubar addItemWithTitle:@"Settings" action:@selector(settingsAction:) keyEquivalent:@""];
    [menubar addItemWithTitle:@"Accounts" action:@selector(accountsAction:) keyEquivalent:@""];
    [menubar addItem:[NSMenuItem separatorItem]];
    [menubar addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];

    // File menu
    NSMenuItem *fileMenuItem = [NSMenuItem new];
    NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@""]; // Deixa el títol del menú buit
    [fileMenuItem setTitle:@"FileB"]; // Estableix el títol del menú principal
    [fileMenuItem setSubmenu:fileMenu];
    [menubar addItem:fileMenuItem];

    [fileMenu addItemWithTitle:@"Open" action:@selector(openAction:) keyEquivalent:@""];
    [fileMenu addItemWithTitle:@"Save" action:@selector(saveAction:) keyEquivalent:@""];
    [fileMenuItem setSubmenu:fileMenu];
    [menubar addItem:fileMenuItem];

    [NSApp setMainMenu:menubar];
}

@end
