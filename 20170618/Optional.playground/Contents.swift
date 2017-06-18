//: Playground - noun: a place where people can play

import UIKit

/****** 옵셔널의 활용 *******/

var title : String = "storyboardTest"
var rating : [Int]? = nil
//var supportURL : String? = nil

var supportURL : String! = nil
//Implicitly Unwrapped Optional

supportURL = "www.naver.com"

//print("title has \(title) and rating is \(rating!.count) as you can see. more info is at \(supportURL)")

//?는 옵셔널의 선언
//!는 값의 존재를 확신할 때 사용..."이 안에 값이 있으니 확신한다"...정확히 인지하지 않고 남발하면 크래시가 나게 된다

var bookDescription : String = "\(title)"
if rating != nil {
    bookDescription += "has rating Count \(rating!.count) ratings."
}
if supportURL != nil {
    bookDescription += "\r\n supportWebPage : \(supportURL)"
}

print("\(bookDescription)")

//옵셔널에서 문제가 생기면 컴파일러는 꼭 !를 넣으라고 강요함...그러나 !가 많으면 나쁜 코드이므로 !로 처리하는 코드는 가능한 한 지양해야 함...

/******** 옵셔널의 올바른 사용 *********/
//옵셔널 바인딩 : if let / if var : 옵셔널이 아닌 새로운 상수와 변수를 선언하는 것
// 새롭게 만들어진 상수는 옵셔널이 아니므로 편하게 사용
//Implicitly Unwrapped Optional
//옵셔널 사용을 편하게 하기 위한 편의장치
//어쩔 수 없이 옵셔널이지만 실행 중 항상 값을 가지는 게 거의 확실
//선언시에 !를 사용하면 옵셔널이지만 옵셔널이 아닌 것 처럼 사용
//구조적으로 초기화 이후 항상 값이 존재하는 경우를 위한 편의장치
//API나 라이브러리들이 오브젝티브 C로 이뤄져 있으므로 자주 사용해야 하는 기능임


var bookDescriptionModified : String = "\(title)"
if let theRating = rating{
    bookDescriptionModified += "has rating Count \(theRating.count) ratings"
}
if let theSupportURL = supportURL{
    bookDescriptionModified += "supportURL is \(theSupportURL)"
}

print("\(bookDescriptionModified)")

