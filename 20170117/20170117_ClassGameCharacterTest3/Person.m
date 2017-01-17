//
//  Person.m
//  ClassGameCharacterTest3
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id) myName;
{
NSLog(@"내 이름은 %@입니다", self.name);
    return nil;
}
- (id) hello;

{
    NSLog(@"안녕하세요 잘 지냈나요?");
    return nil;
}

- (id) meal;

{
    NSLog(@"배고픈데 밥먹으로 갈까요?");
    return nil;
    
}

- (id) sleep;

{
    NSLog(@"피곤한데 먼저 자러 갈게요");
    return nil;
}


//메소드의 구현
//헤더파일에는 (id) myName; 과 같은 메소드 이름만을, 엠파일에는 {NSLog(@"피곤한데 먼저 자러 갈게요"); return nil;}
//까지 적어준다
//헤더파일(.h)은 그냥 요약서, 목차와 같고, 엠파일(.m)은 구체적인 행동지침이 적혀 있는 것
//· 헤더파일에 있는 것이 엠파일에 없으며 경고가 뜨고, 반대로 엠파일에 있으나 헤더파일에 없으면 경고가 뜨진 않는다
//·· 헤더파일은 임포트를 하지 않고 엠파일은 헤더파일에 있는 것들을 임포트 해 온다…엠파일은 헤더파일에 있는 것들을 다 구현해야 한다…

@end
