//
//  Factorial.m
//  HomeWork_Factorial_Multiflication_TriNumber
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Factorial.h"

@implementation Factorial

+ (NSInteger) factorialWhile: (NSInteger)input{

    NSInteger count;
    count = 1;
    NSInteger subResult = 1;
    
    while (count <= input) {
        subResult = count * subResult;
        count++;
    }
    
    
    NSLog(@"%lu", subResult);
    
          return subResult;
}
//while문은 중간에 값이 등장 시 멈춰야 할 때 사용


+ (NSInteger) factorialFor: (NSInteger)input{
    NSInteger subResult = 1;
    
    for (NSInteger count = 1; count <= input; count++) {
        
        subResult = count * subResult;
        NSLog(@"%lu", subResult);
    }

    return 0;
    
}

@end
