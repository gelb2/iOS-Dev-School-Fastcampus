//
//  CircularCylinder.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "CircularCylinder.h"
#import "PropertyforCalculation.h"

@implementation CircularCylinder

- (CGFloat) CircularCylinderVolume
{
    int calculation;
    calculation = self.pi * self.rim *self.rim * self.height;
    return calculation;
}

@end
