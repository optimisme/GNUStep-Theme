// AnimationData.m
#import "AnimationData.h"

@implementation AnimationData

- (instancetype)initWithDuration:(float)duration iterations:(NSInteger)iterations direction:(NSString *)direction keyframes:(NSArray *)keyframes {
    self = [super init];
    if (self) {
        _duration = duration;
        _iterations = iterations;
        _direction = direction;
        _keyframes = keyframes;
    }
    return self;
}

- (void)dealloc {
    [_keyframes release];
    [super dealloc];
}

- (id)copyWithZone:(NSZone *)zone {
    AnimationData *copy = [[[self class] allocWithZone:zone] init];
    copy.duration = self.duration;
    copy.iterations = self.iterations;
    copy.direction = self.direction;
    copy.keyframes = [self.keyframes copy];
    return copy;
}

@end
