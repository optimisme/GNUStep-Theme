#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

#ifdef GNS
    #import <GNUstepGUI/GSTheme.h>
#endif

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AppDelegate *delegate = [[AppDelegate alloc] init];

        [NSApplication sharedApplication];
        [NSApp setDelegate:delegate];

        return NSApplicationMain(argc, argv);
    }
}