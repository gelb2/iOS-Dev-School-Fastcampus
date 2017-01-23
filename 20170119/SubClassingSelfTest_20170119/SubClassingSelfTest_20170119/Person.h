//
//  Person.h
//  SubClassingSelfTest_20170119
//
//  Created by ji jun young on 2017. 1. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString* name;

@property NSInteger hungry;

@property NSInteger tiredness;

@property BOOL think;

-(instancetype)initWithName:(NSString *)name
                     hungry:(NSInteger)hungry
                  tiredness:(NSInteger)tiredness;
- (id) eat;



//고등학생, 대학생의 부모클래스...구현 완료
//프로퍼티는 이름, 배고픔, 피로도, 생각...구현 완료
//메소드는 먹기...구현 완료
//은닉은 점수 관련...구현중
//각 객체에 이름 붙여서 메소드를 복잡하게 해보자

@end
