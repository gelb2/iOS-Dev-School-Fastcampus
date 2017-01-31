//
//  main.m
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "propertyForCalculation.h"
#import "Square.h"
#import "Rectangle.h"
#import "Circle.h"
#import "Trialgle.h"
#import "Trapezoid.h"
#import "Cube.h"
#import "Rectangular Solid.h"
#import "Circular Cylinder.h"
#import "Sphere.h"
#import "Cone.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Square *Square1 = [[Square alloc] init];
        Square1.s = 4;
        CGFloat Squarearea;
        Squarearea = [Square1 area:Square1.s];
        
        NSLog(@"사각형의 넓이는 %lf입니다.", Squarearea);
    

 /*    Square *Square1 = [[Square alloc] init];
     Square1.s = 4;
     [Square1 area:Square1.s];
     
     NSLog(@"사각형의 넓이는 %lf입니다.", [Square1 area:Square1.s]);
     */
     
     
    
        Rectangle *Rectangle1 = [[Rectangle alloc] init];
        Rectangle1.l = 10;
        Rectangle1.w = 2.5;
        [Rectangle1 area:Rectangle1.l w:Rectangle1.w];
    NSLog(@"직사각형의 넓이는 %lf입니다.", [Rectangle1 area:Rectangle1.l w:Rectangle1.w]);
        
        
        //매개변수가 복수인 경우에도 정확하게 코딩하였다. 다른 식들도 동일하게 진행하면 무방할 듯 하다
        
    }
    return 0;
}
