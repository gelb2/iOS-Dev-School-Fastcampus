//
//  main.m
//  characterMakingSelfTest20170117
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sniper.h"
#import "Recon.h"
#import "Heavy.h"

//헤더파일들을 먼저 임포트 해야 객체생성이 가능함



int main(int argc, const char * argv[]) {
    
    [Sniper alloc];
    [Recon alloc];
    [Heavy alloc];
    [Sniper alloc];
    [Recon alloc];
    [Heavy alloc];
    
    [Sniper new];
    [Heavy new];
    [Recon new];
    
    //객체가 들어갈 공간을 만들긴 하는건데...뒷 부분에서 객체가 들어갈 공간...즉 "이름"을 적고 alloc init을 시행하므로
    //EX) Recon *mesa = [[Recon alloc] init];
    //삭제해도 무방한 코드들임
    
    Recon *mesa = [[Recon alloc] init];
    mesa.health = @120;
    mesa.sprint = @190;
    mesa.bagSize = @85;
    mesa.armor = @80;
    mesa.accuracy = @110;
    
    Sniper *harold = [[Sniper alloc] init];
    harold.health = @150;
    harold.sprint = @100;
    harold.bagSize = @75;
    harold.armor = @60;
    harold.accuracy = @200;
    
    Recon *reah = [[Recon alloc] init];
    reah.health = @130;
    reah.sprint = @200;
    reah.bagSize = @100;
    reah.armor = @75;
    reah.accuracy = @120;
    
    Heavy *toredo = [[Heavy alloc] init];
    toredo.health = @200;
    toredo.sprint = @60;
    toredo.bagSize = @170;
    toredo.armor = @140;
    toredo.accuracy = @90;
    
    //저격수, 정찰병, 중화기병 클래스의 객체 생성 및 프로퍼티 값 Set
    
    NSLog(@"harold의 체력은 %@이다" ,harold.health);
    NSLog(@"reah의 정확도는 %@이다" ,reah.accuracy);
    NSLog(@"toredo의 가방사이즈는 %@이다" ,toredo.bagSize);
    
    //저격수, 정찰병, 중화기병 클래스의 객체 생성 및 프로퍼티 값 Get
    
    [harold meeleAttack];
    [reah primaryAttack];
    [toredo secondaryAttack];
    [mesa primaryAttack];
    
    //각 클래스 별 생성된 개체의 메소드 구동
    
    
    return 0;
}
