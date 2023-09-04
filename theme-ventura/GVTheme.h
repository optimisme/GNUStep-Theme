#ifndef GNUstep_GVTHEME_H
#define GNUstep_GVTHEME_H

#import <objc/runtime.h>
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <GNUstepGUI/GSDisplayServer.h>
#import <GNUstepGUI/GSTheme.h>

@interface GVTheme : GSTheme

@property (class, nonatomic, readonly) GVTheme *sharedInstance;

+ (NSColor *)accentColor;
+ (void)setAccentColor:(NSColor *)accentColor;

+ (NSColor *)supportColor;
+ (void)setSupportColor:(NSColor *)supportColor;

+ (NSColor *)supportColorRelief;
+ (void)setSupportColorRelief:(NSColor *)supportColorRelief;

@end

#endif