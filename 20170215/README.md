## 20170215

### TableView

* protocol : 테이블뷰는 데이터소스, 델리게이트 프로토콜을 사용함

> “객체 생성과 메소드 호출 같은 것은 ‘시점’이 매우 중요함…만일 view did load가 아닌 view will apperar 같은 엉뚱한 곳에 객체를 생성하고 점검하지 않으면 해당 객체 코드가 몇번 읽히고 실행될 지 알 수 없음…

> 즉, 화면 전환에 있어서, 객체생성과 메소드 호출을 어느 ‘공간과 시점’에서 해야 할 지는 메모리 관리와 유려한 애니메이션을 위해서 굉장히 중요함…이는 뷰 컨트롤, 노티피케이션 등 다른 것들을 다루는데 있어서 공통적인 사항임

* 데이터소스와 델리게이트 : 행위를 하는 것 대신, 결과적으로 데이터 값을 알아야 할 때 사용…

#### UITableView의 스타일 1: UITableViewStylePlain
  - 기본적인 TableView
  - 여러개의 Section을 가질 수 있다.
  - 한개의 Section에는 여러개의 Row를 포함 한다.
  - 각각의 Section에는 Section의 정보를 나타내는 Header와 Footer가 있다.
  - 빠른 검색을 도와주는 index list가 있다.
  - 예: 연락처

#### UITableView의 스타일 2: UITableViewStyleGrouped
  - 각 Section을 Group형태로 나타내는 테이블 뷰
  - 데이터의 디테일한 정보를 표현할때 사용
  - 예: 세팅

<img src = "https://github.com/gelb2/iOS-Dev-School-Fastcampus/blob/master/imageFolder/tableView.png">

<img src = "https://github.com/gelb2/iOS-Dev-School-Fastcampus/blob/master/imageFolder/tableViewDetail.png">

#### DataSource
  - TableView에서 데이터를 관리할 역할
  - 예: Section, Row, Cell, Header, Footer 등등

#### Delegate
  - 프로토콜을 사용한 TableView의 대리자 역할
  - 높이, 헤더와 푸터의 뷰를 제공
  - 셀을 선택했을때 수행할 동작
  - 셀의 삭제 될 때의 동작 관리 등등

#### NSIndexPath
  - 셀의 위치를 나타낼 Data Type으로 Section정보와 Row 정보를 가지고 있다.
  - 셀을 생성할 때  Section x Row 의 수만큼 반복한다.

#### UITableViewCell
  - contentView(textLabel, detailTextLabel, imageView) + accesooryView

#### Cell Style
  - default, subtitle, value1, value2가 있다. 
  
- 테이블뷰 셀 (Frmo Swift 강좌)

<img src = "https://github.com/gelb2/iOS-Dev-School-Fastcampus/blob/master/imageFolder/tableView_SDK_BasicCell_CustomCell.png">

  
#### reuse 와 dequeue
* 공통적인 레이아웃을 사용하여 여러번 화면을 보여줄 필요가 있는 경우 뷰를 재사용한다
* alloc되있는 셀을 identifier를 확인해 dequeue방식으로 재사용 한다
* 만일 dequeue 방식으로 셀을 재사용 하지 않으면 셀이 무한히 생성될 것이다
* 스토리보드에서 테이블뷰와 관련된 작업을 할때 identifier를 간과하면 크래시가 발생하게 된다
* identifier와 reuse 개념은 컬렉션뷰 에서도 활용된다

#### Custom Cell
* 따로 UITableViewCell 이라는 클래스를 만들어서 자기만의 셀을 구현할 수도 있다
* 컬렉션뷰 셀 커스텀하게 만들 수 있다
* initWithStyle 메소드를 오버라이드 하는 방식이 편리하다

> initWithStyle 메소드에서 셀에 들어갈 뷰, 레이블 등을 addsubView, 좌표잡기를 실행할 별도의 메소드가 실행되도록 하는 것  

	- (instancetype)initWithStyle:(UITableViewCellStyle)style
	reuseIdentifier:(NSString *)reuseIdentifier
	{
	    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	    if (self) {
	        [self makingCustomCellObject];
	        [self settingCustomCellObject];
	        //객체를 만들고, 속성을 입력하는 메소드와 위치를 잡아주는 
	        메소드를 따로 생성했다
	    }
	    return self;
	}
	 - (void)makingCustomCellObject{
	//객체를 만드는 메소드
	    
	    UIView *mainView = [[UIView alloc]init];
	    self.mainView = mainView;
	    [self.contentView addSubview:self.mainView];
	    
	    UIImageView *titleImageView = [[UIImageView alloc]init];
	    self.titleImageView = titleImageView;
	    [self.mainView addSubview:self.titleImageView];
	    
	    UIView *titleFooterView = [[UIView alloc]init];
	    self.titleFooterView = titleFooterView;
	    self.titleFooterView.backgroundColor = [UIColor whiteColor];
	    [self.titleFooterView setAlpha:0.7f];
	    [self.titleImageView addSubview:self.titleFooterView];
	    
	    UIImageView *profileImageView = [[UIImageView alloc]init];
	    self.profileImageView = profileImageView;
	    self.profileImageView.layer.cornerRadius = 25;
	    self.profileImageView.layer.masksToBounds = YES;
	    self.profileImageView.clipsToBounds = YES;
	    [self.titleImageView addSubview:self.profileImageView];
		}
		
	- (void)settingCustomCellObject{
	//만든 객체들의 위치를 잡아주는 메소드
    const CGFloat MARGIN = 5.0f;
    
    CGFloat offsetX = 0.0f;
    CGFloat offsetY = 0.0f;
    
    self.mainView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width, 225);
    self.titleImageView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width, 225);
    
    offsetY = (self.titleImageView.frame.size.height / 2) + (MARGIN *10);
    
    self.titleFooterView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width, 65);
    
    offsetX += MARGIN * 2;
    offsetY -= MARGIN * 5;
    
    self.profileImageView.frame = CGRectMake(offsetX, offsetY, 50, 50);
    
    offsetX += (self.profileImageView.frame.size.width + MARGIN * 2);
    offsetY += (self.profileImageView.frame.size.height) / 2 + MARGIN;
    
    self.titleLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX, 20);
    [self.titleLabel sizeToFit];
	}	