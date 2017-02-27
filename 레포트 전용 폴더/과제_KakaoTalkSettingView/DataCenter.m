//
//  DataCenter.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    
    
    return dataCenter;
}

//- (instancetype)init {
//    
//    self = [super init];
//    if (self) {
//        
//        self.textForHeader = @"1234";
//    }
//    return self;
//}

//한 뷰 컨트롤러에 뿌려줄 데이터를 모조리 저장하는 역할이 데이터센터의 역할이고
//데이터센터는 모든 뷰컨트롤러와 객체들이 바라볼 수 있는 클라우드의 개념임


- (NSString*)test{
    NSString *test = @"11 bit studios s.a. >";
    self.textForHeader = test;
    return self.textForHeader;
}

@end
