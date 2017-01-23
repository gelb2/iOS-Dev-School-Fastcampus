//
//  Human.h
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

@property NSString* name;

@property NSInteger health;

@property NSInteger meeleAttackPower;

@property NSInteger rangeAttackPower;

@property BOOL move;

- (void)jumpTo:(Human *)Human;{
    NSLog(@"%@에게 점프한다", Human.name);
    
    
    
}

//human 클래스의 신규 생성 및 sniper, heavy를 서브클래스로 만듬

@end
