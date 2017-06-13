//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//스위프트에서 어레이 만들기

var meetingRoom:Array<String> = ["뱅크시", "모네", "프리다", "마네"];

meetingRoom .append("고흐");

var groups:[Int] = [1, 4, 5, 20];

let maxSpeed:Int = 220;

var currentSpeed:Int = 20;

currentSpeed += 40;

var speedHistory:[Int] = [];

speedHistory .append(currentSpeed);

let gpsSpeed:Float = 115.5;

speedHistory .append(Int(gpsSpeed));

speedHistory .first;

speedHistory .last;

speedHistory.insert(35, at: 1);

speedHistory .insert(maxSpeed, at: speedHistory .endIndex);

let speedHistoryBackup = speedHistory;

speedHistory += [650];

speedHistoryBackup;

//5를 string으로 간주하고 스트링 어레이인 미팅룸 어레이에 집어넣기
meetingRoom .append(String(5));


//딕셔너리 만들기

var roomCapacity:[String:Int] = ["뱅크시" : 25, "모네" : 40 , "프리다" : 60, "마네" : 44];

//roomCapacity += ["고흐" : 55];

//딕셔너리에 값추가
roomCapacity["고흐"] = 55;

//딕셔너리 특정 키값에 접근
roomCapacity["뱅크시"];

//딕셔너리의 키 값 전부 가져오려면 담을 변수를 하나 만들어야 함...허나 튜플 형식으로 가져온 것이므로 완전한 어레이 형태로 가져오려면 다른 방법을 써야...
let roomNames = roomCapacity .keys;
let capacity = roomCapacity .values;

//완전한 어레이 형태로 가져오기

let roomNameModified = [String](roomCapacity .keys);
let capacityModified = [Int](roomCapacity .values);


// Set 만들기...합집합, 교집합 등 활용해야 할때 사용 가능

let subway2 : Set = ["시청", "을지로3가", "동대문역사문화공원", "홍대입구"];
let subway3 : Set = ["을지로3가", "동대문역사문화공원", "충무로", "안국"];

let transfer = subway2.intersection(subway3);
let nontransfer = subway2.subtracting(subway3);
let union = subway2 .union(subway3);
let symm = subway2 .symmetricDifference(subway3);
