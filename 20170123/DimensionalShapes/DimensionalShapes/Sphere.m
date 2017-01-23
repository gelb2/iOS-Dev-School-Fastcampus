//
//  Sphere.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Sphere.h"
#import "PropertyforCalculation.h"

@implementation Sphere

- (CGFloat) sphereVolume
{
    int calculation;
    calculation = 4/3 * self.pi * self.rim * self.rim * self.rim;
    return calculation;
}

@end
