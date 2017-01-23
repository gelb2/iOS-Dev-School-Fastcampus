//
//  Heavy.h
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sniper;

@interface Heavy : (Human)

- (id) meeleAttack:(Sniper *)Sniper;

- (id) rangeAttack:(Sniper *)Sniper;

- (id) movement;


@end
