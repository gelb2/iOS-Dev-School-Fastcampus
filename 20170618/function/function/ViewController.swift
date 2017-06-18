//
//  ViewController.swift
//  function
//
//  Created by ji jun young on 2017. 6. 18..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        func myFunction () /*-> Void */{
            //리턴 해야할 것이 void이면 -> void는 생략해도 된다
            
            print("first myFunction")
            
        }
        
        myFunction()
        
        
        var title : String = "storyBoard Prototype"
        var ratings : [Double]! = nil
        var supportURL : String! = nil
        
        supportURL = "www.naver.com"
        
        ratings = [4.1, 5, 2.5]
        
        func ratingRecord (ratingHistory:[Double]) -> (average : Double, min : Double, max : Double){
            
            var sum = 0.0, min = ratingHistory[0], max = ratingHistory[0]
            
            for value in ratingHistory {
                if min > value {
                    min = value
                }
                if max < value {
                    max = value
                }
                sum += value
            }
            let average = sum / Double(ratingHistory.count)
            return (average, min, max)
            
        }
        
        print(ratings)
        
        print(ratingRecord(ratingHistory: ratings))
        
        
        
        var bookDescription : String = "\(title)"
        if let theRatings = ratings{
            let record = ratingRecord(ratingHistory: theRatings)
            bookDescription += " has \(ratings.count) count \n\r average is \(record.average) \n\r and minimum is \(record.min) , maximum is \(record.max)"
            
        }
        
        print(bookDescription)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

