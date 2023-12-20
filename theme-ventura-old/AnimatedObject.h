// AnimatedObject.h

#import <Foundation/Foundation.h>

@interface AnimatedObject : NSObject

@property (nonatomic, assign) CGFloat targetFps;
@property (nonatomic, assign) CGFloat fps;
@property (nonatomic, assign) id object;

- (void)startAnimation;
- (void)stopAnimation;

@end