//
//  ViewController.swift
//  if_For_Switch_SwitfVersion
//
//  Created by ji jun young on 2017. 6. 17..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var roomCapacity:[String:Int] = ["뱅크시" : 5, "모네" : 10 , "프리다" : 15, "마네" : 20];
        
        //roomCapacity += ["고흐" : 55];
        
        //딕셔너리에 값추가
        roomCapacity["고흐"] = 30;
        roomCapacity["폴락"] = 50;
        
        //딕셔너리 특정 키값에 접근
//        roomCapacity["뱅크시"];
        
        //딕셔너리의 키 값 전부 가져오려면 담을 변수를 하나 만들어야 함...허나 튜플 형식으로 가져온 것이므로 완전한 어레이 형태로 가져오려면 다른 방법을 써야...
        let roomNames = roomCapacity .keys;
        let capacity = roomCapacity .values;
        
        print("룸네임스 \(roomNames)")
        print("카파시티 \(capacity)")
        
        //완전한 어레이 형태로 가져오기
        
        let roomNameModified = [String](roomCapacity .keys);
        let capacityModified = [Int](roomCapacity .values);
        
        print("룸 네임 모디파이드 \(roomNameModified)")
        print("카파시티 모디파이드 \(capacityModified)")
        
        // Set 만들기...합집합, 교집합 등 활용해야 할때 사용 가능
        
        let subway2 : Set = ["시청", "을지로3가", "동대문역사문화공원", "홍대입구", "신대방", "강남"];
        let subway3 : Set = ["을지로3가", "동대문역사문화공원", "충무로", "안국", "강남", "경복궁"];
        
        let transfer = subway2.intersection(subway3);
        let nontransfer = subway2.subtracting(subway3);
        let union = subway2 .union(subway3);
        let symm = subway2 .symmetricDifference(subway3);
        
        print("2호선을 기준으로 3호선으로 환승 안되는 역 \(nontransfer)")
        print("2호선과 3호선의 합 \(union)")
        print("환승역이 아닌 곳 \(symm)")
        
        // if, switch, for
        
        if transfer.count > 0 {
            print("환승역은 \(transfer) 입니다")
        }else{
            print("환승역은 없습니다")
        }
        
        for station2 in subway2{
            print("이번 역은 \(station2) 입니다")
            
        }
        
        for station3 in subway3{
            print("이번 역은 \(station3) 입니다")
            
        }
        
        // roomCapacity의 값을 튜플로 받아와서 활용한다
        for (roomName, capacity) in roomCapacity{
            let roomDetail:String
            switch capacity {
            case 5:
                roomDetail = "Room \(roomName) 스터디룸입니다. 정원은 \(capacity) 입니다"
            //스위프트 스위치 구문의 범위 설정 : 숫자...숫자
            case 6...20:
                roomDetail = "Room \(roomName) 은 회의실 입니다. 정원은 \(capacity) 입니다"
            case 30:
                roomDetail = "Room \(roomName)은 강의실 입니다. 정원은 \(capacity) 입니다"
            case _ where capacity > 30 :
                roomDetail = "Room \(roomName)은 대회의실입니다. 정원은 \(capacity) 입니다"
            default:
                roomDetail = "Room 정보를 다시 확인하세요"
            }
            
            print("룸 디테일 \(roomDetail)")
            
        }
        
        // 맥주 수량에 따라 다르게 지시하기
        
        typealias shoppingItem = (name:String, amount:Int)
        
        let cart = shoppingItem("beer", 200)
        
        switch cart {
        case ("beer", 1...3):
            print("소량 계산대로 가세요")
        case ("beer", 4...50):
            print("일반 계산대로 가세요")
        case ("beer", 51...100):
            print("매니저에게 문의하세요")
        case ("beer", _) where cart.amount > 100:
            print("경찰에게 신고하세요")
        default:
            print("줄을 서서 기다리세요")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

