## 20170131

▲ Switch 구문.   
· 상태값에 따라 실행될 코드를 선택하는 조건문.   
· 상태값 자리엔 NSInteger만 된다고 생각 하는 것이 속 편하다.   
· if문이 범위를 지정할 수 있는 대신, switch문은 특정 조건을 만족할 시 실행할. 값을 지정하는 데 사용

switch (상태값){    
case 상태값1 :    
//해당 상태값일때 실행되는 내용.    
break;    
case 상태값2 :    
//해당 상태값일때 실행될 내용.   
break;    
default:    
//해당되는 상태값이 없을 때 실행될 내용.   
break;    
}

·· break : “해당 구문에서 나가라”는 지시…break를 만나면 해당 조건의 스위치구문을 진행하고 종료하라는 것…만일 break가 없으면 case 1, case 2, case 3 이 순차적으로 계속 진행됨….   
Ex. case 3, case 4 간에서…case 3에 break가 없으면 case 3을 진행하고. case 4를 연속적으로 진행하게 됨.   
·· default : case 번호로 지정되지 않은 사항들은 default 값을 반환하게 됨.   
·· 상태값은 정수여야 함