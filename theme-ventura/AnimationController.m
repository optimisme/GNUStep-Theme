// AnimationController.m
#import "AnimationController.h"

@interface AnimationController ()

@property (nonatomic, strong) AnimationData *animationData;
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic, strong, readwrite) NSArray *propertyList;

@end

@implementation AnimationController

- (instancetype)initWithAnimationData:(AnimationData *)animationData {
    self = [super init];
    if (self) {
        _animationData = [animationData copy];
        _propertyList = [[self getPropertyListFromKeyframes:animationData.keyframes] copy];
    }
    return self;
}

- (void)dealloc {
    // Alliberar els objectes creats per aquesta instància
    [self.propertyList release];
    [self.animationData release];

    [super dealloc];
}

- (void)start {
    self.startTime = [NSDate timeIntervalSinceReferenceDate];
}

- (BOOL)isEnded {
    NSTimeInterval elapsedTime = [NSDate timeIntervalSinceReferenceDate] - self.startTime;
    float durationPerIteration = self.animationData.duration;
    float totalAnimationDuration = self.animationData.iterations * durationPerIteration;

    if (elapsedTime >= totalAnimationDuration) {
        return YES;
    }

    return NO;
}

- (NSArray *)getPropertyListFromKeyframes:(NSArray *)keyframes {
    NSMutableSet *propertySet = [NSMutableSet set];
    for (NSDictionary *keyframe in keyframes) {
        NSDictionary *properties = keyframe[@"values"];
        [propertySet addObjectsFromArray:[properties allKeys]];
    }
    return [[propertySet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

- (float)calculatePercentageWithDirection:(NSString *)direction elapsedTime:(NSTimeInterval)elapsedTime durationPerIteration:(float)durationPerIteration {
    
    float normalizedDurationPerIteration = durationPerIteration;
    if ([direction isEqualToString:@"alternate"] || [direction isEqualToString:@"alternate-reverse"]) {
        normalizedDurationPerIteration = durationPerIteration / 2;
    }

    float percentage = (elapsedTime / normalizedDurationPerIteration) - floor(elapsedTime / normalizedDurationPerIteration);
    int iterations = floor(elapsedTime / normalizedDurationPerIteration);

    if ([direction isEqualToString:@"reverse"]) {

        percentage = 1.0 - percentage;

    } else {
        if ([direction isEqualToString:@"alternate"]) {
            if (iterations % 2 == 1) {
                percentage = 1.0 - percentage;
            }
        } else if ([direction isEqualToString:@"alternate-reverse"]) {
            if (iterations % 2 == 0) {
                percentage = 1.0 - percentage;
            }
        }
    }

    return 100 * percentage;
}

- (NSArray *)getPreviousAndNextKeyframesForPercentage:(float)progress {
    NSArray *keyframes = self.animationData.keyframes;
    NSDictionary *previousKeyframe = nil;
    NSDictionary *nextKeyframe = nil;
    NSString *direction = self.animationData.direction;
    BOOL isAscending = YES;

    if ([direction isEqualToString:@"reverse"]) {
        isAscending = NO;
    } else if ([direction isEqualToString:@"alternate"] && progress > 50.0) {
        isAscending = NO;
    } else if ([direction isEqualToString:@"alternate-reverse"] && progress < 50.0) {
        isAscending = NO;
    }

    if (isAscending) {
        for (NSDictionary *keyframe in keyframes) {
            float keyframeProgress = [keyframe[@"percentage"] floatValue];

            if (progress < keyframeProgress) {
                nextKeyframe = keyframe;
                break;
            }

            previousKeyframe = keyframe;
        }
    } else {
        for (NSInteger i = keyframes.count - 1; i >= 0; i--) {
            NSDictionary *keyframe = keyframes[i];
            float keyframeProgress = [keyframe[@"percentage"] floatValue];

            if (progress > keyframeProgress) {
                nextKeyframe = keyframe;
                break;
            }

            previousKeyframe = keyframe;
        }
    }

    if (isAscending) {
        if (previousKeyframe == nil) {
            previousKeyframe = [keyframes firstObject];
        }
        if (nextKeyframe == nil) {
            nextKeyframe = [keyframes lastObject];
        }
    } else {
        if (previousKeyframe == nil) {
            previousKeyframe = [keyframes lastObject];
        }
        if (nextKeyframe == nil) {
            nextKeyframe = [keyframes firstObject];
        }
    }

    return @[previousKeyframe, nextKeyframe];
}

- (NSDictionary *)run {

    NSMutableDictionary *updatedValues = [NSMutableDictionary dictionary];

    NSTimeInterval elapsedTime = [NSDate timeIntervalSinceReferenceDate] - self.startTime;
    float durationPerIteration = self.animationData.duration;
    float percentage = [self calculatePercentageWithDirection:self.animationData.direction elapsedTime:elapsedTime durationPerIteration:durationPerIteration];

    for (NSString *property in self.propertyList) {
        NSArray *previousAndNextKeyframes = [self getPreviousAndNextKeyframesForPercentage:percentage];
        NSDictionary *previousKeyframe = previousAndNextKeyframes[0];
        NSDictionary *nextKeyframe = previousAndNextKeyframes[1];

        float previousPercentage = [previousKeyframe[@"percentage"] floatValue];
        float nextPercentage = [nextKeyframe[@"percentage"] floatValue];

        float progressRange = nextPercentage - previousPercentage;
        float currentProgress = 0.0;

        if (progressRange == 0) {
            currentProgress = 0;
        } else {
            currentProgress = (percentage - previousPercentage) / progressRange;
        }

        float initialValue = [previousKeyframe[@"values"][property] floatValue];
        float finalValue = [nextKeyframe[@"values"][property] floatValue];

        float interpolatedValue = [self interpolatedValueWithTimingFunction:previousKeyframe[@"timing"] fromValue:initialValue toValue:finalValue progress:currentProgress];
        updatedValues[property] = @(interpolatedValue);
    }

    return [NSDictionary dictionaryWithDictionary:updatedValues];
}

- (CGFloat)interpolatedValueWithTimingFunction:(NSString *)timingFunction fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue progress:(CGFloat)progress {
    CGFloat p = progress;
    CGFloat q = p; // default to linear

    if ([timingFunction isEqualToString:@"ease"]) {
        q = 0.5 * (1 - cos(M_PI * p));
    } else if ([timingFunction isEqualToString:@"ease-in"]) {
        q = p * p * p;
    } else if ([timingFunction isEqualToString:@"ease-out"]) {
        p--;
        q = 1 + p * p * p;
    } else if ([timingFunction isEqualToString:@"ease-in-out"]) {
        if ((p *= 2) < 1) {
            q = 0.5 * p * p * p;
        } else {
            p -= 2;
            q = 0.5 * (p * p * p + 2);
        }
    } else if ([timingFunction isEqualToString:@"in-quad"]) {
        q = p * p;
    } else if ([timingFunction isEqualToString:@"out-quad"]) {
        q = p * (2 - p);
    } else if ([timingFunction isEqualToString:@"in-out-quad"]) {
        if ((p *= 2) < 1) {
            q = 0.5 * p * p;
        } else {
            p--;
            q = -0.5 * (p * (p - 2) - 1);
        }
    } else if ([timingFunction isEqualToString:@"out-cube"]) {
        p--;
        q = 1 + p * p * p;
    } else if ([timingFunction isEqualToString:@"in-out-cube"]) {
        if ((p *= 2) < 1) {
            q = 0.5 * p * p * p;
        } else {
            p -= 2;
            q = 0.5 * (p * p * p + 2);
        }
    } else if ([timingFunction isEqualToString:@"in-quart"]) {
        q = p * p * p * p;
    } else if ([timingFunction isEqualToString:@"out-quart"]) {
        p--;
        q = 1 - p * p * p * p;
    } else if ([timingFunction isEqualToString:@"in-outQuart"]) {
        if ((p *= 2) < 1) {
            q = 0.5 * p * p * p * p;
        } else {
            p -= 2;
            q = -0.5 * (p * p * p * p - 2);
        }
    } else if ([timingFunction isEqualToString:@"in-quint"]) {
        q = p * p * p * p * p;
    } else if ([timingFunction isEqualToString:@"out-quint"]) {
        p--;
        q = 1 + p * p * p * p * p;
    } else if ([timingFunction isEqualToString:@"in-outQuint"]) {
        if ((p *= 2) < 1) {
            q = 0.5 * p * p * p * p * p;
        } else {
            p -= 2;
            q = 0.5 * (p * p * p * p * p + 2);
        }
    } else if ([timingFunction isEqualToString:@"in-sine"]) {
        q = 1 - cos(p * M_PI_2);
    } else if ([timingFunction isEqualToString:@"out-sine"]) {
        q = sin(p * M_PI_2);
    } else if ([timingFunction isEqualToString:@"in-outSine"]) {
        q = 0.5 * (1 - cos(M_PI * p));
    } else if ([timingFunction isEqualToString:@"in-expo"]) {
        q = (p == 0) ? 0 : pow(1024, p - 1);
    } else if ([timingFunction isEqualToString:@"outExpo"]) {
        q = (p == 1) ? 1 : 1 - pow(2, -10 * p);
    } else if ([timingFunction isEqualToString:@"in-outExpo"]) {
        if (p == 0) q = 0;
        if (p == 1) q = 1;
        if ((p *= 2) < 1) q = 0.5 * pow(1024, p - 1);
        q = 0.5 * (-pow(2, -10 * (p - 1)) + 2);
    } else if ([timingFunction isEqualToString:@"in-circ"]) {
        q = 1 - sqrt(1 - (p * p));
    } else if ([timingFunction isEqualToString:@"out-circ"]) {
        q = sqrt((2 - p) * p);
    } else if ([timingFunction isEqualToString:@"in-out-circ"]) {
        if ((p *= 2.0) < 1.0) {
            q = -0.5 * (sqrt(1.0 - p * p) - 1.0);
        } else {
            p -= 2.0;
            q = 0.5 * (sqrt(1.0 - (p * p)) + 1.0);
        }
    } else if ([timingFunction isEqualToString:@"in-back"]) {
        double s = 1.70158;
        q = p * p * ((s + 1) * p - s);
    } else if ([timingFunction isEqualToString:@"out-back"]) {
        double s = 1.70158;
        p--;
        q = 1 + (p * p * ((s + 1) * p + s));
    } else if ([timingFunction isEqualToString:@"in-bounce"]) {
        double px = 1 - p;
        if (px < 1 / 2.75) {
            q = 1 - (7.5625 * px * px);
        } else if (px < 2 / 2.75) {
            px -= 1.5 / 2.75;
            q = 1 - (7.5625 * px * px + 0.75);
        } else if (px < 2.5 / 2.75) {
            px -= 2.25 / 2.75;
            q = 1 - (7.5625 * px * px + 0.9375);
        } else {
            px -= 2.625 / 2.75;
            q = 1 - (7.5625 * px * px + 0.984375);
        }
    } else if ([timingFunction isEqualToString:@"out-bounce"]) {
        if (p < 1 / 2.75) {
            q = 7.5625 * p * p;
        } else if (p < 2 / 2.75) {
            p -= 1.5 / 2.75;
            q = 7.5625 * p * p + 0.75;
        } else if (p < 2.5 / 2.75) {
            p -= 2.25 / 2.75;
            q = 7.5625 * p * p + 0.9375;
        } else {
            p -= 2.625 / 2.75;
            q = 7.5625 * p * p + 0.984375;
        }
    } else if ([timingFunction isEqualToString:@"in-out-bounce"]) {
       if (p < 0.5) {
            double pd = p * 2;
            double px = 1 - pd;
            if (px < 1 / 2.75) {
                q = 1 - (7.5625 * px * px);
            } else if (px < 2 / 2.75) {
                px -= 1.5 / 2.75;
                q = 1 - (7.5625 * px * px + 0.75);
            } else if (px < 2.5 / 2.75) {
                px -= 2.25 / 2.75;
                q = 1 - (7.5625 * px * px + 0.9375);
            } else {
                px -= 2.625 / 2.75;
                q = 1 - (7.5625 * px * px + 0.984375);
            }
            q = q * 0.5;
       } else {
            double px = p * 2 - 1;
            if (px < 1 / 2.75) {
                q = 1 - (7.5625 * px * px);
            } else if (px < 2 / 2.75) {
                px -= 1.5 / 2.75;
                q = 1 - (7.5625 * px * px + 0.75);
            } else if (px < 2.5 / 2.75) {
                px -= 2.25 / 2.75;
                q = 1 - (7.5625 * px * px + 0.9375);
            } else {
                px -= 2.625 / 2.75;
                q = 1 - (7.5625 * px * px + 0.984375);
            }
            q = q * 0.5 + 0.5;
       }
    } else if ([timingFunction isEqualToString:@"in-elastic"]) {
        if (p == 0) {
            q = 0;
        } else if (p == 1) {
            q = 1;
        } else {
            double p1 = 0.3;
            double p2 = p1 / 4;
            p -= 1;
            q = -(pow(2, 10 * p) * sin((p - p2) * (2 * M_PI) / p1));
        }
    } else if ([timingFunction isEqualToString:@"out-elastic"]) {
        if (p == 0) {
            q = 0;
        } else if (p == 1) {
            q = 1;
        } else {
            double p1 = 0.3;
            double p2 = p1 / 4;
            double s = sin((p - p2) * (2 * M_PI) / p1);
            double t = pow(2, -10 * p);
            q = t * s + 1;
        }
    } else if ([timingFunction isEqualToString:@"in-out-elastic"]) {
        if (p == 0) {
            q = 0;
        } else if (p == 1) {
            q = 1;
        } else {
            double p1 = 0.3 * 1.5;
            double p2 = p1 / 4;
            double s, t;
            if (p < 1) {
                s = sin((p - p2) * (2 * M_PI) / p1);
                t = pow(2, 10 * (p - 1));
                q = -0.5 * (t * s);
            } else {
                s = sin((p - p2) * (2 * M_PI) / p1);
                t = pow(2, -10 * (p - 1));
                q = 0.5 * (t * s) + 1;
            }
        }
    }

    return fromValue + (toValue - fromValue) * q;
}

@end
