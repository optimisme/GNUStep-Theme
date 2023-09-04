// AnimatedObject.m

#import "AnimatedObject.h"

@implementation AnimatedObject {
    NSDate *_lastUpdate;
}

- (void)setTargetFps:(CGFloat)targetFps {
    _targetFps = targetFps;
    [self updateAnimation];
}

- (void)startAnimation {
    _lastUpdate = [NSDate date];
    [self updateAnimation];
}

- (void)updateAnimation {
    
    NSDate *currentDate = [NSDate date];
    NSTimeInterval interval = [currentDate timeIntervalSinceDate:_lastUpdate];
    CGFloat actualFps = 1;
    if (interval > 0) {
        actualFps = 1.0 / interval;
    }
    NSLog(@"Actual FPS: %f", actualFps);
    _lastUpdate = currentDate;
    // Actualiza el estado de la animación
    // ...
    // Vuelve a dibujar la animación
    if ([self.object respondsToSelector:@selector(setNeedsDisplay:)]) {
        [self.object performSelector:@selector(setNeedsDisplay:) withObject:@YES];
    }
    // Espera el tiempo adecuado antes de volver a actualizar la animación
    NSTimeInterval waitTime = MAX(0.0, 1.0/self.targetFps - interval);
    NSLog(@"Wait time: %f", waitTime);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(waitTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self updateAnimation];
    });
    
}

@end
