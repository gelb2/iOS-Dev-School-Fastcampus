//
//  Circle.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (CGFloat) area:(CGFloat)r{
    
    CGFloat floatValue = [self pi];
    CGFloat area = r * r * floatValue;
    return area;
    
    /*
     상단 코드는 하단과 동일한 효과를 가진다
     CGFloat area = r * r * [self pi];
     return area;
     상속받은 자식 클래스는 부모클래스에서 정의된 메소드를 [self pi]와 같은 인스턴스매소드 호출법을 활용해 사용할 수 있다.
     */
}

- (CGFloat) circumference:(CGFloat)r{
    CGFloat circumference;
    circumference = 2 * [self pi] * r;
    return circumference;
}

/*
 상단 코드는 하단과 동일한 효과를 가진다
 CGFloat floatValue = [self pi];
 CGFloat circumference = 2 * floatValue * r;
 return circumference;

*/

@end
