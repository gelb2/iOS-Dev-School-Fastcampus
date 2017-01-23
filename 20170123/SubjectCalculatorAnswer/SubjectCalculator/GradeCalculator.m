//
//  GradeCalculator.m
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "GradeCalculator.h"
#import "Person.h"
@interface GradeCalculator ()




@end

@implementation GradeCalculator

/**
 *@discussion 사람의 총 과목 점수를 구하는 메소드
 *@param person Person객체를 받는다.
 *@return NSUInteger : 총 합
 *@code
 *NSUInteger total = [self totalScoreWithPerson:[Person alloc]];
 *@endcode
 */
- (NSUInteger)totalScoreWithPerson:(Person *)person
{
    return [person koreanScore] + [person englishScore] + [person mathScore] + [person computerScore];
}


/**
 *@discussion 사람의 총 과목 평균를 구하는 메소드
 *@param person Person객체를 받는다.
 *@return CGFloat : 평균값
 *@code
 *CGFloat average = [self averageScoreWithPerson:[Person alloc]];
 *@endcode
 */
- (CGFloat)averageScoreWithPerson:(Person *)person
{
    //version 1.0
    //합계를 호출해서 과목의 갯수로 나눠준다. 하지만 NSUInteger 를 4로 나눈다면 결과값은 어떤 타입일까?
    return [self totalScoreWithPerson:person]/4;
}

@end
