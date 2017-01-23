//
//  Bank.h
//  SecondTEST(HandCoding)
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "person"
@class Person;

@interface Bank : NSObject

@property NSString* name;

@property NSString* bankLocation;

- (id) changingAddress;

- (id) transaction;

@end
