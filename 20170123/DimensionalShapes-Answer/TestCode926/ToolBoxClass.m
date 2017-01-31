//
//  ToolBoxClass.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "ToolBoxClass.h"

@implementation ToolBoxClass

+ (void)inchToCm:(CGFloat)inch{
    
    CGFloat temp = inch * 2.54;
    NSLog(@"%lfinch는 %lfcm입니다.", inch, temp);
}


+ (void)cmToInch:(CGFloat)cm{
    
    CGFloat temp = cm / 2.54;
    NSLog(@"%lfcm는 %lfinch입니다.", cm, temp);
}

+ (void)m2ToP:(CGFloat)m2{
    
    CGFloat temp = 0.3025 * m2;
    NSLog(@"%lfm2는 %lf평입니다.", m2, temp);
}


+ (void)pToM2:(CGFloat)p{
    
    CGFloat temp = 3.3058 * p;
    NSLog(@"%lf평은 %lfm2입니다.", p, temp);
}

// 화씨를 섭씨로 변환
+ (void)fahrenheitToCelsius:(CGFloat)fa{
    
    CGFloat temp = (fa-32)/1.8;
    NSLog(@"%lf화씨는 %lf섭씨입니다.", fa, temp);
}

// 섭씨를 화씨로 변환
+ (void)celsiusToFahrenheit:(CGFloat)ce{
    
    CGFloat temp = (ce*9/5) + 32;
    NSLog(@"%lf섭씨는 %lf화씨입니다.", ce, temp);
}

// KB를 MB로 변환
+ (void)kbToMb:(CGFloat)kb{
    
    CGFloat temp = kb / 1024;
    NSLog(@"%lfKb는 %lfMb입니다.", kb, temp);
}

// MB를 GB로 변환
+ (void)mbToGb:(CGFloat)mb{
    
    CGFloat temp = mb / 1024;
    NSLog(@"%lfMb는 %lfGb입니다.", mb, temp);
}

@end
