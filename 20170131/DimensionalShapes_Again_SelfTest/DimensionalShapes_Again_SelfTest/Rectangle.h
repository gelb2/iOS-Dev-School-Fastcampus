//
//  Rectangle.h
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyForCalculation.h"

@interface Rectangle : PropertyForCalculation

- (CGFloat) area:(CGFloat)l w:(CGFloat)w;

- (CGFloat) perimeter:(CGFloat)l w:(CGFloat)w;

@end
