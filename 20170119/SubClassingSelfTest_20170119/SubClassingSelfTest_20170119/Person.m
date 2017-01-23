//
//  Person.m
//  SubClassingSelfTest_20170119
//
//  Created by ji jun young on 2017. 1. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id) eat; {
    
    NSLog(@"식사 하러 갑니다");
    
    return nil;
    
}


-(instancetype)initWithName:(NSString *)name
                     hungry:(NSInteger)hungry
                  tiredness:(NSInteger)tiredness;
{
    self = [super init];
    //프로퍼티 값 설정
    self.name = name;
    self.hungry = 200;
    self.tiredness = 300;
    return self;
}



@end
