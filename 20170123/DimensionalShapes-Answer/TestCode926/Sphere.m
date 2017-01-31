//
//  Sphere.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "Sphere.h"

@implementation Sphere

- (CGFloat)getSphereVolume:(NSInteger)r{
    
    CGFloat volume = 4 * 3.14 * r * r * r / 3;
    return volume;
}

@end
