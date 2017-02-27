//
//  DataCenter.h
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

- (NSString*)test;

@property NSString *textForHeader;

@end
