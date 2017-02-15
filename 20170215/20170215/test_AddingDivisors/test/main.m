//
//  main.m
//  test
//
//  Created by ji jun young on 2017. 2. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "testcalculation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        testcalculation *testobject = [[testcalculation alloc]init];
        [testobject test:12];
        //입력값의 정수약수를 구하고, 정수약수들을 모두 더하는 알고리즘
        // % == 0과 같은 나머지값이 0인 값들을 찾는 방법도 있으나
        //CGFloat   test1 = input / count;
        //NSInteger test2 = input / count;
        //두 테스트 값을 for문 내에서 선언하고 찾는 방법도 있음...왜냐하면 씨지플롯은 소수점까지 값을 저장하고, 엔에스인티저는 소수점을 날려버리기 때문에 정수인지 아닌지 여부를 판별할 수 있음
        //그러나 % == 0 을 활용해서 나머지가 0인 값을 찾는 것이 정신건강에 이롭고 씨지플롯과 인티저를 따로 선언해서 하는 것은 의미가 없다고 함
        
        
        
        
        
        
        
    }
    return 0;
}
