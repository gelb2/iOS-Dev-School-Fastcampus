//
//  RectangularSolid.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "RectangularSolid.h"

@implementation RectangularSolid

-(CGFloat)getRectangularSolidVolume:(NSInteger)w l:(NSInteger)l h:(NSInteger)h{
    
    CGFloat volume = w * l * h;
    return volume;
}

@end
