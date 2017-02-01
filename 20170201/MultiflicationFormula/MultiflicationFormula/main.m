//
//  main.m
//  MultiflicationFormula
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gugudan.h"
#import "FindingMultipleNumber.h"
#import "Factorial.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        [gugudan gugudanformula:9];
//        [gugudan ggugudanformulaSecond:6];
// while로 구구단 만들기
        
//        
//        [FindingMultipleNumber FindingFormula:3 last:20 put:4];
//// 검색 범위의 최소값, 최대값 원하는 곱셈 배수값 입력 후 해당 배수 찾아내기
//        [gugudan gugudanFormulaFor:3];

//for를 통한 구구단 만들기
        
        [Factorial factorialFromAtoB:1 :25];
        
    }
    return 0;
}
