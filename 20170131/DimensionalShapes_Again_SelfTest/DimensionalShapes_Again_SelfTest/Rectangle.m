//
//  Rectangle.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (CGFloat) area:(CGFloat)l w:(CGFloat)w{
    CGFloat area = l * w;
    return area;
}

- (CGFloat) perimeter:(CGFloat)l w:(CGFloat)w{
    CGFloat perimeter = (2 * l) + (2 * w);
    return perimeter;
}


@end
