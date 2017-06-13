//
//  ViewController.swift
//  stringAndNumbers
//
//  Created by ji jun young on 2017. 6. 13..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let distance:Float = 69500
        
        let divider:Float = 1000
        
        let script:String = "판교에서 파주까지의 거리는" + String(distance / divider) + "입니다."
        
        let script2:String = "판교에서 파주까지의 거리는 \(distance / divider) 입니다."
        
        print(script)
        
        print(String(distance / divider))
        
        //튜플의 사용
        
        let time1 = (9, 0, 48.2)
        
        let time2:(h:Int, m:Int, s:Float) = (11, 7, 52.4)
        
        //인티저, 플롯 등 여러 값을 섞을 수 있다
        
        let duration = (time1, time2)
        
        let (start, end) = duration
        
        let endHour = duration.1.h
        
        let endHour2 = time2.h
        
        let endHour3 = end.h
        
        typealias Time = (h:Int, m:Int, s:Float)
        typealias duration2 = (start:Time, end:Time)
        
        let today:duration2 = ((9, 5, 25.4), (11, 4, 45.3))
        
        print("우리는 \(today.end.h)시까지 공부했다.")

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

