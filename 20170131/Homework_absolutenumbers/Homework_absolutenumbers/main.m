//
//  main.m
//  Homework_absolutenumbers
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbsoluteNumberCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CGFloat number1;
        number1 = 37;
        CGFloat number2;
        number2 = -270;
        CGFloat numbera;
        numbera = -0.279;
        CGFloat numberb;
        numberb = +350;
        CGFloat numberc;
        numberc = 0;
        
       CGFloat number3 = [AbsoluteNumberCalculator absoluteCalculation:(CGFloat)number1];
        NSLog(@"해당 숫자 %f의 절대값은 %f입니다.",(CGFloat)number1 ,number3);
       CGFloat number4 = [AbsoluteNumberCalculator absoluteCalculation:(CGFloat)number2];
        NSLog(@"해당 숫자 %f의 절대값은 %f입니다.",(CGFloat)number2 ,number4);
       CGFloat number5 = [AbsoluteNumberCalculator absoluteCalculation:(CGFloat)numbera];
        NSLog(@"해당 숫자 %f의 절대값은 %f입니다.",(CGFloat)numbera ,number5);
       CGFloat number6 = [AbsoluteNumberCalculator absoluteCalculation:(CGFloat)numberb];
        NSLog(@"해당 숫자 %f의 절대값은 %f입니다.",(CGFloat)numberb ,number6);
       CGFloat number7 = [AbsoluteNumberCalculator absoluteCalculation:(CGFloat)numberc];
        NSLog(@"해당 숫자 %f의 절대값은 %f입니다.",(CGFloat)numberc ,number7);
    }
    
    /* 절대값 계산기의 구현
    해당되는 수에 -1을 곱했을때 0보다 같거나 큰 값이 나오면 음수, 반대로 0보다 같거나 작은 값이 나오면 양수일 것이라는 전제로 메소드 구현 식을 작성하고, 로그를 출력함 */
    
    return 0;
}
