//
//  Circle.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Circle.h"
#import "PropertyforCalculation.h"

@implementation Circle

- (CGFloat) circleArea;
{
    int calculation;
    calculation = self.pi * self.rim * self.rim;
    return calculation;
}

- (CGFloat) circleCircumference;
{
    int calculation;
    calculation = 2 * self.pi * self.rim;
    return calculation;

}

@end
