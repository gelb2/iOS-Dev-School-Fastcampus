//
//  Square.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Square.h"

@implementation Square

- (CGFloat) area:(CGFloat)s{
    CGFloat area = s * s;
    return area;
}
- (CGFloat) Perimeter:(CGFloat)s{
    
    CGFloat Perimeter = 4 * s;
    return Perimeter;

}

//정사각형의 넓이...길이의 제곱
//정사각형의 둘레 4 곱하기 길이

@end
