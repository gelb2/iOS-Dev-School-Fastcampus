//
//  TriangleNumber.m
//  HomeWork_Factorial_Multiflication_TriNumber
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "TriangleNumber.h"

@implementation TriangleNumber

+ (NSInteger) triangleNumberWhile: (NSInteger) input{
    NSInteger count = 1;
    NSInteger subResult = 0;
    
    while (count <= input) {
        subResult = count + subResult;
        count += 1;
    }
    
    NSLog(@"%lu", subResult);
    
    return subResult;
    
    
}

+ (NSInteger) triangleNumberFor: (NSInteger) input{
    NSInteger subResult = 0;
    
    for (NSInteger count = 1; count <= input; count++) {
        subResult = count + subResult;
    }
    
    NSLog(@"%lu", subResult);
    return 0;
}
@end
