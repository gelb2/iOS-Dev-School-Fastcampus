//
//  Circular Cylinder.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Circular Cylinder.h"

@implementation Circular_Cylinder

- (CGFloat) volume:(CGFloat)r h:(CGFloat)h{
    CGFloat piVolume = [self pi];
    CGFloat volume = piVolume * r * r * h;
    return volume;
}

/*
 상단의 코드는 하단의 코드와 동일한 효력을 지님
 CGFloat volume;
 volume = [self pi] * r * r * h;
 return volume;
 */


@end
