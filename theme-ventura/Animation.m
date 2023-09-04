#import "Animation.h"

@implementation Animation

- (instancetype)init {
    self = [super init];
    if (self) {
        _func = @"linear";
        _timeDuration = 0.0;
        _timeBegin = 0.0;
        _timeEnd = 0.0;
        _value = 0.0;
        _valueBegin = 0.0;
        _valueEnd = 0.0;
        _valueDif = 0.0;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name begin:(CGFloat)begin end:(CGFloat)end time:(CGFloat)time {
    self = [super init];
    if (self) {
        _func = name;
        _timeBegin = begin;
        _timeEnd = end;
        _timeDuration = time;
    }
    return self;
}

- (NSTimeInterval)getCurrentTime {
    NSDate *date = [NSDate date];
    return [date timeIntervalSince1970];
}

- (void)setAnimation:(NSString *)func begin:(double)begin end:(double)end time:(NSTimeInterval)time {
    
    self.func = func;

    self.timeDuration = time;
    self.timeBegin = [self getCurrentTime];
    self.timeEnd = self.timeBegin + time;

    self.value = begin;
    self.valueBegin = begin;
    self.valueEnd = end;
    self.valueDif = end - begin;
}

- (BOOL)isRunning {
    return self.timeEnd >= [self getCurrentTime];
}

- (BOOL)isEnded {
    return !self.isRunning;
}

- (void)finishAnimation {
    self.timeBegin = 0.0;
    self.timeDuration = 0.0;
    self.valueBegin = self.valueEnd;
    self.valueEnd = 0.0;
}

- (void)run {

    if ([self isEnded]) {
        return;
    }
    
    NSTimeInterval now = [self getCurrentTime];
    double p = (now - self.timeBegin) / self.timeDuration;
    
    double q = 0.0;
    SEL selector = NSSelectorFromString(self.func);
    if ([self respondsToSelector:selector]) {
        q = ((double (*)(id, SEL, double))objc_msgSend)(self, selector, p);
    } else {
        q = [self linear:p];
    }
    
    self.value = self.valueBegin + q * self.valueDif;
}

- (double)linear:(double)p {
    return p;
}

- (double)inQuad:(double)p {
    return p * p;
}

- (double)outQuad:(double)p {
    return p * (2 - p);
}

- (double)inOutQuad:(double)p {
    if ((p *= 2) < 1) {
        return 0.5 * p * p;
    } else {
        p--;
        return -0.5 * (p * (p - 2) - 1);
    }
}

- (double)inCube:(double)p {
    return p * p * p;
}

- (double)outCube:(double)p {
    p--;
    return 1 + p * p * p;
}

- (double)inOutCube:(double)p {
    if ((p *= 2) < 1) {
        return 0.5 * p * p * p;
    } else {
        p -= 2;
        return 0.5 * (p * p * p + 2);
    }
}

- (double)inQuart:(double)p {
    return p * p * p * p;
}

- (double)outQuart:(double)p {
    p--;
    return 1 - p * p * p * p;
}

- (double)inOutQuart:(double)p {
    if ((p *= 2) < 1) {
        return 0.5 * p * p * p * p;
    } else {
        p -= 2;
        return -0.5 * (p * p * p * p - 2);
    }
}

- (double)inQuint:(double)p {
    return p * p * p * p * p;
}

- (double)outQuint:(double)p {
    p--;
    return 1 + p * p * p * p * p;
}

- (double)inOutQuint:(double)p {
    if ((p *= 2) < 1) {
        return 0.5 * p * p * p * p * p;
    } else {
        p -= 2;
        return 0.5 * (p * p * p * p * p + 2);
    }
}

- (double)inSine:(double)p {
    return 1 - cos(p * M_PI_2);
}

- (double)outSine:(double)p {
    return sin(p * M_PI_2);
}

- (double)inOutSine:(double)p {
    return 0.5 * (1 - cos(M_PI * p));
}

- (double)inExpo:(double)p {
    return (p == 0) ? 0 : pow(1024, p - 1);
}

- (double)outExpo:(double)p {
    return (p == 1) ? 1 : 1 - pow(2, -10 * p);
}

- (double)inOutExpo:(double)p {
    if (p == 0) return 0;
    if (p == 1) return 1;
    if ((p *= 2) < 1) return 0.5 * pow(1024, p - 1);
    return 0.5 * (-pow(2, -10 * (p - 1)) + 2);
}

- (double)inCirc:(double)p {
    return 1 - sqrt(1 - (p * p));
}

- (double)outCirc:(double)p {
    return sqrt((2 - p) * p);
}

- (double)inOutCirc:(double)p {
    if ((p *= 2.0) < 1.0) return -0.5 * (sqrt(1.0 - p * p) - 1.0);
    p -= 2.0;
    return 0.5 * (sqrt(1.0 - (p * p)) + 1.0);
}

- (double)inBack:(double)p {
    double s = 1.70158;
    return p * p * ((s + 1) * p - s);
}

- (double)outBack:(double)p {
    double s = 1.70158;
    p--;
    return 1 + (p * p * ((s + 1) * p + s));
}

- (double)inOutBack:(double)p {
    double s = 1.70158 * 1.525;
    if ((p *= 2) < 1) return 0.5 * (p * p * ((s + 1) * p - s));
    p -= 2;
    return 0.5 * (p * p * ((s + 1) * p + s) + 2);
}

- (double)inBounce:(double)p {
    return 1 - [self outBounce:(1 - p)];
}

- (double)outBounce:(double)p {
    if (p < 1 / 2.75) {
        return 7.5625 * p * p;
    } else if (p < 2 / 2.75) {
        p -= 1.5 / 2.75;
        return 7.5625 * p * p + 0.75;
    } else if (p < 2.5 / 2.75) {
        p -= 2.25 / 2.75;
        return 7.5625 * p * p + 0.9375;
    } else {
        p -= 2.625 / 2.75;
        return 7.5625 * p * p + 0.984375;
    }
}

- (double)inOutBounce:(double)p {
    if (p < 0.5) return [self inBounce:p * 2] * 0.5;
    return [self outBounce:p * 2 - 1] * 0.5 + 0.5;
}

- (double)inElastic:(double)p {
    if (p == 0) return 0;
    if (p == 1) return 1;
    double p1 = 0.3;
    double p2 = p1 / 4;
    p--;
    return -(pow(2, 10 * p) * sin((p - p2) * (2 * M_PI) / p1));
}

- (double)outElastic:(double)p {
    if (p == 0) return 0;
    if (p == 1) return 1;
    double p1 = 0.3;
    double p2 = p1 / 4;
    double s = sin((p - p2) * (2 * M_PI) / p1);
    double t = pow(2, -10 * p);
    return t * s + 1;
}

- (double)inOutElastic:(double)p {
    if (p == 0) return 0;
    if ((p *= 2) == 2) return 1;
    double p1 = 0.3 * 1.5;
    double p2 = p1 / 4;
    double s, t;
    if (p < 1) {
        s = sin((p - p2) * (2 * M_PI) / p1);
        t = pow(2, 10 * (p - 1));
        return -0.5 * (t * s);
    } else {
        s = sin((p - p2) * (2 * M_PI) / p1);
        t = pow(2, -10 * (p - 1));
        return 0.5 * (t * s) + 1;
    }
}

@end
