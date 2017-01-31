//
//  Switch.m
//  Switch
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Switch.h"

@implementation Switch


+ (NSInteger) lastDayOfMonth:(NSInteger)month;
{
    switch (month) {
        case 1:
            NSLog(@"1월은 31일이 끝임");
            break;
        case 2:
            NSLog(@"2월은 28일이 끝임");
            break;
        case 3:
            NSLog(@"3월은 31일이 끝임");
            break;
        case 4:
            NSLog(@"4월을 입력하였음");
            
        case 5:
            NSLog(@"5월은 31일이 끝임");
            break;
        case 6:
            NSLog(@"6월을 입력하였음");
            
        case 7:
            NSLog(@"7월은 31일이 끝임");
            break;
        case 8:
            NSLog(@"8월을 입력하였음");
            
        case 9:
            NSLog(@"9월을 입력하였음");
            
        case 10:
            NSLog(@"10월은 31일이 끝임");
            break;
        case 11:
            NSLog(@"11월을 입력하였음");
            
        case 12:
            NSLog(@"12월은 31일이 끝임");
            break;
            
        default:
            NSLog(@"해당월은 30일이 끝임");
            break;
    }
    
    return nil;
    
    
}


@end
