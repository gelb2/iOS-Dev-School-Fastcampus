//
//  Sniper.m
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Heavy.h"
#import "Sniper.h"

@implementation Sniper

- (id) meeleAttack:(Heavy *)Heavy {
    NSLog(@"%@이 %ld의 데미지를 입었습니다", Heavy.name, self.meeleAttackPower);
    return nil;
    
}

- (id) rangeAttack:(Heavy *)Heavy{
    NSLog(@"%@이 %ld의 데미지를 입었습니다", Heavy.name, self.rangeAttackPower);
    return nil;
    
}

- (id) movement;

{
    NSLog(@"회피했습니다"); return nil;
    
    
}

@end
