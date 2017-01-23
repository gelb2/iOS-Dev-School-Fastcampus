//
//  main.m
//  DimensionalShapes
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyforCalculation.h"
#import "Square.h"
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"
#import "Trapezoid.h"
#import "Cube.h"
#import "RectangularSolid.h"
#import "CircularCylinder.h"
#import "Sphere.h"
#import "Cone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PropertyforCalculation *p1 = [[PropertyforCalculation alloc] init];
        Square *s1 = [[Square alloc] init];
        Rectangle *r1 = [[Rectangle alloc] init];
        Circle *c1 = [[Circle alloc] init];
        Triangle *t1 = [[Triangle alloc] init];
        Trapezoid *tr1 = [[Trapezoid alloc] init];
        Cube *cu1 = [[Cube alloc] init];
        RectangularSolid *re1 = [[RectangularSolid alloc] init];
        CircularCylinder *ci1 = [[CircularCylinder alloc] init];
        Sphere *sp1 = [[Sphere alloc] init];
        Cone *co1 = [[Cone alloc] init];
        
        p1.slength = 5;
        p1.width = 20;
        p1. height = 4.1;
        p1. length = 6.2;
        p1. rim = 2.1;
        p1. bottom = 4.3;
        p1. above = 2.8;
        p1. pi = 3.14;
        s1.width = 3.3;
        
       
        NSLog(@"사각형의 넓이는 %f이다", s1.SquareArea);
        
        //상속되는건 프로퍼티나 매소드이지 각 프로퍼티 별 값이 아닌듯 하다...메인 파일에 프로퍼티값 다 적으니 상속이 안되나보네
    
            }
    return 0;
}

/*
 프로젝트 파일 70%까지 완료...
 계산에 필요한 인자들을 전부 프로퍼티 화 하여 클래스로 만든다 한다
 각 도형 별로 클래스를 만든다
 각 도형 클래스 들은 "프로퍼티 인자 클래스"를 상속받는다
 각 도형 클래스의 헤더,엠파일에는 관련 공식을 일일이 작성한다
 메인 엠파일에는 NSLog를 사용해 각자의 넓이, 부피를 띄우는 식을 만든다
 //상속되는건 프로퍼티나 매소드이지 각 프로퍼티 별 값이 아닌듯 하다...메인 파일에 프로퍼티값 다 적으니 상속이 안되나보네
 //반환값, 매개변수 등의 타입 똑같이 맞춰줘야 함...숫자계산시 차이가 나고, 나중에 객체변환 할때 에러가 생기는 등 문제가 커짐
 //메소드 이름에서 카멜명명법...앞자리 소문자 신경써야 함

 
 
 */



