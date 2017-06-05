## 20170206


### 프로토콜   
* 복수의 컴퓨터 사이나 중앙컴퓨터와 단말기 사이에서 데이터 통신을 원활하게. 하기 위해 필요한 통신 규약. 신호 송신의 순서, 데이터 표현법,오류 검출법 등을 정함
* “객체지향에선 두 클래스 간의 약속을 의미함” == “~~한 이름의 함수를 만들어야 한다”.   
* 프로토콜과 Delegate는 같은 것은 아니나, 오브젝티브C에선 객체간 통신을 할 땐. Delegate 패턴 방식을 이용한 프로토콜을 만듬
* **프로토콜은 다른 클래스의 객체와 통신을 위한 규약**

### Delegate   
* 프로토콜에서 정의된 것을 가져다가 쓸 수도 있다   
* 프로토콜을 상속 받고, 개발자가 그 부분을 구현해야 함. 
* **프로토콜의 방법 중 하나**


		@protocol name;

		@interface ClassName : ClassName

		@property (nonatomic, weak) id <protocolName> delegate;
	
		@end
	
		@protocol protocolName <NSObject>
	
		- delegate method;
	
		@end

### 델리게이트와 뷰 컨트롤러 — 스크롤뷰가 있다고 가정 했을 시….   
* 스크롤뷰는 사용자가 입력하는 스크롤, 그리고 사용자가 끝까지 스크롤을 내렸을 시 발생하는 “새로고침”에 대한 사용자의 입력을 모두 받는다, 이때 새로고침을 해야 한다고 가정 하면, 이 새로고침은 뷰 컨트롤러가 해야 한다.    
* 즉 입력을 받는 것은 스크롤뷰이나, 이 입력값에 대해 “어떤 사항을 구현, 진행”해야. 할 지는 뷰 컨트롤러가 알고 있어야 하며, 다시 스크롤뷰가 뷰 컨트롤러에게 알려주어야 한다.

### UITextField
* 사용자의 텍스트 입력을 위함 UI 컴포넌트
#### 주요 항목 
* text : 텍스트
* font : 폰트
* textColor : 텍스트 색상
* textAlignment : 텍스트 정렬
* placeholder : 희미하게 보이는 글자 (ex.암호를 입력하세요)
* background : 배경 이미지
* delegate : 델리게이트

> UITextFiledDelegate.   
@optional     
“원하는 부분 만을 구현해서 쓸 수 있는 것들: == 델리게이트는 메소드의 사용 구현에. 있어서 반드시 구현이 되어야 하는 것들도 있으나 해당 항목은 다름

### UIScrollView
### 주요항목
* contentOffset : 컨텐츠 좌표
* contentSize : 컨텐츠 사이즈
* bounces : 끝까지 갔을때 끝 밑으로도 더 스크롤 되고, 다시 튕기듯이 돌아옴
* pagingEnabled : 스크롤뷰사이즈의 반이 넘어가면 다음 컨텐츠 뷰로 넘어감
* scrollEnabled : 
* minimumZoomScale : 확대 최소 수치
* maximumZoomScale : 확대 최대 수치
* (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated : 컨텐츠 좌표 지정 및 애니메이션 지정
* (void)setZoomScale:(CGFloat)scale animated:(BOOL)animated : 확대 지정 및 애니메이션 지정

## 자판기 만들기 피드백과 프로토콜, 델리게이트.   
* UIImageView는 디폴트 값이 no로 되어 있다…따라서 이 위에 올리면…아래에 등록된 모든 뷰 들에는 모든 자극을 무시하거나, 영향을 받거나, 영향을 받지 않는다….   
대신 하위 뷰에 특정 효과를 주고 싶으면, 그 해당 하위 뷰에 다른 메소드나 프로퍼티를줘야 함     

> Ex. alpha값을 한 뷰에 주면, 하위에 addSubview된 버튼, 뷰 들에도 같은 알파값이 적용되는 것….   
백그라운드컬러가 하위 뷰에 영향을 주지 않는 것과는 대조적임.   
따라서 하위 뷰에 영향을 주지 않고 알파값을 주고 싶으면, 해당 뷰의 ‘컬러 자체’에 알파값을 줘야 함.    

* addSubView는 클래스 상속과 마찬가지로…이중으로 부모,자식관계를 맺는 것은 불가함

### 버튼    
* stateSelected.    
코드로 기본 프로퍼티 값을 바꿔줘야지만 활성화가 됨….   
—->누르는 것에 대한 이벤트로 바뀌어야 함…그냥 프로퍼티로만 = YES로 하면 계속 바뀌어 있음….   
——->따라서 addTarget 을 통해 미리 만든 메소드를 활용해야 함

* tag.   
btn1.tag = 20     
—->”btn1 객체에게 20번이라는 번호표를 준다”

