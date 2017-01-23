//
//  Person.h
//  SecondTEST(HandCoding)
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bank;

@interface Person : NSObject

@property NSString* name;

@property NSInteger asset;

- (id) deposit;

- (id) checkingAccount;



/*
 
 l 아래의 로그처럼 출력되도록 사람의 입금메소드를 재정의(Override)하 구현하세요. ex) “~~가 ~~은행에 ~~를 입금하였습니다.”
 ex) “~~가 ~~은행에서 자신의 계좌를 조회해본 결과, 총 자산은 ~~원 입니다”
 l 아래의 로그처럼 출력될 수 있도록 남자의 카드만들기 메소드를 구현하세요. ex) “~~가 ~~은행에서 카드를 만들었습니다.”
 l 아래의 로그처럼 출력될 수 있도록 여자의 통장정리 메소드를 구현하세요. ex) “~~가 ~~은행에서 통장정리를 하였습니다.”
 
 */




@end
