//
//  DiaryDataCenter.h
//  Diary
//
//  Created by ji jun young on 2017. 5. 16..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryDataCenter : NSObject

@property NSInteger integerRow;

@property NSMutableArray* postingMutableArray;

+ (instancetype)sharedInstance;

- (NSMutableArray *)settingPostingMutableArray;

@end
