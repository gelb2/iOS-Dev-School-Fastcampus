//
//  main.m
//  ClassGameCharacter20170117
//
//  Created by ji jun young on 2017. 1. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sniper.h"
#import "Heavy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        
        Sniper *s1 = [[Sniper alloc] init];
        s1.name = @"paul";
        s1.health = 150;
        s1.meeleAttackPower = 30;
        s1.rangeAttackPower = 50;
        
        
        Heavy *h1 = [[Heavy alloc] init];
        h1.name = @"john";
        h1.health = 200;
        h1.meeleAttackPower = 50;
        h1.rangeAttackPower = 30;
    
        [s1 meeleAttack:h1];
        [h1 meeleAttack:s1];
        [s1 rangeAttack:h1];
        [h1 rangeAttack:s1];
        
        
    return 0;
    }
    

}
