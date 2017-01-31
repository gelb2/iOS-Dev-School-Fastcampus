//
//  PropertyForCalculation.h
//  DimensionalShapes_Again_SelfTest
//
//  Created by ji jun young on 2017. 1. 31..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyForCalculation : NSObject

@property CGFloat s;
@property CGFloat l;
@property CGFloat w;
@property CGFloat r;
@property CGFloat b;
@property CGFloat h;
@property CGFloat a;

- (CGFloat) pi;

//계산에 필요한 공통 인자들은 무엇?
//s,l,w,r,b,h,a,b
//pi를 메소드로 만들었을 때, 과연 상속되고, 메소드 구현 식에 써도 제 기능을 할까?
//계산해야 할 것들
//area perimeter circumference volume



@end
