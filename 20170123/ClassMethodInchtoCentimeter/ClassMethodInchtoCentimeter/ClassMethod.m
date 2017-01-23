//
//  ClassMethod.m
//  ClassMethodInchtoCentimeter
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ClassMethod.h"

@implementation ClassMethod

+ (CGFloat) inchtoCM:(CGFloat)cm
{
    CGFloat calculation;
    calculation = 0.393407 * cm;
    return calculation;
    
}

+ (CGFloat) cmtoInch:(CGFloat)inch
{
    CGFloat calculation;
    calculation = 2.54 * inch;
    return calculation;
    
}

+ (CGFloat) m2topyung:(CGFloat)m2
{
    CGFloat calculation;
    calculation = 0.3025 * m2;
    return calculation;
}

+ (CGFloat) pyungtoM2:(CGFloat)pyung
{
    CGFloat calculation;
    calculation = 3.30579 * pyung;
    return calculation;
}

+ (CGFloat) mbtoKb:(CGFloat)mb
{
    CGFloat calculation;
    calculation = 1024 * mb;
    return calculation;
    
    
}

+ (CGFloat) kbtoMb:(CGFloat)kb
{
    CGFloat calculation;
    calculation = 0.001 * kb;
    return calculation;
    
    
    
}


@end
