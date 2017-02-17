//
//  main.m
//  Stairs(fibonacci numbers)
//
//  Created by ji jun young on 2017. 2. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fibonacciCaclulation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        fibonacciCaclulation *test1 = [[fibonacciCaclulation alloc]init];
        NSInteger result = [test1 calculation:7];
        NSLog(@"%ld",result);
    
    
    
    
    }
    return 0;
}

//20170217 오전 알고리즘 문제
//사람 A는 1,2 계단만 한 번에 올라갈 수 있음 // 계단 수 x를 올라갈 수 있는 경우의 수를 산출하시오
//결과적으로, 계단이 문제가 아닌 피보나치수열 문제였음
//피보나치 수열 구현 및 출력 확인
