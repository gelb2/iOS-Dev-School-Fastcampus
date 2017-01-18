//
//  Heavy.m
//  ClassGameCharacter20170117
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Heavy.h"
#import "Sniper.h"

@implementation Heavy

- (id)meeleAttack:(Sniper *)Sniper;

{NSLog(@"%@를 근거리에서 %ld의 공격력으로 공격한다", Sniper.name, self.meeleAttackPower);
    return nil;
    
}

- (id)rangeAttack:(Sniper *)Sniper;

{NSLog(@"%@를 원거리에서 %ld의 공격력으로 공격한다", Sniper.name, self.rangeAttackPower);
    return nil;
    
}



@end
