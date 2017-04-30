## 20170120

 초기화 메소드의 작성과 구현 

작성

-(instancetype)initWithName:(NSString *)name   
hungry:(NSInteger)hungry    
tiredness:(NSInteger)tiredness;    
{    
self = [super init];    
//프로퍼티 값 설정     
self.name = name;    
self.hungry = 200;     
self.tiredness = 300;     
return self;




▲ 다른 사람의 별도의 질문

main.m 에서 객체를 생성할때 (예를 들면 Person.h)
         Person *p1 = [[Person alloc] init]; 을
         (모든 데이터타입) id *p1 = [[id alloc] init]; 로 만들 수 있나?
         *(id는 타입입니다. 객체를 생성하는 방법은 [클래스명 alloc] 이지요, 그러니 [id alloc]은 불가능 합니다.
         하지만 id p1 = [[Person alloc] init];은 가능합니다. 이렇게 했다면 어떤 문제가 있을까요? - wing -)
         
         [[Person alloc] init]; 의 Person은 id값이나 타입이 아니라 클래스명이다...     
         Person *p1 = [[Person alloc] init]; 은 p1 주소에 [[Person alloc] init]을 담은 Person이라는 "타입"의 객체를 생성한다는 뜻이다     
         따라서 id p2 = [[Person alloc] init]; 은 id 타입의 p2라는 객체를 생성하는 것은 가능하다.     
         그러나 p2가 Person.h 와 Person.m 에서 선언된 프로퍼티, 메소드를 호출, 활용하는 것은 불가하다. p2는 Person의 타입에 속하는 객체가 아닌기 때문이다.        
         즉 p2.name @"phil" , [p2 eat]; 은 절대로 불가하다
         

손코딩 퀴즈 약점. : 매개변수, 메소드 호출

매개변수.    
· 객체가 특정 행위를 수행하려면 부가적인 데이터가 필요함.    
· 부가적인 데이터는 “매개변수”로 전달함.    
·· 들어오는 변수는 여러개 혹은 0개 —-메소드는 들어오는 변수들 통해서 행동 및 연산. —- 결과값은 1개로 도출.   
··. 변수=파라미터=매개변수= 타입+이름…..Ex.  (id) food.   
··· 사람이 xxx를 먹는다 —-> xxx=파라미터=매개변수.   
·· (<반환 타입>)<메소드 이름> = “결과값은 1개로 도출된다” —- 결과값=반환 타입. —-따라서 어떤 타입인지도 지정을 해줘야 함…인트 엔에스인티저 엔에스 스트링 클래스타입 등….    
··. (<반환 타입>)<메소드 이름>  = 파라미터가 없음.    
——>파라미터가 있는 메서드는?      
———> : 을 찍고 매개변수를 넣는다……..콜론은 매소드의 이름 자체를 바꾼다….    
————-> (id)eat : (id)food;     
—->food라는 매개변수가 메소드 안으로 들어와서 —-> 메소드가 가동됨 = (“%@를 먹는다”, food) —-> “food를 먹는다”      
——> 형식지정자=%@ 

Person *me = [[Person alloc] init;      
[me eat:@“사과”];     
—->메소드의 호출 시 사과라는 파라미터만 넣고…매소드 내부에서 사용된다…그리고 메소드에서 설정한 값이 출력된다.