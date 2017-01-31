//
//  Cone.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Cone.h"

@implementation Cone

- (CGFloat) volume:(CGFloat)r h:(CGFloat)h{
    CGFloat volume = 1 / 3 * [self pi] * r * r * h;
    return volume;
}

@end
