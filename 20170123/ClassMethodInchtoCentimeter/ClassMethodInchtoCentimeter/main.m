//
//  main.m
//  ClassMethodInchtoCentimeter
//
//  Created by ji jun young on 2017. 1. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassMethod.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        CGFloat inch = [ClassMethod inchtoCM:10];
        NSLog(@"10cm는 %lfinch입니다.",inch);
        CGFloat inch2 = [ClassMethod inchtoCM:11];
        NSLog(@"11cm는 %lfinch입니다.",inch2);
    
        CGFloat cm = [ClassMethod cmtoInch:30];
        NSLog(@"30인치는 %lf센치입니다",cm);
        CGFloat cm2 = [ClassMethod cmtoInch:40];
        NSLog(@"40인치는 %lf센치입니다",cm2);
        
       CGFloat m21 = [ClassMethod m2topyung:35];
        NSLog(@"35제곱미터는 %lf평입니다.", m21);
        CGFloat m22 = [ClassMethod m2topyung:132];
        NSLog(@"200제곱미터는 %lf평입니다.", m22);
        
       CGFloat pyung1 = [ClassMethod pyungtoM2:40];
        NSLog(@"40평은 %lf제곱미터입니다.", pyung1);
        CGFloat pyung2 = [ClassMethod pyungtoM2:32];
        NSLog(@"32평은 %lf제곱미터입니다", pyung2);
        
        CGFloat mb1 = [ClassMethod mbtoKb:10];
        NSLog(@"10메가바이트는 %fl입니다.", mb1);
        
        CGFloat kb1 = [ClassMethod kbtoMb:3000];
        NSLog(@"3000킬로바이트는 %fl입니다.", kb1);
        
    }
    return 0;
    
    //인치와 센티는 메소드는 잘 썼으나 서로 바뀌었다
    
    
    
}
