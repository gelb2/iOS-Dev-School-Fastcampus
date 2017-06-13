//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/************************* let와 var의 차이 보기 및 값 계산하기 ************************/

let maxSpeed:Int = 200

//let은 상수 선언이다...따라서 값을 변동 시킬 수 없다
//선언이름뒤에는 :타입이 붙어야 한다...대문자로 시작해야 자동완성 상 뜬다...오브젝티브C와는 다른 부분 중 하나인거 같다
//maxSpeed += 10

var currentSpeed:Int = 80

currentSpeed += 10

currentSpeed += 20

print(currentSpeed)

print(currentSpeed * maxSpeed)

if (currentSpeed < maxSpeed) {
    print("현재 속도가 최고 속도보다 느립니다")
}else{
    print("현재 속도가 최고 속도보다 빠릅니다")
}

//하단엔 실시간으로 런할지, 혹은 누르면 런할지를 정하는 삼각형 표시가 있다

/************************* 스트링 이어 붙이기 ************************/

var announcement:String = ""

let beginingAnnouncement:String = "다음 역은 "

let stationName:String = "판교역"

let endingAnnouncement:String = "입니다."

announcement = beginingAnnouncement + stationName + endingAnnouncement
//다양하게 변해야 하는 변수를 let으로 선언하면, 그 안에는 어떠한 let, var 변수도 들어갈 수 없다

print(announcement)