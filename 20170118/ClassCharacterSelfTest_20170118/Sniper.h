//
//  Sniper.h
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Heavy;

@interface Sniper : NSObject

@property NSString* name;

@property NSInteger health;

@property NSInteger meeleAttackPower;

@property NSInteger rangeAttackPower;

@property BOOL move;

- (id) meeleAttack:(Heavy *)Heavy;

- (id) rangeAttack:(Heavy *)Heavy;

- (id) movement;

@end
