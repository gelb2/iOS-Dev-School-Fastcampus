//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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

print(ratings!)

print(ratingRecord(ratingHistory: ratings!))



var bookDescription : String = "\(title)"
if let theRatings = ratings{
    let record = ratingRecord(ratingHistory: theRatings)
    bookDescription += " has \(ratings.count) count \n\r average is \(record.average) \n\r and minimum is \(record.min) , maximum is \(record.max)"
    
}

		
