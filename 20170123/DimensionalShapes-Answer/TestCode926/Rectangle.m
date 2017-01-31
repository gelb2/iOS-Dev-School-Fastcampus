//
//  Rectangle.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (CGFloat)getRectangleArea:(NSInteger)l w:(NSInteger)w{
    
    CGFloat area = l * w;
    return area;
}
- (CGFloat)getRectanglePerimeter:(NSInteger)l w:(NSInteger)w{
    CGFloat perimeter = (2 * l) + (2 * w);
    return perimeter;
}

@end
