#import <objc/runtime.h>
#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzling)

+ (void)swizzleInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
