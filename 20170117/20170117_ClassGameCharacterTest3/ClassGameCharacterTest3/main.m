//
//  main.m
//  ClassGameCharacterTest3
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "warrior.h"
#import "person.h"
#import "wizard.h"

//파일로 생성한 클래스 들의 헤더 파일들을 먼저 임포트 함...임포트 해야 main.m파일에 작성해서 객체로 생성 가능함

int main(int argc, const char * argv[]) {
   
    [Warrior alloc];
    [Wizard alloc];
    [Person alloc];
    

    
//객체생성과 초기화...[[<클래스이름> alloc] init]; = [<클래스이름> new]; ...앞의 두 코드는 궁극적으로 같은 것을 의미한다
    
    Person *mike = [[Person alloc] init];
    
// [[<클래스이름> alloc] init]; 이 “주소값”으로 바뀌는 것
//Person *mike = [[Person alloc] init];
//“person이라는 객체가 들어갈 mike라는 공간, 즉 변수를 생성한다...첫 번째 객체에는 Mike라는 이름을 붙일 것이다”
//“오른쪽에 있는 데이터를 왼쪽의 mike에 집어 넣겠다"
//[[Person alloc] init]; 만 쓰면 이는 0x7684A와 같은 데이터로 변하고, 프로그래머는 이 데이터를 불러올 방법이 없다...
//따라서 프로그래머는 Person *mike = [[Person alloc] init]; 로 코드를 작성해야 하는 것

    Person *jun = [[Person alloc] init];
    Person *kim = [[Person alloc] init];
    Warrior *tom = [[Warrior alloc] init];
    Warrior *charlie = [[Warrior alloc] init];
    Wizard *sid = [[Wizard alloc] init];
    Wizard *sol = [[Wizard alloc] init];
    Person *min = jun;
    Warrior *ted = tom;
    Wizard *loma = sid;
    
    
    //객체 여러개를 생성해보기
    //
    //Person *jun = [[Person alloc] init];
    //Person *jay = [[Person alloc] init];
    //으로 person 객체를 두개 생성한다면, jun과 jay는 컴퓨터도 두 개의 객체라고 인식한다...즉 문제가 없다
    
    jun.name = @ "junyoungjee";
    kim.name = @ "kimjiyoung";
    
    Person *me = [[Person alloc] init];
    me.name = @ "joo";
    
    Warrior *jack = [[Warrior alloc] init];
    jack.health = @300;
    jack.mana = @10;
    jack.physicalPower = @30;
    jack. magicalPower = @10;
    
    Wizard *rose = [[Wizard alloc] init];
    rose.health = @120;
    rose.mana = @200;
    rose.physicalPower = @10;
    rose.magicalPower = @30;
    
    //Set
    // jun.name = @ "junyoungjee"; / kim.name = @ "kimjiyoung"; 은 각각 준, 김 이라는 객체 안에...
    //jack과 rose라는 warrior, Wizard 객체가 생성됨과 동시에, 각 프로퍼티의 속성값이 부여됨...즉 Set 됨
    
    NSLog(@"jack의 물리 공격력은 %@이다" ,jack.physicalPower);
    NSLog(@"jack의 체력은 %@이고, rose의 체력은 %@이다", jack.health, rose.health);
    NSLog(@"jack의 마나는 %@이다" ,jack.mana);
    NSLog(@"rose의 마나는 %@이다" ,rose.mana);
    NSLog(@"jack의 마법 공격력은 %@이고, rose의 마법 공격력은 %@이다" ,jack.mana, rose.mana);
    
    
    //Get
    //NSLog(@"jack의 체력은 %@이고, rose의 체력은 %@이다", jack.health, rose.health);
    //NSLog(@"띄우고 싶은 텍스트 메시지 %@", 객체.프로퍼티, 객체.프로퍼티);
    
    [jack physicalAttack];
    [rose physicalAttack];
    [jack magicalAttack];
    [jack magicalAttack];
    
    
    return 0;
}

