//
//  GradeCalculator.h
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@interface GradeCalculator : NSObject

/*
 Version : 1
 */
- (NSUInteger)totalScoreWithPerson:(Person *)person;
- (CGFloat)averageScoreWithPerson:(Person *)person;

@end
