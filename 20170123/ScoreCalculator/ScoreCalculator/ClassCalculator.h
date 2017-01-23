//
//  ClassCalculator.h
//  ScoreCalculator
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassCalculator : NSObject

@property NSString *name;

@property NSUInteger math;

@property NSUInteger science;

@property NSUInteger society;

@property NSUInteger essay;

@property NSUInteger sum;

@property NSUInteger middleFactor;

- (NSUInteger)sumofAllClass;

- (NSUInteger)saysumofAllClass;

- (NSUInteger)middleFactorofAllClass;

- (NSUInteger)sayMiddleFactorofAllClass;

//총점 합
//평균 계산


@end
