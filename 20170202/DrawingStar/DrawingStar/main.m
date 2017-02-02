//
//  main.m
//  DrawingStar
//
//  Created by ji jun young on 2017. 2. 2..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StarDrawing.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
    
        [StarDrawing numberArrayGoUp:10];
        [StarDrawing numberArrayGoDown:1];
    //별 그리기 전 테스트코드

        [StarDrawing starDrawingGoDown:5];
        [StarDrawing starDrawingGoUp:5];
        [StarDrawing StarDrawingBlank:5];
        [StarDrawing StarDrawingTree:5];

        
        
        
        
        
    }
    return 0;
}
