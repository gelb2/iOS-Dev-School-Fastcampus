## 20170220

## UIViewController

### UIViewController 역할
  - 앱의 기초가 되는 내부 구조
  - 모든 앱은 한개 이상의 ViewController를 가지고 있으며 대부분의 앱은 다수의 뷰컨트롤러로 이뤄져 있다
  - 사용자의 인터렉션과 앱의 데이터 사이에서 컨트롤의 역할을 한다.
  - 뷰 관리, 이벤트, 뷰컨트롤러 간 전환과 관련된 메소드, 프로퍼티를 갖고 있다.

#### UIViewController - Root View

  - View의 계층을 관리하는 기능
  - 모든 ViewController는 한개의 rootView를 가지고 있다.
  - 화면에 표시하기 위해서는 모든 View는 RootView의 계층 안에 있어야 한다.

#### Child UIViewController

  - ViewController는 다른 ViewController를 Child ViewController로 관리할 수 있다.
  - Child ViewController의 RootView를 최상위의 RootView에 addSubView하여 화면에 표시 가능하다.
  - 즉 addSubView 하면 자식뷰 비슷하게 존재할 수 있다.

#### UserInteraction

  - ViewController는 UIResponder를 상속받은 객체로 이벤트 체인으로부터 오는 Event는 효과적으로 처리한다. 즉 사용자의 모든 Event는 ViewController가 받아서 각 View에서 처리되는 Action Method와  Delegate를 처리된다.

>   뷰는 델리게이트를 통해 들어오는 이벤트 중 어지간한 것들은 대부분 뷰컨트롤러로 델리게이트를 통해서 보낸다. 이는 애플의 권고사항임

#### Data Marshaling

  - ViewController는 자신이 관리하는 View들과 App 내부의 Data와의 중계자 역할을 한다.

> 뷰컨트롤러는 커스텀 데이터 오브젝트와 뷰 사이에서 일어날 수 있는 모든 동작을 관장한다

#### Resource Management

  - ViewController안에 있는 모든 View나 객체는 모두  ViewController가 관리한다
  - 앱 사용중 Memory가 부족할 때 didReceiveMemoryWarning method가 불리며, 오래동안 사용하지 않은 객체와 다시 쉽게 만들수 있는 객체를 제거할 수 있다.(사용하지 않는 뷰의 경우엔 자동으로 제거된다)
  - 하위 View를 일단 지우고 그 후에 처리할 것이 있으면 didReceiveMemoryWarning에서 구현한다

</br>

### ViewController 종류

#### General View Controller

  - 일반적인 ViewController형태
  - 각 View Controller가 Root View를 가지고 있다.
  - UIViewController
  - UITableViewController
  - UICollectionViewController

#### Container View Controller
* 	UINavigationController
*  UITabbarController
*  UISplitViewController
*  그외 다수

#### General ViewController
* 일반적인 뷰컨트롤러 형태
* 각 뷰컨트롤러가 루트 뷰를 가지고 있다
* ViewController간의 구조를 잡는 역할, 관련된 내용을 더 자세히 보고싶은 화면구성을 위해 사용한다.

> UIViewController의 루트뷰 : UIView
> 
> UITableViewcontroller의 루트뷰 : UITableView
> 
> UICollectionViewController의 루트뷰 : UICollectionView
> 
* CF) UIViewController에서 테이블뷰, 컬렉션뷰를 만들어서 addSubView하면 Size 등을 다양하게 설정할 수 있다. 그러나 테이블뷰컨트롤러, 컬렉션뷰컨트롤러로 관련 뷰를 생성하면 옵션들이 제한된다...하지만 델리게이트, 메소드 설정등이 테이블뷰컨트롤러와 컬렉션뷰컨트롤러에는 미리 잡혀있다

## UIViewController Object Load

* 스토리보드 활용하기

		UIStoryboard *storyboard = [UIStoryboard 
		storyboardWithName@"스토리보드 이름" bundle:[NSBundle mainBundle]];
		UIViewController *rootViewcontroller = [storyboard 
		instantiateViewControllerWithIdentifier@"스토리보드 아이디"];
		
		//스토리보드에서 스토리보드 아이디를 지정하는걸 까먹으면 
		크래시를 잡느라 헤메게 된다

* xib 활용하기

		UIViewcontroller *rootviewcontroller = 
		[[UIViewcontroller alloc] 
		initwithnibname@"viewcontroller" bundle:nil];


## Present Modally (화면이동)

* ViewController간의 화면 전환
* 연관성 없는 다른 화면간의 이동에 활용 ex)Alert
* 밑에서 위로 올라오는 동작 : Present
* 위에서 밑으로 내려가는 동작 : Dismiss

