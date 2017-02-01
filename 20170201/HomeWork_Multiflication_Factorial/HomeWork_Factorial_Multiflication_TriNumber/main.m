//
//  main.m
//  HomeWork_Factorial_Multiflication_TriNumber
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gugudan.h"
#import "Factorial.h"
#import "TriangleNumber.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        [gugudan gugudanFormulaWhile:8];
        [gugudan gugudanFormulaFor:4];
        [gugudan gugudanFormulaForMinus:9];
        [gugudan gugudanFormulaWhileMinus:9];
        
        [Factorial factorialWhile:10];
        [Factorial factorialFor:4];
        [TriangleNumber triangleNumberWhile:3];
        [TriangleNumber triangleNumberFor:5];
        
        //while문은 중간에 값이 등장 시 멈춰야 할 때 사용
        //for문은 계속 10, 20번 돌려야 할 때 사용
        /* 변수의 생성주기는 한 번 메소드가 실행완료되면 끝난다...예를 들면 while, for...
         즉 while, for 등 여러 메소드 안에서 "중첩"되어야 할 값이 필요하면, while, for 등 의 구문보다 상위인 구문에서 해당 값을 저장할 무언가를 선언해 주어야 함...
         또한, 선언한 값은 맨 처음에 = 1 = 2 와 같이 초기화해서 지정해 주었더라도, 구문이 반복적으로 실행됨에 따라 새 값으로 덮어씌워질 수 있다...덮어씌워지는 것은 매우 기본적인 원칙...
         
         */
        //역순으로 띄우기는 조건값 재설정도 필요함
        
    }
    return 0;
}
