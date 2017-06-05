## 20170203

### UILabel의 헤더파일.   
* 텍스트를 어떻게 띄워줄 것인가를 정해둔 프로퍼티 들

### UILabel Font.   
* 폰트라는건 그것을 구성하는 프로퍼티가 다양한 개념….   
* 라인 갭, 디센트, 어센트와 같은 프로퍼티들은 각 폰트마다 다르다….   
* “개발자가 코드에 작성하고 출력한 폰트가, 디자이너의 대조물과 차이나는 이유”    
* “개발자가 디자이너가 준 폰트 사이즈에서 +1,-1 정도를 보정해서 코드를 작성하는이유”    
* 자간, 장평 줄이기는 불가능…에 가깝다…Ex. 폰트 자체를 수정해서 써야 하지, 원래 있던 폰트를 쓸 때 특정 프로젝트에서만 자간 장평을 수정하는 것은 불가함 …자간 장평은 다른 방법으로 힘들게 수정해야 한다.   
* 사실 UIFont.h 파일에 어센더, 디센더, 라인 하이츠 등 이 프로퍼티로 잡혀 있다…그러나 ReadOnly라 읽어오는 것만 가능하고 수정은 불가하다….   

> UILabel 관련 프로퍼티
> 
		UILabel
		@property(nullable, nonatomic,copy) NSString *text;
		//텍스트 입력
		@property(null_resettable, nonatomic,strong) UIFont;
		//서체, 서체사이즈는 디자이너가 준 사이즈보다 1정도 크게하면 적당하다.
		@property(null_resettable, nonatomic,strong) UIColor;
		//텍스트 색상
		@property(nonatomic) NSTextAlignment textAlignment;
		//텍스트 정렬
		@property(nonatomic) NSLineBreakMode lineBreakMode;
		//넘치는 텍스트 처리


>  UIImageView 관련 프로퍼티
> 
	UIImageView
	@property (nullable, nonatomic, strong) UIImage *image;
  	- imageNamed
  	- + (nullable UIImage *)imageWithContentsOfFile:(NSString *)
  	@property(nonatomic)  UIViewContentMode contentMode;
  	UIViewContentModeScaleAspectFill
  	//비율을 맞춘상태에서 채움
   	UIViewContentModeScaleAspectFit
   	//화면에 맞는 비율 이미지라서 여백이 생길수도 있다.
  	UIViewContentModeScaleToFill
  	//뷰에맞게 이미지를 그냥 늘림

### UIButton   
* UI컨트롤을 상속받았으며, 이벤트를 처리하는 것들임.   
* UIComponent 에 사용자 인터렉션에 의한 응답에 대해 특별한 액션을 줄 수 있게. 설정하는 클래스.    
 
### UIControl 주요 항목     
* Target : 객체를 주로 의미…주로 : 뒤엔 self가 주로...    
* action : 뒤에는 메소드가 들어감
* enabled : 기본값 Yes / 터치 이벤트 사용 여부
* selected : 기본값 No / 눌렀다 뗐을 때 관련 속성
* highlighted : 기본값 No / 터치 눌렀다 뗐을 때 자동으로 해지

### 버튼의 구조.    
* 총 세가지 객체가 모여 있음.    
* 백그라운드 이미지 : 백그라운드 이미지를 지정해 줄 수 있는 객체.   
* 커런트 이미지.    
* 타이틀     
* UIControl을 상속받아 사용자의 요청을 처리함

