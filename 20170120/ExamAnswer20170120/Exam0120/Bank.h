//
//  Bank.h
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Bank : NSObject

//은행명
@property NSString *name;
//은행위치
@property NSString *location;

//-주소변경
- (void)changeLocation:(NSString *)newLocation;

//-이체메소드
- (void)transferToPerson:(Person *)toPerson fromPerson:(Person *)fromPerson transferMoney:(NSUInteger)money;

@end
