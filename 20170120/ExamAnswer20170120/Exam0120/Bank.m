//
//  Bank.m
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "Bank.h"
#import "Person.h"

@implementation Bank


- (void)changeLocation:(NSString *)newLocation
{
    
    NSString *oldLocation = self.location;
    self.location = newLocation;
    NSLog(@"%@은행의 주소가 %@에서 %@로 변경되었습니다.",self.name, oldLocation, self.location);
    
}

//-이체메소드
//person.name가 person.name에게 (이체금액)를 이체하였습니다.
- (void)transferToPerson:(Person *)toPerson fromPerson:(Person *)fromPerson transferMoney:(NSUInteger)money
{
    toPerson.asset = toPerson.asset + money;
    fromPerson.asset = fromPerson.asset - money;
    
    NSLog(@"%@가 %@에게 %lu를 이체하였습니다.",fromPerson.name, toPerson.name, money);
}
@end
