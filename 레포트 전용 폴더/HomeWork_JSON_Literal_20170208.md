#20170208 Json 구조와 Literal 문법


#####1.JSON 구조란 무엇인가?
JSON : JavaScript Object Notation
JSON은 자바스크립트 오브젝트 노테이션(JavaScript Object Notation)을 의미하며, 자바스크립트를 객체형식으로 표현하는 것을 말한다. 이는 XML보다 빠르고 변환하기도 쉬우며, 적은양의 데이터가 송수신 되므로 모바일쪽에서 쓰기에 부담이 적은 것이 주요 특징이라고 할 수 있다.    
뿐만 아니라, JSON은 자바스크립트 문법을 사용하기 때문에, JSON으로 작업할 때 별도의 소프트웨어가 필요없다.

- JSON의 장점을 요약하면 다음과 같다.   
>>JSON은 텍스트로 이루어져 있으므로, 사람과 기계 모두 읽고 쓰기 쉽다.
    
>>프로그래밍 언어와 플랫폼에 독립적이므로, 서로 다른 시스템간에 객체를 교환하기에 좋다.    
    
>>자바스크립트의 문법을 채용했기 때문에, 자바스크립트에서 eval 명령으로 곧바로 사용할 수 있다. 이런 특성은 자바스크립트를 자주 사용하는 웹 환경에서 유리하다. 

>> 주의 : 그러나 실질적으로 eval 명령을 사용하면 외부에서 악성 코드가 유입될 수 있다.
>> 
>> 주의사항과 안전 : 모질라 파이어폭스 3.5, 인터넷 익스플로러 8, 오페라 10.5, 사파리, 구글 크롬 등 대부분의 웹 브라우저는 JSON 전용 파서 기능을 내장하고. 있으므로 이런 기능을 사용하는 것이 더 안전할 뿐만 아니라 빠른 방법이다.

- JSON 데이터는 key/value형식으로 구성되어 있다.              
예를 들어 "firstName" : "김"을 알아보기 쉽게 자바스크립트 문장으로 바꾸면 다음과 같다. 

    firstName = "김"

이중에서 value에는 다음과 같은 형식을 넣을 수 있다.

    a number(integer or float)         
    a string(큰 따옴표 포함)          
    a boolean(true or false)        
    an object(중괄호 포함)         
    an array(대괄호 포함)        
    null

value에 들어갈 수 있는 항목들을 구체적으로 살펴 보면, 다음과 같다

>>[a number]    
>>integer형이나 float형을 넣을 수 있다.    
        
        "clickNumber" : 1


>>[a string]   
>>string형을 표현하고 싶을 때는 큰 따옴표로 묶어준다.

    "name" : "홍길동"

>>또한 그 안에는 유니코드 문자들이 나열된다. 유니코드 중 역슬래시(\)와 큰따옴표(")는 바로 사용할 수 없다. 역슬래시는 제어문자를 표현하기 위해 사용되며 다음과 같은 의미를 지닌다.

    \b 백스페이스   
    \f 폼 피드  
    \n 개행  
    \r 캐리지 리턴   
    \t 탭
    \" 따옴표   
    \/ 슬래시   
    \\ 역슬래시   
    \uHHHH 16진수 네자리로되어 있는 유니코드 문자


>>[a boolean]    
>>true 나 false를 넣을 수 있다.    

    "bResult" : true

>>[an object]    
>>여러개의 key/value를 입력하여 중괄호로 둘러싸여진다. 이름은 문자열이기 때문에 반드시 따옴표를 하며, 값은 기본 자료형이거나 배열, 객체이다. 각 쌍들은 쉼표(,)로 구별된다. 각 쌍이 나오는 순서는 의미가 없다.

    {"firstName" : "길동", "lastName" : "홍"}

>>[an array]   
>>여러개의 object를 대괄호를 통해 둘러싸여진다. 배열의 각 요소는 기본 자료형이거나 배열, 객체이다. 각 요소들은 쉼표(,)로 구별된다. 또한 각 요소가 나타나는 순서에 의미가 있다.



    {
      "employees" : [
    {"firstName" : "길동", "lastName" : "홍"},
    {"firstName" : "철수", "lastName" : "김"},
    {"firstName" : "영순", "lastName" : "박"}
      ]
    }

#####2.리터럴 문법은 무엇인가?
간단히 말하자면, 리터럴 문법은 '특정 메소드를 실행하는 데 있어서 더 짧은 코드를 작성하기 위한 법'이라고 생각된다. 
레퍼런스 변수에 값을 할당하기 위해선, 메소드를 실행하는 형식의 문법을 모두 작성해 주었어야 했으나, 리터럴 문법을 통해 이를 간소화 할 수 있는 것이다. 

*NSNumber Literal, Object Subscripting, Container Literal*이 그 예시이다. 

다음은 NSNumber Literal의 예시로, 기존의 []을 이용한 메소드 실행 코드와 형식이 다소 다른 것을 알 수 있다. 

    NSNumber *theLetterZ = @'Z'; 
    // 상동 [NSNumber numberWithChar:'Z']

    NSNumber *yesNumber = @YES;  
    //. 상동 [NSNumber numberWithBool:YES]
    
    

>**즉, char, long, long long, short, int, float, double, bool** 을 활용해야 할 시 사용할 수 있을 것이다.


Object Subscripting 측면을 살펴 보면, 기존 객체 포인트 값에 대해 메소드 형식으로 접근하는 대신, C 배열의 인덱스 방식처럼 사용할 수 있는 것을 알 수 있다. 

    NSMutableArray *array = ...;
    NSUInteger idx = ...;
    id newObject = ...;
    id oldObject = array[idx];
    array[idx] = newObject;            
     // 올드 오브젝트를 뉴 오브젝트로 대체함


    NSMutableDictionary *dictionary = ...;
    NSString *key = ...;
    oldObject = dictionary[key];
    dictionary[key] = newObject;        
    // 올드 오브젝트를 뉴 오브젝트로 대체함
    
    
Container Literal은 immutable array와 dictionary container 오브젝트 생성 시 기여할 것으로 보인다.

하단은 그 예시이다.

    Immutable array expression:
    NSArray *array = @[ @"Hello", NSApp, [NSNumber
    numberWithInt:42] ];

    Immutable dictionary expression:
    NSDictionary *dictionary = @{
    @"name" : NSUserName(),
    @"date" : [NSDate date],
    @"processInfo" : [NSProcessInfo processInfo]
    };
