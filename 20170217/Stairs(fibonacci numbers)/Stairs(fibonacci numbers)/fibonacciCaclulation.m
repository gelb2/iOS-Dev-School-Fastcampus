//
//  fibonacciCaclulation.m
//  Stairs(fibonacci numbers)
//
//  Created by ji jun young on 2017. 2. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "fibonacciCaclulation.h"

@implementation fibonacciCaclulation

- (NSInteger)calculation:(NSInteger)input{
    
    if (input == 1) {
        return 1;
    }
    else if (input == 2){
        return 2;
    }
    
    else {
        return [self calculation:(input-1)] + [self calculation:(input-2)];
    }
    
    
    
    
}

@end
