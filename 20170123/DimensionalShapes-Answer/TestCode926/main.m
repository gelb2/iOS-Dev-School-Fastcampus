//
//  main.m
//  TestCode926
//
//  Created by Dabu on 2016. 9. 26..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Square.h"
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"
#import "Trapezoid.h"
#import "Cube.h"
#import "RectangularSolid.h"
#import "Sphere.h"
#import "Cone.h"
#import "CircularCylinder.h"
#import "ToolBoxClass.h"

int main(int argc, const char * argv[]) {
    
    
    // 길이가 4인 정사각형
    Square *square = [[Square alloc] init];
    square.s = 4;
    square.area = [square getSquareArea:4];
    NSLog(@"길이가 4인 정사각형의 넓이는 %lf이고 둘레는 %lf입니다.", [square getSquareArea:4], [square getSquarePerimeter:4]);
    
    // 변의 길이가 25, 10인 사각형의 넓이와 둘레
    Rectangle *rectangle = [[Rectangle alloc] init];
    rectangle.l = 25;
    rectangle.w = 10;
    rectangle.area = [rectangle getRectangleArea:10 w:25];
    rectangle.perimeter = [rectangle getRectanglePerimeter:10 w:25];
    NSLog(@"변의 길이가 25, 10인 사각형의 넓이는 %lf이고 둘레는 %lf입니다.", [rectangle getRectangleArea:10 w:25], [rectangle getRectanglePerimeter:10 w:25]);
    
    
    // 반지름이 9인 원의 넓이와 둘레
    Circle *circle = [[Circle alloc]init];
    circle.r = 9;
    circle.area = [circle getCircleArea:9];
    circle.circumferene = [circle getCircleCircumference:9];
    NSLog(@"반지름이 9인 원의 넓이는 %lf 이고 둘레는 %lf입니다. ", [circle getCircleArea:9], [circle getCircleCircumference:9]);
    
    // 밑변이 12 높이가 3인 삼각형의 넓이
    Triangle *triangle = [[Triangle alloc]init];
    triangle.b = 12;
    triangle.h = 3;
    triangle.area = [triangle getTriangleArea:triangle.b h:triangle.h];
    NSLog(@"밑변이 12 높이가 3인 삼각형의 넓이는 %lf입니다.", [triangle getTriangleArea:triangle.b h:triangle.h]);
    
    // 밑변이 9 윗변이 5 높이가 10인 도형의 넓이
    Trapezoid *trapezoid = [[Trapezoid alloc]init];
    trapezoid.a = 9;
    trapezoid.b = 5;
    trapezoid.h = 10;
    trapezoid.area = [trapezoid getTrapezoidArea:trapezoid.h a:trapezoid.a b:trapezoid.b];
    NSLog(@"밑변이 9 윗변이 5 높이가 10인 도형의 넓이는 %lf입니다.", [trapezoid getTrapezoidArea:trapezoid.h a:trapezoid.a b:trapezoid.b]);
    
    // 한변의 길이가 8인 정육면체의 부피
    Cube *cube = [[Cube alloc]init];
    cube.s = 8;
    cube.volume = [cube getCubeVolume:cube.s];
    NSLog(@"한변의 길이가 8인 정육면체의 부피는 %lf입니다.", [cube getCubeVolume:cube.s]);
    
    // 변의 길이가 29, 15 높이가 9인 육면체의 부피
    RectangularSolid *rectangularSolid = [[RectangularSolid alloc]init];
    rectangularSolid.l = 29;
    rectangularSolid.w = 15;
    rectangularSolid.h = 9;
    rectangularSolid.volume = [rectangularSolid getRectangularSolidVolume:rectangularSolid.w l:15 h:9];
    NSLog(@"변의 길이가 29, 15 높이가 9인 육면체의 부피는 %lf입니다.", [rectangularSolid getRectangularSolidVolume:rectangularSolid.w l:15 h:9]);
    
    // 반지름이 6 높이가 20인 원통의 부피
    CircularCylinder *cylinder = [[CircularCylinder alloc]init];
    cylinder.r = 6;
    cylinder.h = 20;
    cylinder.volume = [cylinder getCircularCylinderVolume:cylinder.r h:cylinder.h];
    NSLog(@"반지름이 6 높이가 20인 원통의 부피는 %lf입니다.", [cylinder getCircularCylinderVolume:cylinder.r h:cylinder.h]);
    
    // 반지름이 6인 구의 부피
    Sphere *sphere = [[Sphere alloc]init];
    sphere.r = 6;
    sphere.volume = [sphere getSphereVolume:sphere.r];
    NSLog(@"반지름이 6인 구의 부피는 %lf입니다.", [sphere getSphereVolume:sphere.r]);
    
    
    // 반지름이 15 높이는 9인 원뿔의 부피
    Cone *cone = [[Cone alloc]init];
    cone.r = 15;
    cone.h = 9;
    cone.volume = [cone getConeVolume:cone.r h:cone.h];
    NSLog(@"반지름이 15 높이는 9인 원뿔의 부피는 %lf입니다.", [cone getConeVolume:cone.r h:cone.h]);
    
    // inch를 Cm로 변환
    [ToolBoxClass inchToCm:23];
    
    // Cm을 inch로 변환
    [ToolBoxClass cmToInch:60.2];
    
    // m2를 평수로 변환
    [ToolBoxClass m2ToP:120];
    
    // 평수를 m2로 변환
    [ToolBoxClass pToM2:60];
    
    // 화씨를 섭씨로 변환
    [ToolBoxClass fahrenheitToCelsius:60.2];
    
    // 섭씨를 화씨로 변환
    [ToolBoxClass celsiusToFahrenheit:180];
    
    // KB를 MB로 변환
    [ToolBoxClass kbToMb:1502301];
    
    // MB를 GB로 변환
    [ToolBoxClass mbToGb:102112];
    
    return 0;
    
}
