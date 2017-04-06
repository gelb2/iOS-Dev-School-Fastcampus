//
//  NetworkModule.h
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkModule : NSObject

+(void)signupWithUsername:(NSString *)username withpassword1:(NSString *)password1 withpassword2:(NSString *)password2 completionBlock:(void (^)(BOOL isSuccess, NSDictionary *result)) completionBlock;

+ (void)logInwithUsername:(NSString *)username withPassword:(NSString *)password completionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

+ (void)logOutWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;

+ (void)getPostListWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock;



@end
