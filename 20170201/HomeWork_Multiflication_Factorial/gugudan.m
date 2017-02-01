//
//  gugudan.m
//  HomeWork_Factorial_Multiflication_TriNumber
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "gugudan.h"

@implementation gugudan

+ (NSInteger) gugudanFormulaWhile :(NSInteger)input{
    NSInteger count;
    count = 1;
    
    while (count < 10) {
        NSLog(@"%lu X %lu = %lu", input, count, input * count);
        count += 1;
        
    }
    
    return 0;
    
}

+ (NSInteger) gugudanFormulaWhileMinus :(NSInteger)input{
    NSInteger count;
    count = 9;
    
    while (count >= 1) {
        NSLog(@"%lu X %lu = %lu", input, count, input * count);
        count -= 1;
        
    }
    
    return 0;
    
}



+ (NSInteger) gugudanFormulaFor :(NSInteger)input{
    for (NSInteger count = 1; count < 10; count++) {
        NSLog(@"%lu X %lu = %lu", input, count, input *count);
        
//                NSInteger result;
//        result = input * count;
//        
        
    }
    
    
    return 0;
}

+ (NSInteger) gugudanFormulaForMinus :(NSInteger)input{
    for (NSInteger count = 9; count >= 1; count--) {
        NSLog(@"%lu X %lu = %lu", input, count, input *count);

    }
    return 0;
}

@end
