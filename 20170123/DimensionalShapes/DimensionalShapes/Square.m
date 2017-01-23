//
//  Square.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Square.h"
#import "PropertyforCalculation.h"

@implementation Square

- (CGFloat) SquareArea;
{
    CGFloat calculation;
    calculation = self.width * self.width;
    return calculation;
}


- (CGFloat) SquarePerimeter;
{
    int calculation;
    calculation = self.width * 4;
    return calculation;
}

                   
                   
                   
                   /*
                    
                    
                    @property CGFloat slength;
                    
                    @property CGFloat width;
                    
                    @property CGFloat height;
                    
                    @property CGFloat length;
                    
                    @property CGFloat rim;
                    
                    @property CGFloat bottom;
                    
                    @property CGFloat above;
                    
                    @property CGFloat pi;
                    
                    */
                    
                    
                    

@end
