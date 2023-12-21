//  AppDelegate.m
//  WidgetTool
//
//  Created by Albert Palacios Jimenez on 12/3/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) NSButton *buttonDefault;
/*
@property (nonatomic, strong) NSButton *actionButton;
@property (nonatomic, strong) NSButton *destructiveButton;
@property (nonatomic, strong) NSProgressIndicator *progressBar1;
@property (nonatomic, strong) NSProgressIndicator *progressBar2;
@property (nonatomic, strong) NSButton *toggleButton;
*/
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
    self.label = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 560, 80, 30)];
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.label setSelectable:NO];
    [self.label setBezeled:NO];
    [self.label setDrawsBackground:NO];
    [self.label setStringValue:@"buttons"];
    [[self.window contentView] addSubview:self.label];

    // Buttons
    CGFloat buttonY = 520;
    CGFloat buttonX = 20;
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 30;
    CGFloat buttonSpacing = 120;

    // Botó Per Defecte
    NSButton *buttonDefault = [self createButtonWithTitle:@"Default" frame:NSMakeRect(buttonX, buttonY, buttonWidth, buttonHeight)];
    [[self.window contentView] addSubview:buttonDefault];

    [NSGraphicsContext saveGraphicsState];
    
    // Definir el color de l'ombra
      NSColor *shadowColor = [NSColor blackColor];

/*

      // Crear l'ombra
      NSShadow *shadow = [[NSShadow alloc] init];
      [shadow setShadowColor:shadowColor];
      [shadow setShadowOffset:NSMakeSize(0, 1)]; // Desplaçament de l'ombra 1 píxel cap avall
      [shadow setShadowBlurRadius:20]; // Radi de difuminació de 20 píxels

      // Aplicar l'ombra al botó
      [buttonDefault setShadow:shadow];

      // Restaurar el context gràfic
      [NSGraphicsContext restoreGraphicsState];

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
#ifdef GNS
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidResize:)
                                                 name:NSWindowDidResizeNotification
                                               object:self.window];
#else
    // Afegeix restriccions
    [self.window.contentView addConstraints:@[
    [self.label.topAnchor constraintEqualToAnchor:self.window.contentView.topAnchor constant:20],
    [self.label.leadingAnchor constraintEqualToAnchor:self.window.contentView.leadingAnchor constant:20],
    [self.buttonDefault.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:10],
    [self.buttonDefault.leadingAnchor constraintEqualToAnchor:self.window.contentView.leadingAnchor constant:20]
    ]];
#endif
}

- (void)windowDidResize:(NSNotification *)notification {
#ifdef GNS
    NSView *contentView = (NSView *)self.window.contentView;
    NSRect contentViewBounds = contentView.bounds;
    NSRect newLabelFrame = NSMakeRect(20, contentViewBounds.size.height - 50, 80, 30);
    [self.label setFrame:newLabelFrame];
    NSRect newButtonFrame = NSMakeRect(20, contentViewBounds.size.height - 90, 100, 30);
    [self.buttonDefault setFrame:newButtonFrame];
#endif
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

- (void) setupMenu {

    NSMenu *menubar = [NSMenu new];
#ifdef GNS
    [menubar addItemWithTitle:@"About" action:@selector(emptyAction:) keyEquivalent:@""];
    [menubar addItem:[NSMenuItem separatorItem]];
    [menubar addItemWithTitle:@"Settings" action:@selector(emptyAction:) keyEquivalent:@""];
    [menubar addItemWithTitle:@"Accounts" action:@selector(emptyAction:) keyEquivalent:@""];
    [menubar addItem:[NSMenuItem separatorItem]];
    [menubar addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];

#else
    NSMenuItem *appMenuItem = [NSMenuItem new];
    [menubar addItem:appMenuItem];

    NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@""];
    [appMenuItem setSubmenu:appMenu];

    [appMenu addItemWithTitle:@"About" action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""];
    [appMenu addItemWithTitle:@"Settings" action:@selector(emptyAction:) keyEquivalent:@","];
    [appMenu addItemWithTitle:@"Accounts" action:@selector(emptyAction:) keyEquivalent:@""];
    [appMenu addItem:[NSMenuItem separatorItem]];
    [appMenu addItemWithTitle:@"Quit MyApp" action:@selector(terminate:) keyEquivalent:@"q"];

#endif
    [NSApp setMainMenu:menubar];


#ifdef GNS
    NSMenuItem *fileMenuItem = [NSMenuItem new];
    NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@""];
    [fileMenuItem setTitle:@"File"];
#else
    NSMenuItem *fileMenuItem = [NSMenuItem new];
    NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@"File"];
#endif

    [fileMenu addItemWithTitle:@"Open" action:@selector(emptyAction:) keyEquivalent:@"o"];
    [fileMenu addItemWithTitle:@"Save" action:@selector(emptyAction:) keyEquivalent:@"s"];
    [fileMenuItem setSubmenu:fileMenu];
    [menubar addItem:fileMenuItem];
}

- (void)emptyAction:(id)sender {

}

@end

