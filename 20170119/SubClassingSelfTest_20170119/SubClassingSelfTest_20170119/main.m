//
//  main.m
//  SubClassingSelfTest_20170119
//
//  Created by ji jun young on 2017. 1. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "HighSchoolStudent.h"
#import "UniversityStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p1 = [[Person alloc] init];
        HighSchoolStudent *h1 = [[HighSchoolStudent alloc] init];
        UniversityStudent *u1 = [[UniversityStudent alloc] init];
        
        p1.name = @"Jack";
        p1.hungry = 20;
        p1.tiredness = 70;
        p1.think = YES;
        h1.name = @"Sid";
        h1.hungry = 80;
        h1.tiredness = 90;
        h1.think = YES;
        u1.name = @"Paul";
        u1.hungry = 40;
        u1.tiredness = 60;
        u1.think = YES;
        
        [p1 eat];
        [h1 eat];
        [u1 eat];
         
        
        
        
        /* 
         
         
         -(instancetype)initWithName:(NSString *)name
         hungry:(NSInteger)hungry
         tiredness:(NSInteger)tiredness;

         
         
*/
        
        
    }
    return 0;
}

//부모클래스인 퍼슨의 eat 메소드 작동 결과 잘 상속 되었음
//eat 메소드의 오버라이드 역시 됨...퍼슨,하이스쿨,유니버시티 모두 각각 식사, 급식, 학식을 출력함
//슈퍼의 구현...슈퍼는 m파일 안에서 return nil; 위에 [super eat]; 으로 작성해야 한다
//셀프의 구현...슈퍼와 같다..그러나 재귀함수가 발생해 메시지가 무한대로 출력된다...막는 다른 방법이 필요하다
//해당 메소드에서 return nil; 은 밑 부분으 읽지 않겠단 뜻이다 
