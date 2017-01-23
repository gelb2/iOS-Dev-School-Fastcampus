//
//  Person.h
//  Exam_0123
//
//  Created by youngmin joo on 2017. 1. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Person : NSObject

- (instancetype)initWithName:(NSString *)name;
- (NSString *)name;

/*
 Version : 1
 */
- (void)setKoreanScore:(NSUInteger)score;
- (void)setEnglishScore:(NSUInteger)score;
- (void)setMathScore:(NSUInteger)score;
- (void)setComputerScore:(NSUInteger)score;
- (NSUInteger)koreanScore;
- (NSUInteger)englishScore;
- (NSUInteger)mathScore;
- (NSUInteger)computerScore;



@end
