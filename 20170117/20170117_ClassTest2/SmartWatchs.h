//
//  SmartWatchs.h
//  ClassTest2
//
//  Created by ji jun young on 2017. 1. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmartWatchs : NSObject

@property id name;

@property id company;

@property id material;

@property id color;

@property id heartBeatSensor;

@property id waterProof;

@property id syncLTE;

@property id syncWIFI;

@property id syncBluetooth;

@property id wirelessCharging;


//스마트워치 프로퍼티 : 이름, 제조사, 재질, 색, 심박센서yesno, 방수yesno, 동기화방식 LTE, 동기화방식 블루투스, 동기화방식 Wifi
//스마트워치 프로퍼티 : 무선충전유무
//@property id

- (id)timeCheck;

- (id)walkCheck;

- (id)syncing;

- (id)charging;

//스마트워치 메소드 : 시간측정, 걸음수 측정, 동기화, 충전
// - (id)methodName

@end
