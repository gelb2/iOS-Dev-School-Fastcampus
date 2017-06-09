## 20170214

## Property

### 접근자 Getter와 Setter -- "Accessor Method"

#### 게터
* 인스턴스 변수의 값을 가져오는 메소드
* 게터 메소드 명은 인스턴스 변수명과 같이 짓는다
		
		인스턴스 변수 _name // 메소드 - (NSString*)name
		
		
#### 세터
* 세터 메소드 명은 인스턴스 변수명앞에 set 키워드를 붙인다

		인스턴스 변수_name // 메소드 - (void)setName:(NSString*)name
		
		
### 예전에 접근자를 설정하던 방식

		@interface NewClass : NSObject
		-(NSString*)name;
		-(void)setName:(NSString*)name;
		@end
		
		@implementation Person
		{
		NSString *_name;
		}
		-(NSString *)name{
		return _name;
		}
		-(void)setName:(NSString *)name{
		_name = name;
		}
		
		@end
		
		
> 현재는 @property name 으로 작성하면 자동으로 잡힌다

* 객체지향 프로그램 개발시에 수없이 많은 Accessor Method가 필요하다...사실 자동으로 엑세서 메소드를 생성해주면 개발이 더 쉬워질텐데...
* 그래서 나온 개념이 **@property**		

### 프로퍼티의 속성
#### 이름 재정의
* getter = newName : 게터 메소드 이름을 재지정...
* setter = newName : 세터 메소드 이름을 재지정
* default getter = property name, setter : set + property name

> boot 변수는 getter의 이름을 is를 넣어서 만든다
> 
> (isUseAutoLogin과 값은 BOOL 값을 명시하기 위해 사용함)

#### 엑세스 권한
* readonly = 읽기전용 Getter만 자동 생성
* readwrite = 읽기, 쓰기 겸용...Getter와 Setter를 자동 생성**"기본설정"**


#### 스레드 처리
* atomic : 멀티스레드시 메소드를 잠궈서 멀티스레드의 안정성 보장...두 메소드가 동시에 프로퍼티에 들어올 시 임의로 1개를 잠근다...**기본설정**
* nonatomic : 멀티스레드때도 메소드가 돌아간다...멀티스레드시 발생할 에러 등을 개발자가 고려해야 한다...atomic보다 가볍고 빠르다

#### 할당방식 
* retain : 객체를 리테인해서 할당...프로퍼티에 세팅시 리테인 카운트를 1 증가시킨다...**ARC가 아닌 환경에서 기본설정**
* unsafe_unretained : 주소만 할당한다...프로퍼티에 세팅시 리테인 카운트를 변경시키지 않음...프로퍼티가 참조하는 값이 메모리에서 해제될경우 프로퍼티는 기존 주소값으 계속 가지고 있어서 오류가 난다. 따라서 nil값을 set 해야 한다
* strong : ARC에서 오너쉽 객체(ratain과 유사함)...프로퍼티에 세팅시 리테인 카운트를 1 증가시킴...프로퍼티가 메모리에서 해제되면 참조값의 리테인 카운트를 1 감소시킨다 **기본설정**
* weak : ARC에서 unsafe_unretained와 유사...프로퍼티에 세팅시 리테인 카운트 변경 없음...unsafe_unretained와의 차이는 객체가 메모리에서 해제될 시 자동으로 변수에 nil이 set 된다

> weak로 설정했을 경우, 해당 객체가 제대로 뷰에 띄워지지 않고 생성과 동시에 날아가는 경우를 보게 될 확률이 높다. 무조건 weak로 설정하는 것은 자제해야 한다

* assign : 값 할당...값타입에서 사용...값타입의 디폴트
* copy : 객체를 복사해서 할당...객체타입에서 사용...객체를 새로 생성해 프로퍼티에 할당

