//
//  MenuBuilder.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#import "MenuBuilder.h"

@implementation MenuBuilder

+ (void)setupMenu {
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
    
    [NSApp setMainMenu:menubar];
}

- (void)emptyAction:(id)sender {
    NSLog(@"Empty menu action");
}

@end
