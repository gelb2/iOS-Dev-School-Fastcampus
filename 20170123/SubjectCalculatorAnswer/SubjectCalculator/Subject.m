//
//  Subject.m
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "Subject.h"

@interface Subject()


@property NSString *name;

@property NSString *grade;

@end

@implementation Subject

/**
 *@discussion 과목 이름을 받아서 초기화 하는 메소드
 * 이 객체를 초기화 하기 위해서는 이 메소드를 꼭 사용
 *@param name 과목이름
 *@return instancetype subject객체
 *@code
 *Subject *sub = [[Subject alloc] initWithSubjectName:@"국어"];
 *@endcode
 */

- (instancetype)initWithSubjectName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}




@end
