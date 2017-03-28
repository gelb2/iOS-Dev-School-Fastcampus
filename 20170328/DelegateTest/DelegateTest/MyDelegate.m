//
//  MyDelegate.m
//  DelegateTest
//
//  Created by ji jun young on 2017. 3. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "MyDelegate.h"

@implementation MyDelegate


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.delegate requiredDelegate];
    }
    return self;
}

@end
