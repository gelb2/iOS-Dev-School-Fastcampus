//
//  ViewController.swift
//  moneyConverter
//
//  Created by ji jun young on 2017. 6. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func convertMoney(_ sender: Any) {

        //if let과 guard let은 기능상은 차이가 크게 없으나 if let 보다 guard let이 가독성이 더 좋다
//        if let sourceCurrency = Currency(rawValue : currencySegment.selectedSegmentIndex){
//        }
        //sourceCurrency가 제대로 만들어 지지 않았을 경우를 위한 예외처리
        guard let sourceCurrency = Currency(rawValue : currencySegment.selectedSegmentIndex) else {
             print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "Error"
            
            return
        }
        
        let sourceMoney = Money(sourceAmount, Currency : sourceCurrency)
        
//         필요 없는 부분이므로 주석 처리
//        let ratio : Double
//        switch currencySegment.selectedSegmentIndex {
//        case 0:
//            ratio = 0.00085
//        case 1:
//            ratio = 1200
//        default:
//            ratio = 1.0
//        }
        
        var targetMoneyString = ""
        
        for i in 0..<4{
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
//        
//        if let sourceMoney = Double(sourceMoneyField.text!){
//            targetMoneyString = "\(sourceMoney * ratio)"
//        }else{
//            targetMoneyString = "ERROR"
//        }
//        
        targetMoneyLabel.text = targetMoneyString
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





//    세그먼티드 컨트롤 : 몇 개의 항목 중 하나를 선택해야 할 때. 주로 정렬 방식 정의.
//    텍스트 필드 : 문자열 입력을 받는다. 다양한 키보드 종류.
//    버튼 : 사용자의 이벤트를 받는 기본적인 UI 컨트롤. 상태 값을 가지고 있다.
//    레이블 : 문자열 표시를 위한 뷰 오브젝트. 여기서는 결과값을 표시할 것이다.
//    도큐멘트 아웃라인
//    도큐멘트 아웃라인은 우리가 디자인한 뷰를 계층적으로 보여준다.
//    어떤 구성요소들이 있는지 자세히 살펴보자
//
//    아이덴티티 인스펙터
//    유틸리티 패널의 아이덴티티 인스펙터는 UI요소가 어떤 클래스로 만들어진 오브젝트인지를 보여준다.
//    작은 화살표로 헤더를 확인한 뒤
//    레퍼런스 문서를 열어보자

//
//    유틸리티 패널의 애트리뷰트 인스펙터
//    스토리 보드에서 선택한 오브젝트에 대한 설정 가능.
//    상속 계층에 대한 정보 제공.
//
//    버튼은 Button - Control - View
//    레이블은 Label - View
//    텍스트 필드는 TextField - Control - View
//    UIKit의 클래스 계층도
//    UIView는 화면 표시의 시작점
//
//    UILabel은 문자열 표시를 위한 UIView
//    UIImageView는 이미지 표시를 위한 UIView
//    UIWindow는 앱 시작시에 화면을 채우는 UIView
//    UIScrollView는 좁은 화면에 큰 콘텐트를 표시하는 UIView
//    UIControl은 이벤트 처리를 추상화한 클래스
//
//    UIButton, UISlider 등 사용자와 인터렉션을 가지는 컨트롤들

//    애트리뷰트 인스펙터
//    애트리뷰트 인스펙터는 UI요소들의 설정 값을 변경할 수 있다.
//    우리가 디자인한 UI에 있는 구성 요소 하나하나의 설정 값을 변경해서 우리가 원하는 디자인을 구현해 보자.

//    슈퍼클래스의 존재 확인
//    애트리뷰트를 확인하다 보면 유사점을 발견하게 된다.
//    모두 뷰 설정 영역이 있다는 것이고, 사용자 인터렉션을 가지는 오브젝트들은 컨트롤 설정 영역 또한 가지고 있다는 것이다.

//    UIKit의 클래스 계층도
//    UIKit은 화면 표시를 하는 클래스들이 모여있는 프레임워크이다.
//
//    UIView에서 화면표시가 시작된다
//    그러므로 모든 UI는 UIView 의 자식이다.

//    UIControl에서 사용자 인터렉션이 시작된다.
//    그러므로 모든 사용자 인터렉션을 가지는 오브젝트는 UIControl의 자식이다.

//    상속 : OOP의 특징 중 하나...부모 클래스의 속성을 이어받아 새로운 클래스를 만드는 것


