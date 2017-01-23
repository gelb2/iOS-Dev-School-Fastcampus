//
//  Bank.m
//  SecondTEST(HandCoding)
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Bank.h"
#import "Person.h"

@implementation Bank

- (id) changingAddress;
{
    NSLog(@"%@은행이 %@에서 %@로 주소를 변경하였습니다.", self.name, self.bankLocation, self.bankLocation);
    return nil;
    
    
}





- (id) transaction;

{
    NSLog(@"%@가 %@에게 %ld를 이체하였습니다.", Person.name, Person.name, Person.asset);
    return nil;
    
    
}










/*
 
 l 아래의 로그처럼 출력될 수 있도록 은행의 주소변경 메소드를 구현하세요. ex) “~~은행이 ~~에서 ~~로 주소를 변경하였습니다.”
 l 아래의 로그처럼 남자가 여자에게 또는 여자가 남자에게 금액을 전달하는 은행의 이 체 메소드를 구현하세요.
 ex) “~~가 ~~에게 ~~를 이체하였습니다.”

 
 
 
 */

@end
