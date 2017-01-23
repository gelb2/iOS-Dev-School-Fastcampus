//
//  main.m
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GradeCalculator.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    
        /*
         테스트 예제
         ver: 1
         */
        GradeCalculator *calculation = [[GradeCalculator alloc] init];
        
        Person *yagom = [[Person alloc] initWithName:@"야곰"];
        [yagom setKoreanScore:100];
        [yagom setEnglishScore:90];
        [yagom setMathScore:80];
        [yagom setComputerScore:73];
        
        NSLog(@"%@에 각 과목의 총합은 %lu",yagom.name, [calculation totalScoreWithPerson:yagom]);
        NSLog(@"%@에 평균은 %.2f",yagom.name, [calculation averageScoreWithPerson:yagom]);
        
        
        Person *wing = [[Person alloc] initWithName:@"영민"];
        [wing setKoreanScore:100];
        [wing setEnglishScore:100];
        [wing setMathScore:100];
        [wing setComputerScore:100];
        
        NSLog(@"%@에 각 과목의 총합은 %lu",wing.name, [calculation totalScoreWithPerson:wing]);
        NSLog(@"%@에 평균은 %.2f",wing.name, [calculation averageScoreWithPerson:wing]);
    }
    return 0;
}
