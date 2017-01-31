//
//  main.m
//  MakingClassReview
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Programmer.h"
#import "Designer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        Person *p2 = [[Person alloc] init];
        Programmer *pr1 = [[Programmer alloc] init];
        Designer *d1 = [[Designer alloc] init];
        
        p1.age = 31;
        p1.salary = 3250.7;
        p1.address = @"seoul";
        p1.birthday = 1017;
        p1.job = @"none";
        p2.age = 25;
        p2.salary = 3250.7;
        p2.address = @"seoul";
        p2.birthday = 0131;
        p2.job = @"iOS Dev";
        pr1.job = @"programmer";
        pr1.birthday = 1231;
        d1.job = @"designer";
        d1.birthday = 0131;
        
        [p1 myJobIs:p1.job];
        [p1 checkBirthday:p1.birthday];
        [p2 myJobIs:p2.job];
        [p2 checkBirthday:p2.birthday];
        [pr1 myJobIs: pr1.job];
        [d1 myJobIs: d1.job];
        [pr1 checkBirthday:pr1.birthday];
        [d1 checkBirthday:d1.birthday];
        
        //설연휴 간 잊어버린 클래스 상속, 메소드 오버라이드, 이프문, 불 문 복습
        //파일 다시 켜고, 툴 박스 클래스 생성 후, 클래스 매소드 만들기 시작함
        //툴박스 클래스가 잘 되지 않는다...왜지?
        
    }
    return 0;
}
