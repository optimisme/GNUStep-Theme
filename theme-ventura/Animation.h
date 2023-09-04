#import <Foundation/Foundation.h>

@interface Animation : NSObject

@property (nonatomic, strong) NSString *func;
@property (nonatomic, assign) NSTimeInterval timeDuration;
@property (nonatomic, assign) NSTimeInterval timeBegin;
@property (nonatomic, assign) NSTimeInterval timeEnd;
@property (nonatomic, assign) double value;
@property (nonatomic, assign) double valueBegin;
@property (nonatomic, assign) double valueEnd;
@property (nonatomic, assign) double valueDif;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name begin:(CGFloat)begin end:(CGFloat)end time:(CGFloat)time;
- (NSTimeInterval)getCurrentTime;
- (void)setAnimation:(NSString *)func begin:(double)begin end:(double)end time:(NSTimeInterval)time;
- (BOOL)isRunning;
- (BOOL)isEnded;
- (void)finishAnimation;
- (void)run;

@end
