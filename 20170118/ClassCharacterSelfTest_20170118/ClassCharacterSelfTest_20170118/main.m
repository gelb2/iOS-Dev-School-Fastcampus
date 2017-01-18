//
//  main.m
//  ClassCharacterSelfTest_20170118
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sniper.h"
#import "Heavy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        Sniper *s1=[[Sniper alloc] init];
        s1.name = @"Sniper1";
        s1.health = 100;
        s1.meeleAttackPower = 30;
        s1.rangeAttackPower = 50;
        s1.move = YES;
        
        Heavy *h1=[[Heavy alloc] init];
        h1.name = @"Heavy1";
        h1.health = 200;
        h1.meeleAttackPower = 20;
        h1.rangeAttackPower = 10;
        h1.move = NO;
    
        [s1 rangeAttack:h1];
        [s1 movement];
        [h1 movement];
        [h1 rangeAttack:s1];
        [s1 meeleAttack:h1];
        [h1 meeleAttack:s1];
        
        
        //meeleAttack:(Sniper *)Sniper;
        
 //       rangeAttack:(Sniper *)Sniper;

        
    
    return 0;
}
}
