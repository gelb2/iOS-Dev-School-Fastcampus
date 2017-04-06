//
//  NetworkModule.m
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "NetworkModule.h"
#import "DataCenter.h"

static NSString *const API_BASE_URL = @"https://fc-ios.lhy.kr/api";
static NSString *const SIGN_UP_URL = @"/member/signup/";
static NSString *const LOG_IN_URL       = @"/member/login/";
static NSString *const LOG_OUT_URL      = @"/member/logout/";
static NSString *const USER_DETAIL_URL  = @"/member/profile/";

static NSString *const POST_URL         = @"/post/";


@implementation NetworkModule

//sign up
+(void)signupWithUsername:(NSString *)username withpassword1:(NSString *)password1 withpassword2:(NSString *)password2 completionBlock:(void (^)(BOOL isSuccess, NSDictionary *result)) completionBlock {
    //session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, SIGN_UP_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password1=%@&password2=%@", username, password1, password2] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    //POST task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        if(error == nil){
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"%@", [responseDic objectForKey:@"key"]);
            [DataCenter sharedInstance].token = [responseDic objectForKey:@"key"];
            completionBlock([responseDic objectForKey:@"key"]!=nil, responseDic);
        }else{
            NSLog(@"network error code %ld", error.code);
            completionBlock(NO, nil);
        }
    }];
    [postDataTask resume];
    
    }
    
//sign in

+ (void)logInwithUsername:(NSString *)username withPassword:(NSString *)password completionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    //session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, LOG_IN_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"username=%@&password=%@", username, password] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    //post task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        if (error == nil) {
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"%@", [responseDic objectForKey:@"key"]);
            [DataCenter sharedInstance].token = [responseDic objectForKey:@"key"];
            completionBlock([responseDic objectForKey:@"key"]!=nil, responseDic);
        }else{
            NSLog(@"network error code %ld", error.code);
            completionBlock(NO, nil);
        }
    }];
    [postDataTask resume];
    
}

//log out

+ (void)logOutWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, LOG_OUT_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 헤더 세팅
    [request addValue:[NSString stringWithFormat:@"token %@", [DataCenter sharedInstance].token] forHTTPHeaderField:@"Authorization"];
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];        // @"" 왜 넣어야하지?
    request.HTTPMethod = @"POST";
    
    // Post Task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request
                                                                 fromData:nil
                                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                            {
                                                
                                                NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                                                
                                                // NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
                                                
                                                if (error == nil) {
                                                    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                                    
                                                    NSLog(@"로그아웃, token : %@", [DataCenter sharedInstance].token);
                                                    [DataCenter sharedInstance].token = nil;
                                                    NSLog(@"초기화 완료 -> token : %@", [DataCenter sharedInstance].token);
                                                    
                                                    completionBlock(YES, responseDic);
                                                    
                                                } else {
                                                    NSLog(@"network error code %ld", error.code);
                                                    completionBlock(NO, nil);
                                                }
                                            }];
    
    [postDataTask resume];
    
}


// Log Out
+ (void)getPostListWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock {
    
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // Request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_BASE_URL, POST_URL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPBody = [[NSString stringWithFormat:@"page=%d", 1] dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"GET";
    
    // Get Task 요청
    NSURLSessionDataTask *getDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
        
        // NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
        
        if (error == nil) {
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"GetPostList");
            completionBlock(YES, responseDic);
            
        } else {
            NSLog(@"network error code %ld", error.code);
            completionBlock(NO, nil);
        }
    }];
    
    [getDataTask resume];
    
}







@end
