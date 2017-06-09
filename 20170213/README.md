## 20170213

### 이벤트에 리한 처리
* 터치 : 발생된 이벤트에 대한 뷰가 처리함
* 리모트 컨트롤 & 쉐이크 모션 이벤트 : 퍼스트 리스폰더 객체
* Accelerometer / Magnetometer / Gyroscope : 각각의 사항을 처리하는 별도 객체로 전달됨
* 로케이션 : 코어 로케이션 객체
* Redraw : 업데이트를 원하는 뷰가 처리함

>리드로우는 뷰를 다시 그리는 이벤트임...요청이 들어오면 진행됨 

### Application Life Cycle

  - Not Running: 실행되지 않았거나, 시스템에 의해 종료된 상태
  - Inactive: 실행 중이지만 이벤트를 받고 있지 않은 상태...앱 실행 중 미리알림 또는 일정 얼럿이 화면에 덮여서 앱이 실질적으로 이벤트를 받지 못하는 상태
  - Active: 어플리케이션이 실질적으로 활동하고 있는 상태...유저와의 상호작용이 발생할 수 있는 상태
  - Background: 백그라운드 상태에서 실질적인 동작을 하고 있는 상태...백그라운드에서 음악을 실행하거나 걸어온 길을 트래킹 하는 등의 동작을 의미...백그라운드 상태유지를 설정 하지 않았다면 언제 Suspended상태로 될지 모른다.
  - Suspended: 백그라운드 상태에서 활동을 멈춘 상태. 빠른 재실행을 위하여 메모리에 적재된 상태이지만 실질적으로는 동작하고 있지는 않다. 메모리가 부족하게되면 언제든지 강제종료한다.

</br>

#### iOS 어플리케이션의 상태변화에 따른 다른 시스템의 App Delegate 객체 메소드 호출

  - willFinishLaunchingWithOptions: 어플리케이션이 최초 실행될 때 호출되는 메소드
  - didFinishLaunchingWithOptions: 어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출, 초기값을 지정해 준다(appearance메서드를 통해  Key Color, Font 등등)
  - applicationDidBecomeActive: 어플리케이션이 Active 상태로 전환된 직후 호출
  - applicationWillResignActive: 어플리케이션이 Inactive 상태로 전환되기 직전에 호출되고 실질적으로 화면에서 사라지는 시점인 경우가 많기 때문에 현재의 어플리케이션 상황 등을 저장할 때 주로 사용된다.
  - applicationDidEnterBackground: 어플리케이션이 백그라운드 상태로 전환된 직후 호출됩니다. 언제 강제종료가 될지모르니 이전 상태인 ResignActive에서 현재 상황을 저장해야...
  - applicationWillEnterForeground: 어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출이 됩니다.
  - applicationWillTerminate: 어플리케이션이 종료되기 직전에 호출됨... 단 호출이 안될때도 있음.


### 백그라운드를 지원하는 태스크들
  
> 백그라운드? 다음곡재생 기능과 같이 백그라운드에서 허용되는 것들만 앱 자체가 아닌 백그라운드 영역에서 돌아간다

* audio and airplay(음악) : 영상은 안된다
* location and update : 위치정보. 위치정보 업데이트 같은 것들
* voice over IP : 인터넷을 사용한 음성통화. 카카오톡 무료통화 같은것
* newsstand download : 뉴스 스탠드 다운로드
* external accessory communication : 기타 하드웨어 악세사리
* bluetooth le accessories : 블루투스 액세서리 사용. 비콘과도 관련됨
* background fetch : 네트워크를 통한 일반적인 다운로드나 미완료된 작업

> 백그라운드 패치는 백프로 지원이 아닌 xx초 안에 되는 것만 진행하거나 요청이 계속 들어오는 것들만 진행한다

* remote notifications(push notifications)
* 이 외에는 모두 백그라운드 러닝을 차단한다

### uiViewController의 생명주기 메소드
* 프로그래머가 직접 호출 불가함
* 오버라이드 하는 메소드임. 꼭 해당 메소드 내에서 `[super ~~]` 로 호출해야 함
* 자주 호출되는 메소드와 그렇지 않은 메소드를 파악해야 한다
* 자주 호출되는 메소드에 객체생성과 같은 코드를 작성하면, 해당 메소드가 계속 불려질 것임. 나아가 터치, 애니메이션 효과가 이상하게 보이냐, 좋아 보이냐가 갈리게 된다

> ex. 화면이 완전 전환되기 전에 애니메이션이 나오는 것과 같은 상황

* 뷰가 메모리에서 사라지느냐, 혹은 그렇지 않느냐 역시 가늠할 수 있다

* (void)loadView

> UIViewController의 view가 생성될 때 호출, 아직 UIViewController가 초기화 되지 않은 상태

* (void)viewDidLoad

> UIViewController가 인스턴스화 된 직후 호출한 것으로 처음 한 번 세팅해 주어야 하는 값들을 넣기에 적절
> 
> 화면 전환시 WillAppaer와 DisAppaer가 계속 호출되므로 viewDidLoad에 초기값을 세팅해 주는것이 좋다

	
* (void)viewWillAppear:(BOOL)animated

> view가 화면에 보여지기 직전에 호출, 화면이 보여지기 전에 준비할 때 사용
> 
> animated는 view가 애니메이션을 동반하여 보여지게 되는지 시스템에서 전달해주는 불리언 값
> 
> 보통 애니메이션으로 변경된값을 다시 기본값으로 세팅해줄 때 사용
	
* (void)viewWillLayoutSubviews

> view의 하위뷰들의 레이아웃이 결정되기 직전 호출 (autoLayout 설정 준비)
	
* (void)viewDidLayoutSubviews

> 	view의 하위뷰들의 레이아웃이 결정된 후 호출, 주로 view의 하위뷰들이 사이즈 조정이 필요할 때 호출 (autoLayout 설정 완료)
	
		
* 	(void)viewDidAppear:(BOOL)animated
> 	view가 화면에 보여진 직후에 호출, 화면이 표시된 이후 애니메이션 등(소리나 영상)을 보여주고 싶을 떄 유용
	
* (void)viewWillDisappear:(BOOL)animated

> view가 화면에서 사라지기 직전에 호출
	
* (void)viewDidDisappear:(BOOL)animated

> view가 화면에서 사라진 직후에 호출
	
* (void)didReceiveMemoryWarning

> 메모리 관리 차원 메서드: 다시 생성될 수 있는 자원은 지금 당장 없애라