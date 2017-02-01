//
//  FindingMultipleNumber.m
//  MultiflicationFormula
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "FindingMultipleNumber.h"

@implementation FindingMultipleNumber

+ (NSInteger) FindingFormula: (NSInteger)minRange last:(NSInteger)maxRange put:(NSInteger)putNumber{
    
    while (minRange <= maxRange) {NSLog(@"%lu는 %lu의 배수입니다.", minRange * putNumber, putNumber);
        minRange += 1;
    }
    
    
    return 0;
    
}


    



//3의 배수를 출력해내게 작성하면 된다

@end
