//
//  Person.h
//  MakingClassReview
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;

@property NSInteger age;

@property CGFloat salary;

@property NSString *address;

@property NSInteger birthday;

@property NSString *job;

- (NSString*) myJobIs:(NSString*)job;

- (BOOL) checkBirthday:(NSInteger)birthday;

@end
