//
//  Cube.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Cube.h"
#import "PropertyforCalculation.h"

@implementation Cube

- (CGFloat) cubeVolume
{
    int calculation;
    calculation = self.slength * self.slength * self.slength;
    return calculation;
}


@end
