### 20170315
### 네트워크 기초

- 네트워크 수업의 목적.   
- “서버 개발자가 A방식으로 일하니, iOS개발자는 A에 맞춰서 생각해야 함”을 주지시키는 것

## 클라이언트 서버 모델.   
- 네트워크 아키텍쳐 중 하나.   
- 서버 : 클라이언트의 요청에 따라 데이터를 제공해 주는 컴퓨터 == 백엔드.   
- 클라이언트 : 서버로부터 요청한 데이터를 받는 컴퓨커 == 프론트엔드, iOS 개발자 
——> iOS / 프론트엔드 개발자는 클라이언트 개발자로 보는 것이 맞다 = 모바일프론트엔드 개발자로 보는 것이 맞다.   
모바일에서 가장 많이 사용하는 모델.   
공급자는 공급만, 소비자는 소비만 가능함.   
cf) P2P : 공급자, 소비자가 둘 다 소비자와 공급자 역할을 하는 것
서버와 클라이언트는 프로토콜을 통해 소통한다     
ex.HTTP프로토콜로 요청하면, HTTP프로토콜로 응답한다

## 프로토콜 
- 컴퓨터끼리, 컴퓨터와 단말기 사이에 상호통신 시 데이터를 에러없이 원활, 신뢰성있게 주고받기 위한 약속의 규정.== 통신규약.   
- 종류.   
HTTP.   
HTTPS — iOS는 Secure 되지 않은 건 쓰지 못하도록 막아둠.   
FTP.   
SMTP — “모든 메일이 사용함”.   
SSH — “mac에서 다른 PC로 연결시 사용.   
TCP — 서버와 클라이언트가 정확한 데이터를 주고받는지 확인함 — ex.텍스트 전송    
UDP — TCP보다. 더. 빠름, Data가 다소 부족해도 주고받기의 “진행”은 되도록 함 —ex.영상, 이미지 스트리밍, 스타크래프트 연결시 “이미지 보이기” “보다 “컨트롤”이. 더 중요할 때 사용하는 경우.   

- URL.   
네트워크 상에서 자원이 어디 있는지를 알려주기 위한 규약
“자원의 위치”에 대한 개념
제일 앞에 자원에 접근할 방법을 정의해 둔 프로토콜 이름을 적는다…ex.FTP, HTTP 등
프로토콜 이름 다음엔 프로토콜 이름을 구분하는 구분자인 “:” 을 적는다
IP나 도메인네임 정보가 필요한 프로토콜이라면 : 다음에 “//“를 적는다

- IP와 도메인.   
IP는 실제 컴퓨터의 위치임
도메인하나에 여러 IP를 물리는 것도 가능함.   
ex) “JunYoungJee의 집” == 도메인 —- “합정역 5번 출구 오피스텔” “신대방의. 원룸” “삼청동12번지 한옥방” == IP

- URI.   
통합자원식별자. 인터넷에 있는 자원을 나타내는 유일한 주소.   
URL은 URI의 한 종류
URL은 특정 리소스의 정확한 위치를
URI는 자원을 나타내는 식별자 역할
URL은 특정 자원의 위치값으로 실제 파일이 있음 ==http://naver.com/index.html
URI는 Restful구조에서 특정 자원을 나타내는 함수로 실제 파일이 없음 == http://naver.com/basefile 
URI는 인덱스파일에 대한, 어떤 파일을 줄 지를 서버가 결정함 == 데스크탑과 스마트폰은 디바이스가 다르므로 다른 파일을 주어야 함…매우 큰 이미지를 모바일에 주는 것은 맞지 않으므로

- Rest.   
“Representational State Transfer” 
www와 같은 분산 하이퍼미디어시스템을 위한 소프트웨어 아키텍처
엄격한 의미로는 네트워크 아키텍처 원리의 모음 / 네트워크아키텍처 원리는 자원을 정의, 자원에 대한 주소를 지정하는 방법의 전반
서버는 /basefile 요청에 따른 메소드 실행 결과 값을 전달

- Rest의 사용 원칙.   
Resource : URI들은 쉽게 자원의 내용을 이해할 수 있게 만들어야 함 Representations : 객체와 속성을 나타내는 데이터를 JSON이나 XML구조로 전환해서 표현한다.   
Message : HTTP 메소드를 사용함 (GET, POST, PUT, DELETE).   
Stateless : 서버와 클라이언트의 요청사항은 저장하지 않음 / 클라이언트는 세션 상태를 유지함

- HTTP Request     
URI를 이용해 서버에 데이터를 요청함
크게 헤더와 바디로 나눔
HTTP 메소드를 사용해서 요청 메시지를 보냄

- HTTP Request의 종류    
POST / Create.   
GET / Read — “서버에게 데이터를 달라고 요청”
“포스트와 겟은 가장 많이 쓰임 + 메소드를 개발자가 만들 시 “가져오기, 지우기”를 넣어도 된다
PUT / Update - Replace
PATCH / Update - Modify
DELETE / Delete 

HTTP Request의 구조
Request-Line (ex : GET / index HTTP/1.1)
Header (general-header | request-header | entity-header)
[message-body]

Request Header
“헤더에 들어가는 요청 시 정보”
Host
Accept
User-Agent
기타
[예시]
GET / basefile HTTP/1.1
Host : naver.com
Accept : text/plain
Content - Encoding “gzip”

