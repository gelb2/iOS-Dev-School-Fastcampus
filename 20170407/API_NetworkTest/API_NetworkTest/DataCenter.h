//
//  DataCenter.h
//  API_NetworkTest
//
//  Created by ji jun young on 2017. 4. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property (nonatomic) NSString *token;

/**************** temporary Array for tableviewCell Setting with NetworkModule****************/
@property (nonatomic) NSArray *networkDataArray;

/**************** temporary Array for tableviewCell Setting ********************************/
@property (nonatomic) NSArray *titleArray;
@property (nonatomic) NSArray *tutorNameArray;
@property (nonatomic) NSArray *categoryArray;
@property (nonatomic) NSArray *categoryDetailArray;
@property (nonatomic) NSArray *schoolLocationArray;
@property (nonatomic) NSArray *districtLoactionArray;

/**************** Deprecated. currentRow is replaced by networkDataArray ***********************/
//@property (nonatomic) NSInteger currentRow;

+ (instancetype)sharedInstance;
- (NSArray *)settingTitleArray;
- (NSArray *)settingTutorNameArray;
- (NSArray *)settingCategoryArray;
- (NSArray *)settingCategoryDetailArray;
- (NSArray *)settingSchoolLocationArray;
- (NSArray *)settingDistrictLocationArray;

- (void)receiveServerDataWithCompletionBlock:(void (^)(BOOL isSuccess))completionBlock;

/**************** Deprecated setting for MainView with NetworkModule ***********************/
//- (void)receivingServerDatawithCompletionBlock:(void (^)())completionBlock;

@end