### 화면전환과 애니메이션의 예

		- (IBAction)next:(id)sender{
		//xib 활용
		SecondViewController *svc = [[SecondViewController alloc]init];
		
		//스토리보드 활용
		SecondViewController *svc = [self.storyboard 
		instantiateViewControllerWithIdentifier:@"secondVC"];
		
		//애니메이션 - transition
		[svc setModalTransitionStyle:
		UIModalTransitionStyleFlipHorizontal]

		//present
		[self presentViewController:svc animated:YES 
		completion:^{ //완료 후 실행되는 블록}
		}


		-(IBAction)back:(id)sender{
		[self dismissViewControllerAnimated:YES completion:^{
		//닫은 후 할 행동 블록
		}
		
		}

> xib와 스토리보드에 따라 객체 생성 방법이 다름

## 컨테이너 뷰러트롤러
* 뷰컨트롤러의 컨테이너 역할을 하는 뷰컨트롤러
* 뷰컨트롤러간의 구조를 잡는 역할을 함
* 일반적으로 루트뷰를 안갖고 있고, 뷰컨트롤러를 서브 뷰 컨트롤러로 가지고 있음
* UINavigationController, UITabbarController, UISplitViewController(아이패드에서 사용)


### NavigationController

  - Stack방식으로 다른 ViewController를 관리한다.
  - 즉 Depth로 구분한다
  - Push, Pop 메소드를 활용함
  - 올라가는 순서 : 텝바위의 텝바, 네비게이션 바 위에 텝바 올리기 는 불가능..."되긴 하지만 UX가 엉망이 됨


		@property viewControllers
		@property topViewController : 가장 위에 있는 뷰
		@property visibleViewController : 지금 보이는 뷰
		@property navigationBar : 상단에 네비게이션 바
		//UINavigationBar와 델리게이트 관계임
		@property toolbar : 하단에 있음. 숨겨져 있다(디폴트임)
		@property delegate : Custom Delegate object
  
#### NavigationController 예시
* 스토리보드에서 뷰 컨트롤러 선택
* Editor --> Embed in --> NavigationController
* NavigationController 지정

		- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
		UIStoryboard *storyboard = [UIStoryboard storyboard
		WithName:@"main" bundle:[NSBundle mainBundle]];
		UINavigationController *naviController = [storyboard
		instantiateInitialViewController];
		self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		self.window.rootViewController = navigationController;
		[self.window makeKeyAndVisible];
	
		//해당 코드는 스토리보드를 전혀 못쓰는 상황에서 사용하면 된다
		return YES;
		}
  
### Navigation View Controller 2, ToolBar, Tab Bar Controller

#### Navigation Bar
* 네비게이션바는 인터페이스를 관리하는 뷰
* 바의 외관은 커스텀하게 할 수 있다
* 그러나 Frame, Bounds, Alpha는 바꿀 수 없다...즉 바의 높이, 위치는 정해져 있다
* Left : leftBarButtonItem(버튼), backBarbuttonItem
* Center : titleView(뷰)
* Right : rightBarButtonItem(버튼)

#### NavigationBarBut시on 예시

		UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItem
		:[NSArray arrayWithObjects : [UIImage imageNamed:@"up.png"], [UIImage imageNamed:@"down.png"], nil]];

		[segmentedControl addTarget:self action:@selector(segmentAction:) 
		forControlEvents:UIControlEventValueChanged);
		segmentedControl.frame = CGRectMake(0, 0, 90, 35);
		segmentedControl.SegmentedControlStyle = UISegmentedControlStyleBar;
		SegmentedControl.momentary = YES;
		
		UIBarbuttonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
		self.navigationItem.rightBarButtonItem = segmentBarItem;
		//네비게이션아이템의 프로퍼티는 뷰컨트롤러에서 바꿔야 한다

### Tool Bar
  - ViewController의 부가적 기능을 위해 ToolBar를 사용
  - 기본옵션은 hidden (toolbarHidden = NO)
  - toolBarItems(toolBarItem의 NSArray)
  - 잘쓰이지 않는다.

#### Custom ToolB시r의 예시

		UIBarButtonItem *flexibleSpaceItem = [[UIBarbuttonItem alloc]
		initWithBarButtonSystemItem:UIBarbuttonSystemItemFlexibleSpace target:nil action:nil];
		
		UISegmentedControl *sortToggle = [[UISegmentedControl alloc]
		initWithItems:[NSArray arrayWithObjects:@"Ascending", @"Descending", nil]];
		sortToggle.selectedSegmentIndex = 0;
		[sortToggle addTarget:self action:@selector(toggleSorting:) forControlEvents:UIControlEventValueChanged];
		
		UIBarButtonItem *sortToggleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sortToggle];
		
		self.toolbarItems = [NSArray arraywithObjects: flexibleSpaceItem, sortToggleButtonItem, flexibleSpaceItem, nil];

### Tab Bar Controller
  - 다양한 별개의 인터페이스를 관리한다 ex)시계,알람,스톱워치,타이머를 시간으로 묶는 느낌
  - height를 바꿀 수 없다
  - 아이템은 5개만 가능하다

#### Tab Bar Item
  - 각각의 ViewController를 각 tabBarItem에 매칭할 수 있다.
  - image, text를 넣을수 있다.
  - 각 tabBarItem은 해당 ViewController의 tabBarItem property로 접근 가능하다.  
  
  		@property selectedImageTintColor
  		@property shadowImage
  		@property translucent
  		@property barStyle
  		@property barTintColor
  		@property backgroundImage
  
##### TabBarController의 예시
스토리보드를 활용한다면
* ViewController 혹은 네비게이션컨트롤러 선택
* 에디터 --> Embed In --> 탭바 컨트롤러
* 탭바 컨트롤러 Initial 지정

		-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
		UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
		UITabbarController *tabbarController = [storyboard instantiateInitialViewController];
		
		self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		self.window.rootViewController = tabbarController;
		[self.window makeKeyAndVisible];
		
		return YES;
		}  
		
> 스토리보드를 쓸 수 없다면 상단 코드를 참고하면 된다		