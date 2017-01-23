//
//  Person.h
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bank;
@interface Person : NSObject

//이름
@property NSString *name;
//자산
@property NSUInteger asset;


//-입금
- (void)depositOfWon:(NSUInteger)won toBank:(Bank *)bank;
//-조회
- (void)checkAccountOfBank:(Bank *)bank;

@end
