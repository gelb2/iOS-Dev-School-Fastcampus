//
//  ViewController.swift
//  method
//
//  Created by ji jun young on 2017. 6. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /******** method **********/
        
        //메소드란 인스턴스, 타입 안에 종속된 함수
        //인스턴스에서 필요한 기능들 함수로 만들어 넣은 것
        //클래스, 구조체, 이너머레이션 모두 인스턴스 메소드를 가질 수 있다.
        //self는 그 자신을 가리킨다
        
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
            
            init(name:String) {
                self.name = name
            }
            
            convenience init(name:String, phone:String) {
                self.init(name: name)
                self.phoneNumber = phone
            }
            
            func report() -> Void {
                if let myBoss = boss {
                    print("\(self.name) report to \(myBoss.name)")
                }else{
                    print("\(name) has no Boss")
                }
            }
            
            func callTaskToBoss() -> TaskStruct? {
                if let myBoss = boss, let callTo = myBoss.phoneNumber {
                    var callTask = TaskStruct(type: .Call, owner: self)
                    return callTask
                }else{
                    return nil
                }
            }
            
            
        }
        
        var todayTask:[TaskStruct] = []
        
        
        let me = Employee(name: "me", phone: "0000")
        
        let toby : Employee = Employee(name: "toby", phone: "1111")
        
        me.boss = toby
        me.report()
        
        var reportTask = TaskStruct(type: .Report, owner: me)
        todayTask += [reportTask]
        if let callTask = me.callTaskToBoss() {
            todayTask += [callTask]
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

