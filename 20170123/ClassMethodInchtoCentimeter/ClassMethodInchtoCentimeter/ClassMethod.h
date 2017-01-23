//
//  ClassMethod.h
//  ClassMethodInchtoCentimeter
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassMethod : NSObject

@property CGFloat x;

+ (CGFloat) inchtoCM:(CGFloat)cm;

+ (CGFloat) cmtoInch:(CGFloat)inch;

+ (CGFloat) m2topyung:(CGFloat)m2;

+ (CGFloat) pyungtoM2:(CGFloat)pyung;

+ (CGFloat) mbtoKb:(CGFloat)mb;

+ (CGFloat) kbtoMb:(CGFloat)kb;

@end
