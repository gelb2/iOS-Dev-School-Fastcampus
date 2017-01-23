//
//  Cone.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Cone.h"
#import "PropertyforCalculation.h"

@implementation Cone

- (CGFloat) ConeVolume
{
    int calculation;
    calculation = 1/3 * self.pi * self.rim * self.rim *self.height;
    return calculation;
}

@end
