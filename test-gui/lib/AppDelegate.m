//  AppDelegate.m
//  WidgetTool
//
//  Created by Albert Palacios Jimenez on 12/3/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) ViewButtons *vButtons;
@property (nonatomic, strong) ViewDrawing *vDrawing;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Window
    CGFloat windowWidth = 800;
    CGFloat windowHeight = 608; // Falla de 589 a 607
    
    NSRect contentRect = NSMakeRect(0, 0, windowWidth, windowHeight);
    NSWindowStyleMask styleMask = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    self.window = [[NSWindow alloc] initWithContentRect:contentRect styleMask:styleMask backing:NSBackingStoreBuffered defer:NO];
    [self.window setTitle:@"Theme test"];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
    [self.window makeMainWindow];

    // Setup menu
    [MenuBuilder setupMenu];
   
    self.vButtons = [[ViewButtons alloc] initWithFrame:NSMakeRect(0, 0, windowWidth, windowHeight)];
    [[self.window contentView] addSubview:self.vButtons];
    
    self.vDrawing = [[ViewDrawing alloc] initWithFrame:NSMakeRect(0, 0, windowWidth, windowHeight)];
    //[[self.window contentView] addSubview:self.vDrawing];

    // Manage constraints positioning (GNUStep does not have constraints autolayouts)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidResize:)
                                                 name:NSWindowDidResizeNotification
                                               object:self.window];
    [self windowDidResize:nil];
}

- (BOOL) isFlipped {
    return YES;
}

- (void)windowDidResize:(NSNotification *)notification {
    [self updateLayout];
}

- (void)updateLayout {
    NSView *contentView = (NSView *)self.window.contentView;
    NSRect newFrame = NSMakeRect(0, 0, contentView.bounds.size.width, contentView.bounds.size.height);

    [self.vButtons updateLayoutWithFrame:newFrame];
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
