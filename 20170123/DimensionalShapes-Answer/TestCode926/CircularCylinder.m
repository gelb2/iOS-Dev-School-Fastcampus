//
//  CircularCylinder.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "CircularCylinder.h"

@implementation CircularCylinder

- (CGFloat)getCircularCylinderVolume:(NSInteger)r h:(NSInteger)h{
    
    CGFloat volume = 3.14 * r * r * h;
    return volume;
}

@end
