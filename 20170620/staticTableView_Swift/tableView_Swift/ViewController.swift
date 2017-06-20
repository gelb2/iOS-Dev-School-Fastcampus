//
//  ViewController.swift
//  tableView_Swift
//
//  Created by ji jun young on 2017. 6. 20..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//테이블 뷰는 좁은 화면에 큰 콘텐트를 표시하기 위한 UIScrollView를 서브클래스해서 많은 데이터를 효율적이고 빠르게 표시할 수 있도록 만든 서브클래스이다.
//
//Plain 스타일과 Grouped 스타일
//
//구성요소
//
//테이블 헤더
//테이블 푸터
//섹션
////섹션 헤더
////섹션 푸터
////테이블 셀

//테이블 셀은 4가지 형태
//
//Basic
//Subtitle
//RightDetail
//LeftDetail
//    + Custom Cell

//UITableViewCell은
////UIView의 서브클래스
////테이블 뷰 안에서 반복적으로 표시
////재사용성에 초점

//UITableViewCell의 구성
////Background View
////Selected Background View
////Content View
////Editing Control , Accessory View, Reordering Control

//테이블 뷰의 셀 스타일
//
////Static Cell : 앱 실행 중 내용이 변동되지 않을 때
////Dynamic Prototype : 앱 실행 중 셀이 수정/삭제 등 변경될 때

/************ 스태틱 테이블뷰 ************/

//
//테이블 뷰 컨트롤러
//SingleView 프로젝트를 만든 뒤 TableViewController를 하나 더한다. 스태틱한 테이블 뷰는 TableViewController를 이용하는 경우에만 만들 수 있다.
//TableView 오브젝트를 선택한 뒤, Static Cells를 선택한다.
//테이블 뷰 셀의 스타일을 선택한 뒤, 내용을 변경한다.
//기본으로 제공되는 것 외에 원하는 모양의 테이블 뷰 셀을 만들고 싶다면 커스텀 셀을 선택한다.

//테이블 뷰 구성요소
//섹션을 추가할 수 있다. 섹션의 헤더와 섹션의 푸터를 넣어본다.
//테이블 의 헤더와 테이블 푸터를 더해본다.
//그룹드 스타일의 테이블 뷰를 만들어 본다.
