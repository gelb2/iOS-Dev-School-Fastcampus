//
//  ViewController.swift
//  enum_Init
//
//  Created by ji jun young on 2017. 6. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /******** enum and Initializer ***********/
        
        //enum
        
        //enum은 연관성 있는 값들의 그룹을 만들어 Type-Safe 하게 사용하는 것이다.
        //
        //여러 다른 언어에서 일련의 값에 일대일 대응되는 Enum을 정의해서 사용
        //
        //Task의 상태 값을 나타내기 위해 0, 1, 2등의 정수값을 사용
        //보다 직관적으로 0은 READY, 1은 COUNTING, 2는 PAUSED, 3은 DONE과 같이 Enum으로 정의해서 사용하는 방식
        //스위프트에서 enum을 만들 때는 0,1,2 같은 raw value를 주지 않아도 된다
        
        //Swift에서 Enumeration은 더욱 강력한 기능을 가진다
        //
        //1st class type = 어디에나 사용될 수 있는 자격...매개변수나 리턴타입, 어레이나 딕셔너리 같은 컬렉션 등...
        //컴퓨티드 프로퍼티를 사용하거나, 이니셜라이저를 쓴다거나, 메소드를 가진다거나 프로토콜을 준수할 수 있음
        
        
        //initializer
        
        //초기화 작업은 인스턴스가 가지고 있는 모든 스토어드 프라퍼티(Stored Property)들의 최초 값을 설정하는 것
        //
        //스토어드 프라퍼티 : 저장소를 가지고 있는 프라퍼티 = 인스턴스 내부에서 메모리를 차지하는 프로퍼티...여태까지 선언한 임플로이, 폰 넘버 같은 것들
        //컴퓨티드 프라퍼티 : 저장소 없이 계산에 의해 값을 리턴하는 프라퍼티 = 계산에 의해 값을 제공하는 프로퍼티...구조체 안에서 선언한 타입스트링 같은 것
        
        //구조체의 초기화
        //
        //여러 개의 init 메소드 허용
        //상속을 허락하지 않으므로 Class에 비해 상대적으로 단순.
        
        //클래스의 초기화
        //
        //하나의 지정초기화 메소드
        //여러 개의 편의 초기화 메소드 허용
        
        
        struct TaskStruct{
            
            //스토어드 프로퍼티
            var title : String
            var time : Int! = nil
            var owner : Employee
            var participant : Employee?
            
            var type : TaskType
            
            enum TaskType {
                case Call
                case Report
                case Talk
                case Support
                
                //컴퓨티드 프로퍼티의 사용
                var typeTitle : String {
                    get {
                        let titleString : String
                        switch self {
                        case .Call:
                            titleString = "Call Activated"
                        case .Report:
                            titleString = "Report Activated"
                        case .Talk:
                            titleString = "Talk Activated"
                        case .Support:
                            titleString = "Support Activated"
                        default:
                            titleString = "태스크타입이 정의되지 않았습니다"
                        }
                        return titleString
                    }
                }
                
            }
            
            init(type:TaskType, owner:Employee) {
                self.type = type
                self.title = type.typeTitle
                self.owner = owner
                self.participant = nil
                self.time = nil
            }
            
        }
        
        class Employee{
            var name : String?
            var phoneNumber : String?
            var boss : Employee?
            
            init(name : String) {
                self.name = name
            }
            
            //클래스의 초기화가 구조체의 초기화보다 복잡한 면임...여러개의 초기화 메소드를 만들어 놓고 그때그때 달리 사용 가능
            convenience init(name:String, phone:String) {
                self.init(name: name)
                self.phoneNumber = phone
            }
            
        }
        
        //init 메소드를 사용한 경우
        let me : Employee = Employee(name: "me")
        
        //컨비니언스 init 메소드를 사용한 경우
        let toby = Employee(name: "toby", phone: "0000")
        
        var callTask = TaskStruct(type: TaskStruct.TaskType.Call, owner: me)
        me.phoneNumber = "0000"
        var talkTask = TaskStruct(type: .Talk, owner: Employee.init(name: "paul"))
        
        
        //초기화 메소드를 쓰고 나중에 별도로 프로퍼티를 설정해 줘도 된다
        print(callTask)
        print(talkTask)
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

