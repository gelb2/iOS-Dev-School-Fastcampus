//
//  Trapezoid.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Trapezoid.h"
#import "PropertyforCalculation.h"

@implementation Trapezoid

- (CGFloat) TrapezoidArea;
{
    int calculation;
    calculation = 1/2 * self.height * (self.above + self.bottom);
    return calculation;
}

@end
