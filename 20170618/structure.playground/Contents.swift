//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//구조체는 Class와 함께 데이터 모델의 중요한 구성요소 중 하나.
//
//내부에 변수나 상수 또는 함수를 선언한 뒤 인스턴스(Instance)를 만들어서 사용한다.
//주로 좌표나 크기처럼 간단한 값을 표현하는 데 많이 사용되어 왔다
//Swift에서 Class의 대안으로 그 역할이 커지고 있다
//
//구조체는 Value Type
//Value 타입의 인스턴스
//Int나 Double 과 같이 직접 값을 가지는 것

//다른 변수에 할당...할당시 값을 복사하고 메모리 번지를 공유하지 않음
//array와 같은 컬렉션에 할당...할당할 때 값이 복사됨

//Reference 타입의 인스턴스...인스턴스가 있는 메모리 번지를 참조하는 것
//Value 타입은 할당시에 인스턴스가 복사되지만...Reference 타입은 할당시 참조하는 메모리 번지만 전달된다

struct taskStruct {
    var title:String
    var time:Int?
}
//구조체는 특정 일을 추상화 하는 것이므로 일과 관련된 속성들을 옵셔널로 설정해 두어야 하는 경우도 있음을 고려해야 한다

var callTask = taskStruct(title:"전화 걸기", time:60*10)
		
var reportTask = taskStruct(title: "옆 지점에 전화 걸기", time:nil)
reportTask.title = "매니저에게 전화 걸기"

var todayTask:[taskStruct] = []
todayTask += [callTask, reportTask]
todayTask[1].time = 15*60

callTask.title = "서울 지점에 전화 걸기"

//할당시 값을 복사하기 때문에 callTask에 today task와 callTask의 타이틀 값이 다르게 나오는 것...todayTask에 할당된 순간 값이 복사되어서 들어간 것이므로
print("today task = \(todayTask), callTask = \(callTask)")