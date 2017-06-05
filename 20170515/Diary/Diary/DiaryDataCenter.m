//
//  DiaryDataCenter.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 16..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryDataCenter.h"

@implementation DiaryDataCenter

+ (instancetype)sharedInstance{
    static DiaryDataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    return dataCenter;
}

//- (instancetype)init{
//    self = [super init];
//        if (self) {
//            self.postingMutableArray = [[NSMutableArray alloc]initWithCapacity:31];
//        }
//        return self;
//}


- (NSMutableArray *)settingPostingMutableArray{
    NSMutableArray *postingMutableArray = [[NSMutableArray alloc]initWithCapacity:31];
    self.postingMutableArray = postingMutableArray;
    for (NSUInteger i = 0; i <= 31; i++) {
        [self.postingMutableArray addObject:@"•"];
//        NSLog(@"%@", [self.postingMutableArray objectAtIndex:i]);
    }
    
    return self.postingMutableArray;
}

@end
