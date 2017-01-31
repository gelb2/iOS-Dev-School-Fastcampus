//
//  Trapezoid.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "Trapezoid.h"

@implementation Trapezoid

- (CGFloat)getTrapezoidArea:(NSInteger)h a:(NSInteger)a b:(NSInteger)b{
    
    CGFloat area = (a + b) * h * 0.5;
    return area;
}

@end
