//
//  AppDelegate.m
//  WidgetTool
//
//  Created by Albert Palacios Jimenez on 12/3/23.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    NSWindow *window;
    NSTextField *label;
    NSButton *button;
    NSProgressIndicator *progressBar1;
    NSProgressIndicator *progressBar2;
    NSButton *toggleButton;
}

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) NSButton *button;
@property (nonatomic, strong) NSProgressIndicator *progressBar1;
@property (nonatomic, strong) NSProgressIndicator *progressBar2;
@property (nonatomic, strong) NSButton *toggleButton;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize label = _label;
@synthesize button = _button;
@synthesize progressBar1 = _progressBar1;
@synthesize progressBar2 = _progressBar2;
@synthesize toggleButton = _toggleButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // Window
    NSRect contentRect = NSMakeRect(0, 0, 800, 600);
    NSWindowStyleMask styleMask = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    window = [[NSWindow alloc] initWithContentRect:contentRect styleMask:styleMask backing:NSBackingStoreBuffered defer:NO];
    [window setTitle:@"Window Hello"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    [window makeMainWindow];

    // Setup menu
    [self setupMenu];

    // Label
    label = [[NSTextField alloc] initWithFrame: NSMakeRect(30, 30, 80, 30)];
    [label setSelectable:NO];
    [label setBezeled:NO];
    [label setDrawsBackground:NO];
    [label setStringValue:@"Hello World"];
    [[window contentView] addSubview:label];

    // Button
    button = [[NSButton alloc] initWithFrame:NSMakeRect(120, 30, 100, 30)];
    [button setTitle:@"Click me"];
    #ifdef GNS
        [button setButtonType:NSMomentaryPushButton];
        [button setBezelStyle:NSRoundedBezelStyle];
    #else 
        [button setButtonType:NSButtonTypeMomentaryPushIn];
        [button setBezelStyle:NSBezelStyleRounded];
    #endif
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
    [[window contentView] addSubview:button];

    // Progress Bar 1 (Indeterminate)
    progressBar1 = [[NSProgressIndicator alloc] initWithFrame:NSMakeRect(30, 550, 200, 20)];
    [progressBar1 setStyle:NSProgressIndicatorBarStyle];
    [progressBar1 setIndeterminate:YES];
    [progressBar1 startAnimation:nil];
    [[window contentView] addSubview:progressBar1];

    NSBox *border1 = [[NSBox alloc] initWithFrame:NSMakeRect(30, 500, 200, 20)];
    [border1 setBoxType:NSBoxPrimary];
    [border1 setBorderType:NSLineBorder];
    [border1 setBorderColor:[NSColor blackColor]];
    [border1 setBorderWidth:1];
    [border1 setContentViewMargins:NSMakeSize(0, 0)];
    [border1 setTitle:@"Progress Bar 1"];
    [border1 setTitlePosition:NSAtBottom];
    [[window contentView] addSubview:border1];

    // Progress Bar 2 (Determinate at 75%)
    progressBar2 = [[NSProgressIndicator alloc] initWithFrame:NSMakeRect(240, 550, 200, 20)];
    [progressBar2 setStyle:NSProgressIndicatorBarStyle];
    [progressBar2 setIndeterminate:NO];
    [progressBar2 setMaxValue:100];
    [progressBar2 setDoubleValue:75];
    [[window contentView] addSubview:progressBar2];

    // Button to toggle progress bar value
    toggleButton = [[NSButton alloc] initWithFrame:NSMakeRect(450, 550, 100, 30)];
    [toggleButton setTitle:@"Toggle Value"];
    #ifdef GNS
        [toggleButton setButtonType:NSToggleButton];
        [toggleButton setBezelStyle:NSRoundedBezelStyle];
    #else
        [toggleButton setButtonType:NSButtonTypeMomentaryPushIn];
        [toggleButton setBezelStyle:NSBezelStyleRounded];
    #endif
    [toggleButton setTarget:self];
    [toggleButton setAction:@selector(toggleProgressValue:)];
    [[window contentView] addSubview:toggleButton];

    NSBox *border2 = [[NSBox alloc] initWithFrame:NSMakeRect(240, 550, 200, 20)];
    [border2 setBoxType:NSBoxCustom];
    [border2 setBorderType:NSLineBorder];
    [border2 setBorderColor:[NSColor blackColor]];
    [border2 setBorderWidth:1];
    [border2 setContentViewMargins:NSMakeSize(0, 0)];
    [border2 setTitle:@"DEF"];
    [[window contentView] addSubview:border2];
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
    NSMenuItem *appMenuItem = [NSMenuItem new];
    NSMenu *appMenu = [NSMenu new];
    [appMenu addItemWithTitle:@"About" action:@selector(aboutAction:) keyEquivalent:@""];
    [appMenu addItem:[NSMenuItem separatorItem]];
    [appMenu addItemWithTitle:@"Settings" action:@selector(settingsAction:) keyEquivalent:@""];
    [appMenu addItemWithTitle:@"Accounts" action:@selector(accountsAction:) keyEquivalent:@""];
    [appMenu addItem:[NSMenuItem separatorItem]];
    [appMenu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
    [appMenuItem setSubmenu:appMenu];
    [menubar addItem:appMenuItem];

    // File menu
    NSMenuItem *fileMenuItem = [NSMenuItem new];
    NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@"File"];
    [fileMenu addItemWithTitle:@"Open" action:@selector(openAction:) keyEquivalent:@""];
    [fileMenu addItemWithTitle:@"Save" action:@selector(saveAction:) keyEquivalent:@""];
    [fileMenuItem setSubmenu:fileMenu];
    [menubar addItem:fileMenuItem];

    [NSApp setMainMenu:menubar];
}

@end
