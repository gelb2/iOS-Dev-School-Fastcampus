//
//  Person.m
//  Exam0120
//
//  Created by youngmin joo on 2017. 1. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@implementation Person


//-입금
//"self.name 가  (은행이름) 은행에  (금액)를 입금하였습니다."
- (void)depositOfWon:(NSUInteger)won toBank:(Bank *)bank
{
    self.asset = self.asset + won;
    NSLog(@"%@가  %@은행에  %lu를 입금하였습니다.",self.name, bank.name, won);
}

//-조회
//self.name가 (Bank)은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 self.asset원 입니다.
- (void)checkAccountOfBank:(Bank *)bank
{
    NSLog(@"%@가 %@은행에서 자신의 계좌를 조회해 본 결과, 총 자산은  %lu원 입니다.",self.name, bank.name, self.asset);
}

@end
