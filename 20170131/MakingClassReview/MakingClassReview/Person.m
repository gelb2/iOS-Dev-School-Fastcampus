//
//  Person.m
//  MakingClassReview
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Person.h"

@implementation Person


- (NSString*) myJobIs:(NSString*)job;
{
    NSLog(@"내 직업은 %@이다.",job);
    return nil;
    
}

- (BOOL) checkBirthday:(NSInteger)birthday;
{
    
    birthday = self.birthday;
    if (birthday == 0131) {
        NSLog(@"오늘은 제 생일입니다");
        return YES;
        
    }
    else {
        NSLog(@"오늘은 제 생일이 아닙니다");
        return NO;
        
    }
    
}




@end
