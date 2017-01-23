//
//  Person.m
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "Person.h"
#import "Subject.h"

@interface Person ()

@property Subject *korean;

@property Subject *english;
@property Subject *math;
@property Subject *computerScience;


@property NSString *_name;


@end

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        
        self._name = name;
        self.korean = [[Subject alloc] initWithSubjectName:@"국어"];
        self.english = [[Subject alloc] initWithSubjectName:@"영어"];
        self.math = [[Subject alloc] initWithSubjectName:@"수학"];
        self.computerScience = [[Subject alloc] initWithSubjectName:@"컴퓨터"];
    }
    return self;
}

- (NSString *)name
{
    ///self.name
    return self._name;
}

/*
 Version : 1
 */

/**
 *@discussion 과목 점수 설정
 *@param score 과목 점수
 *@code
 *[self setKoreanScore:100];
 *@endcode
 */

- (void)setKoreanScore:(NSUInteger)score
{
    self.korean.score = score;
}
- (void)setEnglishScore:(NSUInteger)score
{
    self.english.score = score;
}
- (void)setMathScore:(NSUInteger)score
{
    self.math.score = score;
}
- (void)setComputerScore:(NSUInteger)score
{
    self.computerScience.score = score;
}

/**
 *@discussion 과목 점수 가져오기
 *@return NSUInteger 과목 점수
 *@code
 *NSUInteger koreadScore = [self koreanScore];
 *@endcode
 */

- (NSUInteger)koreanScore
{
    return self.korean.score;
}
- (NSUInteger)englishScore
{
    return self.english.score;
}
- (NSUInteger)mathScore
{
    return self.math.score;
}
- (NSUInteger)computerScore
{
    return self.computerScience.score;
}


@end
