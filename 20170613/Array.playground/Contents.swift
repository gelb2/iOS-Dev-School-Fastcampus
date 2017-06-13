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

meetingRoom .append(String(5));