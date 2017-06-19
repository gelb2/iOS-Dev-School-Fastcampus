//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/************ Associated value ****************/

//enum case에 값을 할당 하는 것
//case와 함께 추가적인 값을 저장하고 case 사용시 활용

//TaskType이라는 이너머레이션에 Associated Value를 설정
//Task 구조체 안에 선언한 doBasicTask( )라는 메소드

//Task의 타입 값에 따라 switch 문을 통해 각각 다른 작업을 수행
////.Call 이면 전화 번호를 number 상수로
////.Report이면 receiver와 time이라는 값
////.Meet과 .Support의 경우 적당한 상수값


struct TaskStruct{
    
    
    var title : String
    var time : Int! = nil
    var owner : Employee
//    var participant : Employee?
    
    var type : TaskType
    
    enum TaskType {
        case Call(number : String)
        case Report(to : Employee, when : String)
        case Talk
        case Support(who : Employee, duration : Int)
        
        
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
//        self.participant = nil
        self.time = nil
    }
    
    func doBasicTask() -> String {
        let taskDescription : String
        return taskDescription
        switch type {
        case .Call(let number):
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time):
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Support(let taskOwner, let duration)
            taskDescription = "\(owner.name) helps \(taskOwner.name) for \(duration) days"
        default:
            taskDescription = "need more info"
        }
        
        
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
            var callTask = TaskStruct(type: .Call(callTo), owner: self)
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

var reportTask = TaskStruct(type: .Report(to:toby when:"afternoon"), owner: me)
todayTask += [reportTask]
if let callTask = me.callTaskToBoss() {
    todayTask += [callTask]
    callTask.doBasicTask()
}

TaskStruct.doBasicTask()


