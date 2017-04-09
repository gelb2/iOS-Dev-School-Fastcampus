//
//  NetworkModule.h
//  API_NetworkTest
//
//  Created by ji jun young on 2017. 4. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkModule : NSObject

+ (void)getPostListWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

@end
