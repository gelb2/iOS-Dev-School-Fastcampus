//
//  DataCenter.h
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic) NSString *token;

@end
