#import <Cocoa/Cocoa.h>
#import "lib/AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [NSApplication sharedApplication];
        AppDelegate *delegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:delegate];
        return NSApplicationMain(argc, argv);
    }
}
