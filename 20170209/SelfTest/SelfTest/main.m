//
//  main.m
//  SelfTest
//
//  Created by ji jun young on 2017. 2. 9..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gugudan.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        
        [gugudan gugudanAll];
        [gugudan multiNumAll:3 :50];
        [gugudan maskNumber:3 :100];
        
        //모든 구구단 알아서 출력하게 하기
        //x의 배수 모두 찾기 (최대값 y 지정)
        
    }
    return 0;
}
