//
//  Calculation.m
//  yaksu2
//
//  Created by ji jun young on 2017. 2. 27..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Calculation.h"

@implementation Calculation

- (void)sosuCalculation:(NSInteger)input{

    NSMutableArray *testNumber = [[NSMutableArray alloc] init];
    NSInteger countNumber;
    countNumber = 0;
    //수식이 완전히 종료될 때 총 소수의 갯수를 찍어주기 위해 countNumber를 선언함
    
    for (NSInteger i = 1; i <= input; i++) {
        NSInteger temp = 0;
        //약수가 1과 자기 자신인 수를 찾기 위한 조건으로서 temp를 선언함
        for (NSInteger j = 1; j <= i; j++) {
            if (i % j ==0) {
                temp += 1;
                //temp는 i를 j로 나눴을 시 나머지가 0이면 1씩 올라감. 예를 들어, i가 4인 경우 temp는 3이 되어 하단의 if문이 실행되지 않음
            }
        }
        if (temp == 2) {
            [testNumber addObject:[NSString stringWithFormat:@"%ld",i]];
            //temp == 2 인 경우의 i 는 testNumber 어레이에 데이터로 축척됨
            NSInteger countNum = testNumber.count;
            //testNumber의 데이터 갯수를 수식이 실행될 때 마다 체크하기 위해 countNum을 선언함
            NSLog(@"%lu", i);
            countNumber = countNum;
            NSLog(@"현재 소수 갯수는 %ld 입니다", countNum);
            //수식이 완전이 종료될 때 까지 countNum이 실시간으로 소수의 갯수를 표시하고, 그 시점의 소수가 무엇인지를 표시함
            
        }
        
        }
    NSLog(@"계산 결과 총 소수 갯수는 %ld 입니다", countNumber);
    //수식이 완전히 종료되면 총 1부터 입력값까지의 총 소수 갯수가 몇개인지를 표시함
    
}

@end
