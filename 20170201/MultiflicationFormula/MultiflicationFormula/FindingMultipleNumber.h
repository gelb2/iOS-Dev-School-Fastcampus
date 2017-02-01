//
//  FindingMultipleNumber.h
//  MultiflicationFormula
//
//  Created by ji jun young on 2017. 2. 1..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindingMultipleNumber : NSObject

+ (NSInteger) FindingFormula: (NSInteger)minRange last:(NSInteger)maxRange put:(NSInteger)putNumber;


//range와 배수를 받아 range안에 있는 배수를 모두 골라서 출력하시오
//[self findMultipleNum:3 maxRange:10] >> @"3, 6, 9"
//@ "3 , 6, 9"  ==  String값으로 출력하시오

@end