#### null관리
* 프로퍼티가 nil이 할당될 수 있는지의 여부
* 객체타입에만 사용한다
* nullable : 프로퍼티가 null일 수 있다
* nonnull : 프로퍼티가 null일 수 없다
* null_unspecified : 프로퍼티의 null 여부가 지정되어있지 않다...**기본설정**
* null_resettable : 객체가 init되면서 해당프로퍼티의 기본값을 할당하므로 null일 수 없다...


## ARC 
* 명시적해제 : 모든것을 개발자가 관리함
* 가비지콜렉터 : 가비지콜렉터가 수시로 확인해서 안쓰는 객체를 해제시킴...시스템 부하가 발생
* 레퍼런스 카운팅 : 오너십 정책에 의해 겍체의 해제 정의

> 가비지콜렉터 =! ARC

### 레퍼런스 카운팅의 규칙 
* alloc을 하면 리테인 카운트가 1 증가
* retain을 호출하면 리테인 카운트가 1증가
* release를 호출하면 리테인 카운트가 1 감소
* 리테인 카운트가 0이 되면 객체가 메모리에서 해제됨
* dealloc을 호출하면 메모리에서 해제됨

### 레퍼런스 카운팅  

		NSString *string1 = [[NSString alloc] init]; 
		//alloc을 하면 리테인 카운트가 1 증가
		NSString *string2 = [string1 retain];
		//retain을 호출하면 리테인 카운트가 1증가
		NSString *string3 = string2;
		//리테인 카운트와 상관없는 참조
		
		[string1 release];
		[string2 release];
		//release를 호출하면 리테인 카운트가 1 감소... "객체가 없어진다"


		- (id)init{
		retainCount = 1;
		}
		
		-(id)retain{
		retainCount += 1;
		return self;
		}

		-(void)release{
		retainCount -= 1;
		if(retainCount == 0)
		[self dealloc];
		//dealloc을 호출하면 메모리에서 해제됨
		}
		
		
## ARC의 등장과 이유

### ARC의 도입 이유
* 앱의 비정상 종료 원인 중 많은 부분이 메모리 문제이며, 애플의 앱 승인 거부의 대다수 원인이 메모리 관리임
* 많은 개발자들이 수동적(retain / release)메모리 관리로 힘들어함
* retain / release는 코드 복잡도를 증가시킴

### ARC는 오토메틱 레퍼런스 카운팅임...수동으로 개발자가 retain / release를 통해 레퍼런스 카운팅을 관리해야 하는 부분을 자동으로 해줌

### ARC의 규칙
* **retain, release, retainCount, autorelease, dealloc을 직접 호출할 수 없다**
* retainCount는 코드 블럭을 벗어나면 1 감소한다

> ex. 메소드가 실행이 다 된 후

* strong 참조개 해제되면 리테인 카운트가 1 감소한다
* 오브젝티브씨의 참조형 객체에만 사용된다
* 구조체내의 객체 포인트를 사용할 수 없다

> ex. CGSize는 CGFloat width height 등으로 구성되어 있다
>
>  "안에 포인터를 넣지 마라"는 의미
> 
> 요지 : @property를 생성해서 써라

* id, void * type을 직접 형변환 할 수 없다

> 형변환 
> 
> NSInteger r = 34;
> 
> (CGFloat) r;
> 
> "인티저 r을 씨지플롯 r로 간주하겠다"
> 
> "캐스팅을 하면 출력시 r은 34.000000000" 으로 찍힌다"

* NSAutoreleasePool 객체를 사용할 수 없다

### weak와 Strong

		@property(strong) NSString *string1;
		//강한 참조 객체 선언
		//ARC에서 카운트 컨트롤 시 사용
		@property(weak) NSString *string2;
		//위크는 리테인 카운트에 영향을 주지 않음
		//weak로 설정했을 경우, 해당 객체가 제대로 뷰에 띄워지지 않고 생성과 
		//동시에 날아가는 경우를 보게 될 확률이 높다. 
		//무조건 weak로 설정하는 것은 자제해야 한다

> weak를 쓰는 이유
> 
> * 순환참조를 막고자
> * autorelease pool을 대신해서 자동 해제가 필요한 경우
> * view의 strong 참조 때문에