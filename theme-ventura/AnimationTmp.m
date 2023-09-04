/*
AnimationController.h
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AnimationDirection) {
    AnimationDirectionNormal,
    AnimationDirectionReverse,
    AnimationDirectionAlternate,
    AnimationDirectionAlternateReverse
};

@interface AnimationController : NSObject

@property (nonatomic, readonly) BOOL isEnded;

- (instancetype)initWithIterations:(NSUInteger)iterations direction:(AnimationDirection)direction states:(NSArray *)states;
- (void)run;

@end



AnimationController.m
#import "Animation.h"
#import "AnimationController.h"

@interface AnimationController ()

@property (nonatomic) NSUInteger iterations;
@property (nonatomic) AnimationDirection direction;
@property (nonatomic) NSArray *states;

@property (nonatomic) NSUInteger remainingIterations;
@property (nonatomic) NSUInteger nextStateIndex;
@property (nonatomic) NSString *anmStatus;
@property (nonatomic) NSString *anmPrevius;

@end

@implementation AnimationController

- (instancetype)initWithIterations:(NSUInteger)iterations direction:(AnimationDirection)direction states:(NSArray *)states {
    self = [super init];
    if (self) {
        _iterations = iterations;
        _direction = direction;
        _states = states;
        _nextStateIndex = 0;
        _remainingIterations = iterations;
        _isEnded = NO;
        
        // Crear les instàncies d'Animation necessàries
        for (NSDictionary *state in states) {
            for (NSDictionary *animationInfo in state[@"animations"]) {
                Animation *animation = [[Animation alloc] initWithName:animationInfo[@"name"] begin:[animationInfo[@"begin"] floatValue] end:[animationInfo[@"end"] floatValue] time:[animationInfo[@"time"] floatValue]];
                animationInfo[@"animation"] = animation;
            }
        }
        
        _anmStatus = _states[0][@"status"];
    }
    return self;
}


- (void)run {
    if (self.isEnded) {
        return;
    }

    NSDictionary *currentState = nil;
    for (NSDictionary *state in self.states) {
        if ([state[@"status"] isEqualToString:self.anmStatus]) {
            currentState = state;
            break;
        }
    }

    if (![self.anmPrevius isEqualToString:self.anmStatus]) {
        for (NSDictionary *property in currentState[@"properties"]) {
            [property[@"object"] setAnimation:property[@"animation"] begin:[property[@"begin"] floatValue] end:[property[@"end"] floatValue] time:[property[@"time"] floatValue]];
        }
        self.anmPrevius = self.anmStatus;
    }

    BOOL allAnimationsEnded = YES;
    for (NSDictionary *property in currentState[@"properties"]) {
        [property[@"object"] run];
        if (![property[@"object"] isEnded]) {
            allAnimationsEnded = NO;
        }
    }

    if (allAnimationsEnded) {
        NSUInteger prevStateIndex = self.nextStateIndex;

        switch (self.direction) {
            case AnimationDirectionNormal:
                self.nextStateIndex = (self.nextStateIndex + 1) % self.states.count;
                break;
            case AnimationDirectionReverse:
                self.nextStateIndex = (self.nextStateIndex == 0) ? self.states.count - 1 : self.nextStateIndex - 1;
                break;
            case AnimationDirectionAlternate:
                if (self.nextStateIndex == self.states.count - 1) {
                    self.direction = AnimationDirectionReverse;
                }
                self.nextStateIndex = (self.nextStateIndex + 1) % self.states.count;
                break;
            case AnimationDirectionAlternateReverse:
                if (self.nextStateIndex == 0) {
                    self.direction = AnimationDirectionNormal;
                }
                self.nextStateIndex = (self.nextStateIndex == 0) ? 1 : self.nextStateIndex - 1;
                break;
        }

        self.anmStatus = self.states[self.nextStateIndex][@"status"];

        // Check if a full iteration has completed
        if ((self.direction == AnimationDirectionNormal || self.direction == AnimationDirectionReverse) && prevStateIndex == self.states.count - 1) {
            self.remainingIterations--;
        } else if ((self.direction == AnimationDirectionAlternate || self.direction == AnimationDirectionAlternateReverse) && prevStateIndex == 0) {
            self.remainingIterations--;
        }

        if (self.iterations > 0 && self.remainingIterations == 0) {
            _isEnded = YES;
            return;
        }
    }
}

@end