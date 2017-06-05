## 20170201

### 반복문   
* 반복적으로 실행되는 코드를 만드는 구문.   
* 대표적인 반복문 : while, for

###  while 반복문
* 조건이 참 인 경우에 실행된다.   
* 조건이 변하지 않고 계속 참이라면, 무한히 반복된다    
* 즉 구문안에 조건을 변화시키는 내용이 없으면 무한 반복이 될 수 있다

#### while 구문의 구조.   

		while(조건)    
		{   
		//구문 실행.   
		}

   
		NSInteger index = 0;    
		while(index < 10)   
		{   
		NSLog(@“반복횟수는 %d번이다.”,index);    
		index++;    
		}

		//index++ 에 따라 인덱스는 1씩 증가된다

### for 구문   
* 정해진 횟수만큼 구문 반복실행.   

		for(NSInteger i = 0; i < 10 ; i++){    
		//구문 실행.   
		}

		//NSInteger i = 0 : counting 변수 생성    
		//i < 10 : 구문 실행 조건.   
		//i++ : 변수증감 설정.   
		//counting 변수명은 알파벳으로 지음.   
		//; 으로 구분함

		for(NSInteger count = 0; count <10; count++){    
		NSLog(@“%ld번 반복되었습니다.”, count);    
		}
