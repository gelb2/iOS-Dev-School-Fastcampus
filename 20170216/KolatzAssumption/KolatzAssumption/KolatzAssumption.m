//
//  KolatzAssumption.m
//  KolatzAssumption
//
//  Created by ji jun young on 2017. 2. 16..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "KolatzAssumption.h"

@implementation KolatzAssumption


- (void) kolatz: (NSInteger)input{
    self.calculation = input;
    NSInteger calculationRate;
    calculationRate = 0;
    
    while (self.calculation != 1)
    {
        if (self.calculation % 2 == 0) {
            self.calculation = self.calculation / 2;
            NSLog(@"결과값은 %ld입니다.", self.calculation);
            calculationRate += 1;
        } else if(self.calculation % 2 != 0){
            self.calculation = self.calculation * 3 + 1;
            NSLog(@"결과값은 %ld입니다.", self.calculation);
            calculationRate += 1;
        }
        
        
    }
    NSLog(@"수식이 돌아간 횟수는 %ld입니다", calculationRate);
    
    
    
}




@end
