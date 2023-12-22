//
//  ViewButtons.m
//  TestGUI
//
//  Created by Albert Palacios Jimenez on 22/12/23.
//

#import "ViewButtons.h"

@interface ViewButtons()

@property (nonatomic, strong) NSButton *buttonDefault;

@end

@implementation ViewButtons

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Crear el botó
        self.buttonDefault = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 100, 30)];
        [self.buttonDefault setTitle:@"Default"];
        [self.buttonDefault setTarget:self];
        [self.buttonDefault setAction:@selector(buttonClicked:)];
        [self addSubview:self.buttonDefault];
/*
        // Crear i aplicar l'ombra
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor blackColor]];
        [shadow setShadowOffset:NSMakeSize(0, 1)];
        [shadow setShadowBlurRadius:20];
        [self.buttonDefault setShadow:shadow];

*/
    }
    return self;
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button clicked in custom view");
}

@end
