//
//  DataCenter.m
//  API_NetworkTest
//
//  Created by ji jun young on 2017. 4. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DataCenter.h"
#import "NetworkModule.h"

@implementation DataCenter

+(instancetype)sharedInstance{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    return dataCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.networkDataArray = [[NSArray alloc] init];
    }
    return self;
}
//
//+ (void)getPostListWithCompletionBlock:(void (^)(BOOL isSuccess, NSDictionary* result))completionBlock

/**************** setting for MainView with NetworkModule********************************/
- (void)receiveServerDataWithCompletionBlock:(void (^)(BOOL isSuccess))completionBlock{
    
    [NetworkModule getPostListWithCompletionBlock:^(BOOL isSuccess, NSDictionary *result){
        if (isSuccess) {
            NSArray *networkDataArray = (NSArray *)result;
            //        NSLog(@"데이터센터에서 네트워크데이터어레이로 데이터를 집어넣음 %@", networkDataArray);
            self.networkDataArray = networkDataArray;
            //           NSLog(@"네트워크데이터어레이의 0번 데이터 %@", [networkDataArray objectAtIndex:0]);
            completionBlock(YES);
        }else{
            nil;
            
        }
    }];
    
}
//예외처리 위해 BOOL을 던져줄 수 있도록 코드를 재수정 한 버전...맞게 했는지는 모르겠음


/**************** Deprecated setting for MainView with NetworkModule ***********************/
//- (void)receivingServerDatawithCompletionBlock:(void (^)())completionBlock{
//    
//   [NetworkModule getPostListWithCompletionBlock:^(BOOL isSuccess, NSDictionary *result){
//       if (isSuccess) {
//           NSArray *networkDataArray = (NSArray *)result;
////        NSLog(@"데이터센터에서 네트워크데이터어레이로 데이터를 집어넣음 %@", networkDataArray);
//           self.networkDataArray = networkDataArray;
////           NSLog(@"네트워크데이터어레이의 0번 데이터 %@", [networkDataArray objectAtIndex:0]);
//           completionBlock();
//       }else{
//           nil;
//           
//       }
//   }];
//}
////예외처리 위해 BOOL을 던져줄 수 있도록 코드 재수정 해야함


//
//- (void)beginTaskWithCallbackBlock:(void (^)(void))callbackBlock {
//    ...
//    callbackBlock();
//}

//
//- (void)postListWithPage:(NSInteger)page completion:(CompletionBlock)completion
//{
//    [self.nManager postListRequestWithPage:@1 completion:^(BOOL isSuccess, id respons) {
//        if (isSuccess) {
//            NSArray *list = [(NSDictionary *)respons objectForKey:@"results"];
//            [self postModelListWithData:list];
//            //다음 페이지가 없으면 self.canNextPage = NO
//            
//            completion(YES, self.postList);
//        }else
//        {
//            completion(NO, nil);
//        }
//    }];
//}

/**************** setting for MainView ********************************/

-(NSArray *)settingTutorNameArray{
    /**************** temporary Array for tableviewCell Setting ********************************/
    //    NSArray *tutorNameArray = @[@"1지준영", @"2허원철", @"3박재한", @"4박종찬", @"5최제헌", @"6정한선", @"7홍정기"];
    //    self.tutorNameArray = tutorNameArray;
    //    return self.tutorNameArray;
    NSArray *tutorNameArray = [[NSArray alloc]initWithObjects:@"1지준영", @"2허원철", @"3박재한", @"4박종찬", @"5최제헌", @"6정한선", @"7홍정기", @"8조봉기", nil];
    self.tutorNameArray = tutorNameArray;
    return self.tutorNameArray;
}

-(NSArray *)settingTitleArray{
    /**************** temporary Array for tableviewCell Setting ********************************/
    //    NSArray *titleArray = @[@"1당신도 오브젝티브씨 고수가 될 수 있엉", @"2두달에 안드로이드 정복하기", @"3인테리어 디자이너와 함께 하는 프론트엔드 개론", @"4UX디자이너와 함께 하는 UI디자인 4주과정", @"5사년만 공부하면 너도 TED 연사급 iOS개발자", @"6반년안에 끝내는 언리얼엔진 게임개발", @"7유니티로 하는 4주안에 RPG게임 만들기"];
    //    self.titleArray = titleArray;
    //    return self.titleArray;
    NSArray *titleArray = [[NSArray alloc]initWithObjects:@"1당신도 오브젝티브씨 고수가 될 수 있엉", @"2두달에 안드로이드 정복하기", @"3디자이너와 함께 하는 프론트엔드 개론", @"4UX디자이너와 함께 하는 UI디자인 4주과정", @"5사년만 공부하면 너도 TED 연사급 iOS개발자", @"6반년안에 끝내는 언리얼엔진 게임개발",@"77주만 노력하면 너도 풀스텍", @"8너도나도 할 수 있는 풀스텍 도전기", nil];
    self.titleArray = titleArray;
    return self.titleArray;
}

/**************** setting for Location and Class Category ********************************/

- (NSArray *)settingCategoryArray{
    /**************** temporary Array for collectionviewCell Setting ********************************/
    NSArray *categoryArray = @[@"전체", @"헬스&뷰티", @"외국어", @"컴퓨터", @"음악&미술", @"스포츠", @"전공&취업", @"이색취미"];
    self.categoryArray = categoryArray;
    return  self.categoryArray;
}

- (NSArray *)settingCategoryDetailArray{
    /**************** temporary Array for collectionviewCell Setting ********************************/
    NSArray *categoryDetailArray = @[@"", @"헬스PT, 필라테스, 요가, 메이크업", @"외국어시험, 영어회화, 중국어", @"프로그래밍, 엑셀, 피피티", @"기타, 피아노, 미술", @"방송댄스, 구기운동, 스케이트보드", @"주식투자, 자기소개서, 학과전공", @"사진, 캘리그래피, 바둑"];
    self.categoryDetailArray = categoryDetailArray;
    return  self.categoryDetailArray;
}


- (NSArray *)settingSchoolLocationArray{
    /**************** temporary Array for collectionviewCell Setting ********************************/
    NSArray *schoolLocationArray = @[@"전체", @"고려대", @"연세대", @"홍익대", @"서울대", @"이화여대", @"부산대", @"건국대", @"한양대", @"중앙대"];
    self.schoolLocationArray = schoolLocationArray;
    return self.schoolLocationArray;
}

- (NSArray *)settingDistrictLocationArray{
    /**************** temporary Array for collectionviewCell Setting ********************************/
    NSArray *districtLocationArray = @[@"전체", @"강남", @"신촌", @"종로", @"사당", @"잠실", @"혜화", @"용산", @"합정", @"목동"];
    self.districtLoactionArray = districtLocationArray;
    return self.districtLoactionArray;
}



@end
