// AnimationData.h
#import <Foundation/Foundation.h>

@interface AnimationData : NSObject

@property (nonatomic) float duration;
@property (nonatomic) NSInteger iterations;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, strong) NSArray *keyframes;

- (instancetype)initWithDuration:(float)duration iterations:(NSInteger)iterations direction:(NSString *)direction keyframes:(NSArray *)keyframes;

@end

/* Examples:

// Example 1
NSDictionary *keyframeValues1 = @{@"opacity": @(0.0), @"scale": @(0.0)};
NSDictionary *keyframe1 = @{@"percentage": @(0.0), @"values": keyframeValues1};
NSDictionary *keyframeValues2 = @{@"opacity": @(1.0), @"scale": @(1.0)};
NSDictionary *keyframe2 = @{@"percentage": @(1.0), @"values": keyframeValues2};
NSArray *keyframesExample1 = @[keyframe1, keyframe2];

AnimationData *animationData1 = [[AnimationData alloc] initWithDuration:1.0 iterations:1 direction:@"normal" timing:@"ease-in" keyframes:keyframesExample1];

// Example 2
NSDictionary *keyframeValues3 = @{@"rotation": @(0.0)};
NSDictionary *keyframe3 = @{@"percentage": @(0.0), @"values": keyframeValues3};
NSDictionary *keyframeValues4 = @{@"rotation": @(360.0)};
NSDictionary *keyframe4 = @{@"percentage": @(1.0), @"values": keyframeValues4};
NSArray *keyframesExample2 = @[keyframe3, keyframe4];

AnimationData *animationData2 = [[AnimationData alloc] initWithDuration:2.0 iterations:INFINITY direction:@"alternate" timing:@"ease-out" keyframes:keyframesExample2];


*/