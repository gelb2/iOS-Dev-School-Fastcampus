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


        /*
         
         
         main.m 에서 객체를 생성할때 (예를 들면 Person.h)
         Person *p1 = [[Person alloc] init]; 을
         (모든 데이터타입) id *p1 = [[id alloc] init]; 로 만들 수 있나?
         *(id는 타입입니다. 객체를 생성하는 방법은 [클래스명 alloc] 이지요, 그러니 [id alloc]은 불가능 합니다.
         하지만 id p1 = [[Person alloc] init];은 가능합니다. 이렇게 했다면 어떤 문제가 있을까요? - wing -)
         
         [[Person alloc] init]; 의 Person은 id값이나 타입이 아니라 클래스명이다...
         Person *p1 = [[Person alloc] init]; 은 p1의 주소에 [[Person alloc] init]을 담은 Person이라는 "타입"의 객체를 생성한다는 뜻이다
         따라서 id p2 = [[Person alloc] init]; 은 id 타입의 p2라는 객체를 생성하는 것은 가능하다.
         그러나 p2가 Person.h 와 Person.m 에서 선언된 프로퍼티, 메소드를 호출, 활용하는 것은 불가하다. p2는 Person의 타입에 속하는 객체가 아닌기 때문이다. 
         즉 p2.name @"phil" , [p2 eat]; 은 절대로 불가하다
         
         
         */
        
        
        
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
         인스턴스타입 매소드를 통해 은닉화된 값을 호출하거나, 한 번에 각 프로퍼티의 값을 할당할 수 있다
         
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