Contents Type
서버 클라이언트 간의 어떤 데이터를 주고 받을 수 있는지를 명시하는 타입
“서버와 클라이언트는 타입을 맞춰 줘야 함”

## 대표적인 Contents Type
- Multipart Related MINE 타입.    
- Content - Type : Multipart / related
- XML Media Type    
Content - Type : text/xml    
Content-Type : Application/xml
- Application의 타입    
Content - Type : Application/json —“가장 많이 쓰이는 타입”    
Content- Type: Application/x-www-form-urlencode —“가장 많이 쓰이는 타입
- 오디오 타입.   
Content-Type : audio/mpeg <— MP3, MPEG Audio
- Multipart 타입.   
Content-Type : multipart.formed-data <— 파일 첨부 - “이미지, 파일 업로드시 사용”    
- 그 외 다수

## 메시지 바디.   
- GET    
HTTP 메소드의 파라미터는 URL에 포함시켜서 정보를 보낸다.   
ex)http://siteURI/age?firstName=junyoung&lastName=jee.   
?는 바디의 끝을, &는 “키&값”을 의미함.   
GET을 제외한 나머지 메소드의 파라미터는 content-Type에 맞는 형식으로 바디 메시지에 포함시켜 요청을 보낸다---->해당 방식은 보안에 매우 취약한 방식임 —> 노출되어도 상관 없는 것을 보낼때 / 보낼때 암호화 해서 사용함

- JSON 데이터 타입.   
속성 - 값 쌍으로 이루어진 데이터 오브젝트를 전달하고자 인간이 읽을 수 있는 텍스트를 사용하는 개방형 표준 포맷    
iOS개발자가 사용시엔 NSDictionary, NSArray 형태로 변환해서 사용함.   
[예시].   
{ “이름” : “사람이름”,    
“나이” : 25,    
“성별” : “남”,    
“주소” : “서울 양천구 목동”,  
“특기” : [“농구”, “잠”],  
“가족관계” : {“#” : 2. “아버지” : “홍판서, “어머니”: “춘섬”}    
“회사” : “경기도 안양시 만안구 안양 7동”   
}

## iOS 네트워크
- NSURLSession : 연결에 대한 내용
- NSURLRequest : 요청에 관한 내용

- NSURLSession.   
서버에 데이터를 요청할 수 있는 API    
HTTP Request를 통해 데이터를 보내고 받는데 중요한 객체임 /   NSURLSessionConfiguration을 통해 3가지의 Session을 만들 수 있음    
NSURLConnection을 대체하기 위해 나온 클래스임. 더 강력한 기능(백그라운드 다운로드, 업로드)을 지원함.   
다른 스레드에서 구동되는 것이 가능함.   
싱글턴 구조임 “(NSURLSession *)sharedSession;”
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request; — “GET방식시 사용”
- (NSURLSessionUploadTask *)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData; — “POST방식시 사용”
- (NSURLSessionDownloadTask *)downloadTaskWithRequest:(NSURLRequest *)request;

- NSURLSessionConfiguration.   
NSURLSessionConfiguration은 Session의 설정에 관련된 객체임    
타임아웃, 캐시정책, 추가적인 HTTP헤더와 같은 여러 프로퍼티를 설정할 수 있게 해줌.   
- 1.defaultSessionConfiguration     
- 2.ephemeralSessionConfiguration.   
- 3.backgroundSessionConfiguration 

## NSURLSessionTask.   
- 세션의 작업 하나를 나타내는 추상클래스임. 세션은 데이터를 다운로드하거나 업로드하는. 작업을 생성함 작업에는 3가지 종류가 존재함
- 1.NSURLSessionDataTask: HTTP GET 요청으로 서버로부터 데이터를 가져오는(text 관련 data)를 가져오는 작업을 수행함
- 2.NSURLSessionUploadTask: 디스크로부터 웹서버로 파일을 업로드하는 작업을 수행함. 주로 HTTP POST, PUT 메소드를 이용함
- 3.NSURLSessionDownloadTask:리모트 서버로부터 파일(이미지관련 Data)을 다운로드하는 작업을 수행함

## task관리용 메소드
cancel, resume, suspend

- 실행순서
- 1.NSURLSession객체를 만듬. Configuration 설정은 옵션임
- 2.알맞는 NSRURLSessionTask객체를 만듬
- 3.task resume 메소드를 이용해 테스크를 실행시킴
- 4.태스크에 대한 respond가 task메소드 블록 안에서 실행됨

### ATS

- ATS : App Transport Security
iOS9 이상의 버전에서 ATS 기술이 기본적으로 적용됨 —> 기존에 iOS앱에서 사용하던 암호화되지 않은 HTTP통신은 OS내부에서 강제적으로 차단됨
애플은 ATS를 강화하는 방향으로 움직임 —> “보안이 적용안된 서버는 iOS가 통신을 막아버림” “ 서버가 request를 받아도 iOS가 거절함”

순서 : info.plist 파일 열기 —> 새로운 Row 추가 —>App Transport Security Setting 항목 추가 —> Allow Arbitrary Loads 추가 —> YES로 변경 : ATS 해제…….해제 옵션은 도메인 등 다양함