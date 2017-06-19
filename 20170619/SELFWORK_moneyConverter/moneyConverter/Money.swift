//
//  Money.swift
//  moneyConverter
//
//  Created by ji jun young on 2017. 6. 20..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

import Foundation


/******************** 환율 설정 위한 구조체 생성 ***********/

enum Currency : Int{
    case USD = 0, KRW = 1, JPY = 2, EUR = 3
    
    //화폐별 환율 컴퓨티드 프로퍼티 생성
    var ratio : Double{
        get{
            switch self {
            case .USD: return 1.0
            case .KRW: return 1200
            case .JPY: return 122.45
            case .EUR: return 0.92
                
            }
            
        }
    }
    
    
    //화폐별 심볼용 컴퓨티드 프로퍼티 생성
    var symbol : String{
        get{
            switch self {
            case .USD: return "$"
            case .KRW: return "₩"
            case .JPY: return "¥"
            case .EUR: return "€"
            
            }
        }
        
    }
    
    
    
}

struct Money {
    var usdollar : Double = 0.0
    
    init(_ _usdollar : Double) {
        usdollar = _usdollar
    }
    
    init(_ amount : Double, Currency : Currency) {
        usdollar = amount / Currency.ratio
    }
    
    //환율과 심볼담은 스트링 리턴해주는 메소드
    
    func valueInCureency(currency:Currency) -> String {
        return "\(currency.symbol)" + "\(usdollar * currency.ratio)"
    }
    
}


// 구조체 사용 예
let myMoney = Money(120)
let incomeInKRW = Money(350_000, Currency: .KRW)
		
