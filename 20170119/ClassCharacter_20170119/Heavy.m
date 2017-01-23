//
//  Heavy.m
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Heavy.h"
#import "Sniper.h"

@implementation Heavy

- (id) meeleAttack:(Sniper *)Sniper {
    NSLog(@"%@이 %ld의 데미지를 입었습니다", Sniper.name, self.meeleAttackPower);
    return nil;
    
}

- (id) rangeAttack:(Sniper *)Sniper{
    NSLog(@"%@이 %ld의 데미지를 입었습니다", Sniper.name, self.rangeAttackPower);
    return nil;
    
}

- (id) movement;

{
    NSLog(@"회피했습니다"); return nil;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
