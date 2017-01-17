//
//  Person.h
//  ClassGameCharacterTest3
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

//인터페이스 퍼슨 : NSObject
//는 person은 NSObject 를 상속한 서브클래스라는 것임...
//그래서 init 같은 메소드 들을 쓸 수 있는 것

@property id name;

//사람 클래스의 프로퍼티 : 이름

- (id) myName;
- (id) hello;
- (id) meal;
- (id) sleep;

//사람 클래스의 메소드 : 내 이름, 안녕, 식사, 잠

@end
