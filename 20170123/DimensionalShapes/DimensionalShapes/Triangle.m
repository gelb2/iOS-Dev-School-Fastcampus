//
//  Triangle.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Triangle.h"
#import "PropertyforCalculation.h"

@implementation Triangle

- (CGFloat) triangleArea
{
    int calculation;
    calculation = 1/2 * self.bottom * self.height;
    return calculation;
}


@end
