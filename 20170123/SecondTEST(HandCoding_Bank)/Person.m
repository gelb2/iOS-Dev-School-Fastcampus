//
//  Person.m
//  SecondTEST(HandCoding)
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@implementation Person



- (id) deposit:(Bank*) bank{
    
    NSLog(@"%@가 %@은행에 %ld를 입금하였습니다", self.name, bank.name, self.asset);
    return nil;
    
    
}


- (id) checkingAccount:(Bank*) bank
{
    NSLog(@"가 은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 ~~원입니다", self.name, Bank.name, self.asset);
    return nil;
    
    
}


/*아래의 로그처럼 출력될 수 있도록 사람의 입금 메소드를 구현하세요 ex) “~~가 ~~은행에 ~~를 입금하였습니다.”
 l 아래의 로그처럼 출력될 수 있도록 사람의 조회 메소드를 구현하세요.
 ex) “~~가 ~~은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 ~~원 입니다.”
 
 */

@end
