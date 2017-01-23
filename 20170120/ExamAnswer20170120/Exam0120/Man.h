//
//  Man.h
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "Person.h"

@interface Man : Person

//- 카드 만들기
- (void)makeCardOfBank:(Bank *)bank;

//- 입금 재정의
-(void)depositOfWon:(NSUInteger)won toBank:(Bank *)bank;

@end
