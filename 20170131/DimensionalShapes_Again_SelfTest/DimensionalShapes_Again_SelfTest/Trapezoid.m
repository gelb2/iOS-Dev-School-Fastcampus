//
//  Trapezoid.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Trapezoid.h"

@implementation Trapezoid

- (CGFloat) area:(CGFloat)b h:(CGFloat)h a:(CGFloat)a{
   CGFloat area =  1 / 2 * h * (a + b);
    return area;
}

@end
