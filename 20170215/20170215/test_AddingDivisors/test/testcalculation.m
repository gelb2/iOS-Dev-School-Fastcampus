//
//  testcalculation.m
//  test
//
//  Created by ji jun young on 2017. 2. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "testcalculation.h"

@implementation testcalculation




- (void) test:(NSInteger)input{
    
    NSInteger result;
    
    for (CGFloat count = 1.0; count <= input; count++) {
        //나눠서 0이 되는 숫자들을 result값에 저장
        
        CGFloat   test1 = input / count;
        NSInteger test2 = input / count;
        
        if(test1 == test2) {
            NSLog(@"%lf는 %ld의 약수임", count, input);
            result += count;
        }
        
        
        
//        NSInteger result;
//        if (input % count == 0) {
//            result += count;
//            NSLog(@"%ld는 %ld의 약수임", count, input);
//        } else {
//            NSLog(@"%ld는 %ld의 약수가 아님", count, input);
//        }
//    
//        NSLog(@"약수의 합은 %ld임",result);
        
    }
    
    NSLog(@"약수의 총 합은 %ld 임",result);

}

@end
