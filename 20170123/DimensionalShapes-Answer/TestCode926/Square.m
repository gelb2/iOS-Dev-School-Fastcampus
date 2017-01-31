//
//  Square.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "Square.h"

@implementation Square

- (CGFloat)getSquareArea:(NSInteger)s{
    
    CGFloat area = s * s;
    return area;
    
}

- (CGFloat)getSquarePerimeter:(NSInteger)s{
    CGFloat perimeter = 4 * s;
    return perimeter;
    
}

@end
