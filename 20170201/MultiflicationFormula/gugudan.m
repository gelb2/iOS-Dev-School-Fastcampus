//
//  gugudan.m
//  MultiflicationFormula
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "gugudan.h"

@implementation gugudan

+ (NSInteger) gugudanformula: (NSInteger)putNumber{
    NSInteger count;
    count = 1;
    
    while (count < 10) {
        NSLog(@"%lu X %lu = %lu", putNumber, count, putNumber * count);
    count += 1;
    }
    
    
    return 0;
}


+ (NSInteger) ggugudanformulaSecond: (NSInteger)putNumber{
    NSInteger count;
    count = 1;
    
    while (count < 10) {
        NSLog(@"%lu X %lu = %lu",putNumber, count, putNumber * count);
        count += 1;
    }
    
    return 0;
    
}
//10에서 메소드 구동 멈추어야 함...
//자기가 알아서 1,2,3으로 곱해나가야 함...count의 지정 + +=의 사용이 필요

// count += 1; 는 count를 1씩 증가시키겠다는 의미...빼먹지 말아야 함


+ (NSInteger) gugudanFormulaFor: (NSInteger)putNumber{
    for (NSInteger count = 1; count < 10; count++) {
        NSLog(@"%lu X %lu = %lu", putNumber, count, putNumber * count);
    }
    
    
    return 0;




}

@end
