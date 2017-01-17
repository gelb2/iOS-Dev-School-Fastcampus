//
//  GameCharacters.h
//  ClassTest1
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacters : NSObject

@property id name;

@property id gender;

@property id bagSize;

@property id dealingSkill;

@property id closeCombatSkill;

@property id rangeCombatSkill;

@property id produceSkill;

@property id agility;

//게임 캐릭터 프로퍼티 : 이름, 성별, 가방크기 , 거래스킬, 전투 스킬(원거리), 전투 스킬(근거리), 제작 스킬, 민첩함
//@property id ~~

- (id)collectItem;

- (id)closeCombatAttack;

- (id)rangeCombatAttack;

- (id)dealingItem;

- (id)produceItem;

- (id)walking;

- (id)running;

//게임 캐릭터 메소드 : 수집, 근접공격, 원거리 공격, 캐릭터 간 거래, 아이템 제작, 걷기, 뛰기
//- (id)methodName

@end
