//
//  Heavy.h
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sniper;

@interface Heavy : NSObject

@property NSString* name;

@property NSInteger health;

@property NSInteger meeleAttackPower;

@property NSInteger rangeAttackPower;

@property BOOL move;

- (id) meeleAttack:(Sniper *)Sniper;

- (id) rangeAttack:(Sniper *)Sniper;

- (id) movement;


@end
