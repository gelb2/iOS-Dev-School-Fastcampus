//
//  Person.h
//  ConsoleTest
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property id name;

@property id gender;

@property id age;

@property id job;

@property id birthDate;

@property id mobileNumber;

@property id politic;

@property id economic;

//사람의 클래스를 정의해보기...프로퍼티 : 이름, 성별, 나이, 직업, 생일, 핸드폰번호, 정치관, 경제관
//@property id name;

- (id)conversation;

- (id)webSurfing;

- (id)socialMedia;

- (id)offLineShoppingDomestic;

- (id)onLineShoppingDomestic;

- (id)offLineShoppingOverseas;

- (id)onLineShoppingOverseas;

//사람의 클래스를 정의해보기...메소드 : 대화, 웹서핑, 소셜미디어, 오프라인쇼핑국내, 온라인쇼핑국내, 오프라인쇼핑해외, 온라인쇼핑해외,
//-(id)methodName;



@end
