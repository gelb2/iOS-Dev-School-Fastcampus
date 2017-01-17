//
//  Heavy.h
//  characterMakingSelfTest20170117
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heavy : NSObject

@property id health;

@property id sprint;

@property id bagSize;

@property id armor;

@property id accuracy;

-(id) meeleAttack;

-(id) secondaryAttack;

-(id) primaryAttack;

//중화기병 쿨래스의 프로퍼티 체력, 스프린트, 가방사이즈, 방탄수치, 조준정확도
//중화기병 클래스의 메소드 근접공격 주무기공격 보조무기공격

@end
