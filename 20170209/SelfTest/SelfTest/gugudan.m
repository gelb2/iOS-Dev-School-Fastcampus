//
//  gugudan.m
//  SelfTest
//
//  Created by ji jun young on 2017. 2. 9..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "gugudan.h"

@implementation gugudan



+ (NSInteger) gugudanAll{
    for (NSInteger count1 = 1; count1 < 10; count1++) {
        NSString *result = [[NSString alloc]init];
        NSString *result2 = [[NSString alloc]init];
        for (NSInteger count2 = 1; count2 < 10; count2++) {
            NSInteger calculation;
            calculation = count1 * count2;
            NSLog(@"%lu X %lu = %lu",count1 ,count2 ,calculation);
            result = [result stringByAppendingFormat:@"%ld|", calculation];
            NSLog(@"%@", result);
            result2 = result;
        }
        result = [result stringByAppendingFormat:@"<%@>", result2];
        NSLog(@"%@", result);
    }
    
    
    return 0;
}
//모든 구구단 알아서 출력하게 하기


+ (NSInteger) multiNumAll:(NSInteger)input :(NSInteger)range{
    NSString *result = [[NSString alloc] init];
    //    상단의 코드와 NSString *result = @""; 동일 효과를 지닌다
        for (NSInteger count2 = 1; input * count2 <= range; count2++) {
            NSInteger calculation;
            calculation = input * count2;
            NSLog(@"%lu", calculation);
            result = [result stringByAppendingFormat:@"%ld|", calculation];
        }
    
    NSLog(@"%@",result);
    return 0;
    
}

//x의 배수 모두 찾기 (최대값 y 지정)

//- (NSString *)stringByAppendingFormat:(NSString *)aString;

+ (NSInteger) maskNumber:(NSInteger)input :(NSInteger)range{
    for (NSInteger count = 1; count <= range; count++) {
        if (count%input == 0) {
            NSLog(@"%ld의 배수", input);
        } else {
            NSLog(@"%ld",count);
        }
        
        }
    
    
return 0;

}



@end
