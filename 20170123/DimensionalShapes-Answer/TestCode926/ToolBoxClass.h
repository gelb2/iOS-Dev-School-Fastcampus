//
//  ToolBoxClass.h
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBoxClass : NSObject

// inch를 Cm로 변환
+ (void)inchToCm:(CGFloat)inch;

// Cm을 inch로 변환
+ (void)cmToInch:(CGFloat)cm;

// m2를 평수로 변환
+ (void)m2ToP:(CGFloat)m2;

// 평수를 m2로 변환
+ (void)pToM2:(CGFloat)p;

// 화씨를 섭씨로 변환
+ (void)fahrenheitToCelsius:(CGFloat)fa;

// 섭씨를 화씨로 변환
+ (void)celsiusToFahrenheit:(CGFloat)ce;

// KB를 MB로 변환
+ (void)kbToMb:(CGFloat)kb;

// MB를 GB로 변환
+ (void)mbToGb:(CGFloat)mb;

@end
