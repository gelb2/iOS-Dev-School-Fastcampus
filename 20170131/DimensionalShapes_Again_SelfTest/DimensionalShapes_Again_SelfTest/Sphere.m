//
//  Sphere.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Sphere.h"

@implementation Sphere

- (CGFloat) volume:(CGFloat)r{
    CGFloat volume = 4 / 3 * r * r * r * [self pi];
    return volume;
}

@end
