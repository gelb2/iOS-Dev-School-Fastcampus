//
//  AbsoluteNumberCalculator.h
//  Homework_absolutenumbers
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbsoluteNumberCalculator : NSObject

@property CGFloat number;

+ (CGFloat) absoluteCalculation:(CGFloat)number;

//음수 양수를 확 없애 버리고, 절대값을 산출해내는 방법은?
//무조건 절대값만 나오면 된다




@end
