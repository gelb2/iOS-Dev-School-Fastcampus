//
//  StarDrawing.h
//  DrawingStar
//
//  Created by ji jun young on 2017. 2. 2..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarDrawing : NSObject


+ (NSInteger) numberArrayGoUp : (NSInteger)input;

+ (NSInteger) numberArrayGoDown : (NSInteger)input;
//별 그리기 전 테스트코드

+ (void) starDrawingGoDown : (NSInteger)input;


//
//{
//    for (NSInteger count = 1; count <= input; count++) {
//        for (NSInteger countsecond = 1; countsecond <= count; countsecond++) {
//            printf("*");
//        }
//        printf("\n");
//    }
//    
//}
//// 카운트가 하나씩 올라갈 때마다 별 갯수가 늘어나게 해야...
////for 구문이 이중으로 들어가야 함...아랫단 for 문은 별을 그리는데 쓰고, 윗단 for 문은 줄바꾸는데 쓰고



+ (void) starDrawingGoUp:(NSInteger)input;
//
//{
//    for (NSInteger count = 1; count <= input; count++) {
//        for(NSInteger secondcount = 3; secondcount >= count; secondcount--){
//            printf("*");
//        }
//        printf("\n");
//    }
//    
//}
//
////카운트가 하나씩 올라갈 때 마다 별 갯수가 줄어들어야 함...
////for 구문이 이중으로 들어가야 함...아랫단 for 문은 별을 그리는데 쓰고...윗단 for문은 줄 바꾸는데 쓰고
//
//
//
//
//

+ (void)StarDrawingBlank:(NSUInteger)input;

//{
//    for (NSInteger countFirst = 1; countFirst <= input; countFirst++) {
//        for (NSInteger countSecond = 1; countSecond <= input - countFirst; countSecond++){
//            printf(" ");
//            
//        }
//        for (NSInteger countThird = 1; countThird <= countFirst; countThird++){
//            printf("*");
//        }
//        
//        printf("\n");
//    }
//    
//}

+ (void)StarDrawingTree:(NSInteger)input;

//{
//    for (NSInteger countFirst = 1; countFirst <= input; countFirst++) {
//        for (NSInteger countSecond = 1; countSecond <= input - countFirst; countSecond++){
//            printf(" ");
//        }
//        for (NSInteger countThird = 1; countThird <= 2 * countFirst - 1; countThird++) {
//            printf("*");
//        }
//        
//        
//        
//        printf("\n");
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//

@end


