//
//  Circle.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (CGFloat)getCircleArea:(NSInteger)r{
    
    CGFloat area = 3.14 * r * r;
    return area;
}

- (CGFloat)getCircleCircumference:(NSInteger)r{
    
    CGFloat circumference = 2 * 3.14 * r;
    return circumference;
}

@end
