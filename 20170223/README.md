## 20170220

## 싱글턴, NSUserDefault, Notification

### 싱글턴 패턴 객체 만들기

		@implementation DataCenter

		+ (instancetype)sharedInstance{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    
    //데이터센터 객체 안에는 한 개의 값만 들어간다
    
    return dataCenter;
		}


### 싱글턴이란. 
* 애플리케이션 전 영역에 걸쳐 하나의 클래스의, 단 하나의 인스턴스만을 생성하는 것
* 애플리케이션 내부에서 유일하게 하나만 필요한 객체에서 활용(세팅, 데이터 등)
* 클래스 메소드로 객체를 만들어 static을 이용해 단 한개의 인스턴스만 만듬
* 앱 내에서 공유하는 객체를 만들 수 있음

> 기본개념

> * 단 하나의 객체만 존재
> * 객체는 전역객체

### 싱글턴 패턴의 예시 

* 스크린 정보를 가지고 있는 객체 `UIScreen *screen = [UIScreen mainScreen];`
* 사용자 정보를 저장하는 객체 `NSUserDefaults *data = [NSUserDefaults standardUserDefaults];`
* 애플리케이션 객체 `UIApplication *app = [UIApplication sharedApplication]`
* 파일 시스템 정보를 가지고 있는 객체 `NSFileManager *fileManager = [NSFileManager defaultManager]`

[싱글턴 방식을 활용해 본 카카오톡 UI 자습]

### NSUserDefaults
* 사용자의 정보를 저장하는 싱글턴 객체
* 간단한 사용자 정보를 저장 / 불러오기가 가능하게 만든 객체
* 내부적으로 Plist 데이터에 저장되어 보안이 강하지 않음

> 아이폰의 데이터 저장방법
> 
* > 아이클라우드
> * 코어데이터..."내부 데이터 DB"

		+ (NSUserDefaults *)standardUserDefaults;
		- (nullable id)objectForKey:(NSString*)defaultName;
		//데이터 불러오기
		- (void)setObject:(nullable id)value forKey:
		(NSString*)defaultName;
		//데이터 저장하기
		- (void)removeObjectForKey:(NSString*)defaultName
		//데이터 지우기

		[[NSUserDefaults standardUserDefaults] setObject:@"jun" forKey:@"name"];
		//데이터 저장
		NSString *nameData = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
		//데이터 불러오기
		
		
### NSNotificationCenter

  - 특정 이벤트가 발생하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스
  - 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 관찰자(Observer)로 등록을 해두면 노티피케이션 센터가 모든 관찰자 객체에게 알림을 준다.
  - 페이스북에서 친구를 등록해두면 친구의 이벤트가 내 뉴스피드나 알림으로 오는것과 같은 이치
  - 데이터를 공유 하고 있을때 데이터가 변경됨에 따라 데이터를 공유하는 객체들이 알림을 받을때 사용 할수도 있고 배터리 부족에 따른 처리를 해줄 수도 있다.

#### NSNotification 구조
* 객체 A가 노티피케이션 센터에 자신이 노티피케이션을 받을 것이라고 등록(addObserver)
* 객체 B가 필요한 시점에 노티피케이션 송출(postNotification)

#### 노티피케이션 센터를 활용하여 키보드 움직임 제어한 예시

		@implementation GOQAViewController
		- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addingKeyboardObserverShow];
    [self addingKeyboardObserverHide];
    
		}
		
		

		- (void)didShowKeyboardNotification:(NSNotification *)sender{
    
    CGFloat keyboardHeight = [[sender.userInfo 
    objectForKey:UIKeyboardFrameBeginUserInfoKey] 
    CGRectValue].size.height;
    
    [self.QAInputTextFieldView setCenter:CGPointMake(self.view.frame.size.width / 2, 
    self.view.frame.size.height - keyboardHeight - 
    (self.QAInputTextFieldView.frame.size.height / 2))];
    }

	
	- (void) didHideKeyboardNotification:(NSNotification 
	*)sender{
    
    [self.QAInputTextFieldView setCenter:
    CGPointMake(self.view.frame.size.width / 2, 
    self.view.frame.size.height - 
    (self.QAInputTextFieldView.frame.size.height / 2))];
	}
	
	- (void)addingKeyboardObserverShow{
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
    selector:@selector(didShowKeyboardNotification:) 
    name:UIKeyboardWillShowNotification object:nil];
    
	}

	- (void)addingKeyboardObserverHide{
    [[NSNotificationCenter defaultCenter] addObserver:self 
    selector:@selector(didHideKeyboardNotification:) 
    name:UIKeyboardWillHideNotification object:nil];
	}


	- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] 
    removeObserver:self];
		//노티피케이션 센터는 반드시 remove 과정을 수행해 줘야 함 
	}


		
		



[싱글턴 방식을 활용해 본 카카오톡 UI 자습]: <https://github.com/gelb2/iOS-Dev-School-Fastcampus/tree/master/20170227/DataCenter_KakaoTalkSettingView>
		