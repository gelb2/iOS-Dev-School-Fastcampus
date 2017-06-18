//
//  ViewController.swift
//  classAndInstance
//
//  Created by ji jun young on 2017. 6. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //데이터 모델의 중요한 구성요소로써 Object를 만든다.
        //클래스는 객체지향 프로그래밍(OOP, Object Oriented Programming)의 바탕을 이룬다.
        //오브젝트는 참조로 작동된다..."주소값만 공유된다..."구조체는 할당될 때 그 시점의 값만 복사된다"
        //
        //구조체로 만든 것은 오브젝트라고 안하고 클래스로 만든 것을 오브젝트라고 하나...
        //스위프트에서는 구조체, 클래스로 만든 것들을 통틀어서 인스턴스라고 한다///
        //
        //클래스로 만든 오브젝트는 Reference Type으로 동작하며, 할당시 복사되지 않는다.
        //하나의 인스턴스에 대한 레퍼런스를 공유한다.
        //인스턴스를 할당한 뒤 수정하면 원본과 할당된 곳 모두 수정됨
        //let으로 정의 해도 프로퍼티가 var이면 수정 가능
        
        struct taskStruct{
            var title : String
            var time : Int?
            var owner : Employee
            var paticipant : Employee?
            
        }
        
        class Employee{
            var name : String?
            var phone : String?
            var boss : Employee?
        }
        
        let me:Employee = Employee()
        me.name = "alex"
        me.phone = "0000"
        
        let toby = Employee()
        //상단의 let me:Employee = Employee() 이든 해당 코드이든, 타입 자체는 어느정도는 알아서 잡아주므로 둘다 인스턴스가 만들어진다
        toby.name = "toby"
        toby.phone = "1111"
        print(toby.phone!)
        
        //me와 toby가 let인 이유?
        //구조체의 인스턴스는 let으로 만들면 아무것도 수정할 수가 없다
        //그러나 클래스의 인스턴스는 let으로 만들어도 나중에 수정을 할 수 있다 = let으로 정의 해도 프로퍼티가 var이면 수정 가능
        
        var callTask = taskStruct(title : "call to toby", time:90, owner:me, paticipant:toby)
        var reportTask = taskStruct(title : "call to boss", time:nil, owner:me, paticipant:nil)
        
        
        callTask.paticipant?.phone = "2222"
        print(toby.phone!)
        //particiant인 toby는 클래스 이므로, 구조체로 접근해서 phone을 수정했더라도 클래스 안의 프로퍼티인 phone도 같이 수정이 되어 버림
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

