//
//  RectangularSolid.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "RectangularSolid.h"
#import "PropertyforCalculation.h"

@implementation RectangularSolid

- (CGFloat) RectangularSolidVolume
{
    int calculation;
    calculation = self.width * self.height * self.length;
    return calculation;
}

@end
