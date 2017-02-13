//
//  ViewController.m
//  VendingMachine
//
//  Created by ji jun young on 2017. 2. 5..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>
//텍스트뷰 델리게이트 선언은 기존 UIScrollview 델리게이트 선언 뒤에 , 하고 하면 됨

@property NSInteger sum;
@property UILabel *sumLabel;
@property UITextField* id;
@property UITextField* pw;
@property UIScrollView* mainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat viewSizeWidth;
    viewSizeWidth = self. view.frame.size.width;
    CGFloat viewSizeHeight;
    viewSizeHeight = self. view.frame.size.height;
    
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.mainScrollView setContentSize:CGSizeMake(self.mainScrollView.frame.size.width * 2, self.mainScrollView.frame.size.height)];
    [self.mainScrollView setBackgroundColor:[UIColor orangeColor]];
    self.mainScrollView.pagingEnabled = YES;
//    mainScrollView.delegate = self;
    [self.view addSubview:self.mainScrollView];
    
    //스크롤뷰 생성...결과적으로 오른쪽으로 스크롤 시 자판기가 오른쪽에서부터 등장하게 됨
    //self.mainScrollView.scrollEnabled = NO; 를 사용하면 맨 처음 뷰에서 스크롤을 해서 자판기에 갈 수 없음
    
    UIView *scrollViewDecoration = [[UIView alloc] initWithFrame:CGRectMake(0, 444.667, self.view.frame.size.width, self.view.frame.size.height * 1 / 3)];
    [scrollViewDecoration setBackgroundColor:[UIColor whiteColor]];
    [scrollViewDecoration setAlpha:0.3];
    [self.mainScrollView addSubview:scrollViewDecoration];
    
    //스크롤뷰 하단과 다음 자판기 뷰 하단의 색을 맞추기 위한 데코레이션 개념의 뷰 생성
    //색을 맞추는데 데에 있어서 자꾸 문제가 생겨서 알파값을 수동으로 계산, 시연해서 넣어야 했음
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login setTitle:@"Login" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [login setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    login.frame = CGRectMake(0, 0, 200, 100);
    [login setBackgroundColor:[UIColor whiteColor]];
    [login setAlpha:0.2];
    [login addTarget:self action:@selector(moveToVendingMachine:) forControlEvents:UIControlEventTouchUpInside];
    [login setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 120)];
    [self.mainScrollView addSubview:login];
    
    self.id = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    [self.id setCenter:CGPointMake(viewSizeWidth / 2, viewSizeHeight / 3)];
    self.id.font = [UIFont systemFontOfSize:15];
    self.id.textColor = [UIColor whiteColor];
    self.id.textAlignment = NSTextAlignmentCenter;
    self.id.borderStyle = UITextBorderStyleNone;
    self.id.placeholder = @"Name";
    self.id.delegate = self;
    self.id.tag = 100;
    [self.mainScrollView addSubview:self.id];
    
    self.pw = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    [self.pw setCenter:CGPointMake(viewSizeWidth / 2, viewSizeHeight / 3 + 60 + 20)];
    self.pw.font = [UIFont systemFontOfSize:15];
    self.pw.textColor = [UIColor whiteColor];
    self.pw.textAlignment = NSTextAlignmentCenter;
    self.pw.borderStyle = UITextBorderStyleNone;
    self.pw.placeholder = @"Passcode";
    self.pw.delegate = self;
    self.pw.tag = 200;
    [self.mainScrollView addSubview:self.pw];
    
//로그인 버튼 생성, 자판기 화면으로 넘어가도록 메소드 걸어주어야 함
    //또한 id,pw 입력하는 뷰 역시 상단에 만들어 주어야 함
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self.mainScrollView addSubview:mainView];
    
    //루트 뷰 상위의 전체크기 메인 뷰 생성
    
    UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height * 2 / 3)];
    [itemView setCenter:CGPointMake(self.view.frame.size.width / 2, 444.667 / 2)];
    [itemView setBackgroundColor:[UIColor orangeColor]];
//    [itemView setAlpha:0.3];
    [mainView addSubview:itemView];
    
    //자판기 아이템들 총괄할 아이템 뷰 생성
    
    CGFloat itemBoxSize;
    itemBoxSize = self.view.frame.size.width / 4;
    CGFloat itemBoxSize2;
    itemBoxSize2 = self.view.frame.size.height * 2 / 3 / 4;
    
    /*
    UIView *item1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
    [item1 setBackgroundColor:[UIColor grayColor]];
    [item1 setAlpha:0.7];
    [itemView addSubview:item1];
    */
    
    UIButton *item1 = [UIButton buttonWithType:UIButtonTypeCustom];
    item1.frame = CGRectMake(20, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item1 setImage:[UIImage imageNamed:@"thiswarofmine.jpg"] forState:UIControlStateNormal];
    item1.layer.backgroundColor = [UIColor blackColor].CGColor;
    item1.layer.borderWidth     = 2;
    [item1 addTarget:self action:@selector(removeMoneyInput1:) forControlEvents:UIControlEventTouchUpInside];
    [item1 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item1];
    
//    UIView *item2 = [[UIView alloc] initWithFrame:CGRectMake(itemBoxSize + 20 + 30, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item2 setBackgroundColor:[UIColor grayColor]];
//    [item2 setAlpha:0.7];
//    [itemView addSubview:item2];
//

    UIButton *item2 = [UIButton buttonWithType:UIButtonTypeCustom];
    item2.frame = CGRectMake(itemBoxSize + 20 + 30, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item2 setImage:[UIImage imageNamed:@"shadowgun.jpg"] forState:UIControlStateNormal];
    item2.layer.backgroundColor = [UIColor blackColor].CGColor;
    item2.layer.borderWidth     = 2;
    [item2 addTarget:self action:@selector(removeMoneyInput2:) forControlEvents:UIControlEventTouchUpInside];
    [item2 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item2];
    
//    UIView *item3 = [[UIView alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item3 setBackgroundColor:[UIColor grayColor]];
//    [item3 setAlpha:0.7];
//    [itemView addSubview:item3];

    UIButton *item3 = [UIButton buttonWithType:UIButtonTypeCustom];
    item3.frame = CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item3 setImage:[UIImage imageNamed:@"implosion.png"] forState:UIControlStateNormal];
    item3.layer.backgroundColor = [UIColor blackColor].CGColor;
    item3.layer.borderWidth     = 2;
    [item3 addTarget:self action:@selector(removeMoneyInput3:) forControlEvents:UIControlEventTouchUpInside];
    [item3 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item3];
    
//    UIView *item4 = [[UIView alloc] initWithFrame:CGRectMake(20, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item4 setBackgroundColor:[UIColor grayColor]];
//    [item4 setAlpha:0.7];
//    [itemView addSubview:item4];

    UIButton *item4 = [UIButton buttonWithType:UIButtonTypeCustom];
    item4.frame = CGRectMake(20, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item4 setImage:[UIImage imageNamed:@"monumentvalley.jpg"] forState:UIControlStateNormal];
    item4.layer.backgroundColor = [UIColor blackColor].CGColor;
    item4.layer.borderWidth     = 2;
    [item4 addTarget:self action:@selector(removeMoneyInput4:) forControlEvents:UIControlEventTouchUpInside];
    [item4 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item4];
    
//    UIView *item5 = [[UIView alloc] initWithFrame:CGRectMake(itemBoxSize + 20 + 30, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item5 setBackgroundColor:[UIColor grayColor]];
//    [item5 setAlpha:0.7];
//    [itemView addSubview:item5];
    
    UIButton *item5 = [UIButton buttonWithType:UIButtonTypeCustom];
    item5.frame = CGRectMake(itemBoxSize + 20 + 30, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item5 setImage:[UIImage imageNamed:@"transistor.png"] forState:UIControlStateNormal];
    [item5.imageView setContentMode:UIViewContentModeScaleToFill];
    item5.layer.backgroundColor = [UIColor blackColor].CGColor;
    item5.layer.borderWidth     = 2;
    [item5 addTarget:self action:@selector(removeMoneyInput5:) forControlEvents:UIControlEventTouchUpInside];
    [item5 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item5];

    
//    UIView *item6 = [[UIView alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item6 setBackgroundColor:[UIColor grayColor]];
//    [item6 setAlpha:0.7];
//    [itemView addSubview:item6];
    
    UIButton *item6 = [UIButton buttonWithType:UIButtonTypeCustom];
    item6.frame = CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item6 setImage:[UIImage imageNamed:@"abyssrium.jpg"] forState:UIControlStateNormal];
    item6.layer.backgroundColor = [UIColor blackColor].CGColor;
    item6.layer.borderWidth     = 2;
    [item6 addTarget:self action:@selector(removeMoneyInput6:) forControlEvents:UIControlEventTouchUpInside];
    [item6 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item6];
    
//    UIView *item7 = [[UIView alloc] initWithFrame:CGRectMake(20, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item7 setBackgroundColor:[UIColor grayColor]];
//    [item7 setAlpha:0.7];
//    [itemView addSubview:item7];
//
    
    UIButton *item7 = [UIButton buttonWithType:UIButtonTypeCustom];
    item7.frame = CGRectMake(20, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item7 setImage:[UIImage imageNamed:@"bastion.jpg"] forState:UIControlStateNormal];
    item7.layer.backgroundColor = [UIColor blackColor].CGColor;
    item7.layer.borderWidth     = 2;
    [item7 addTarget:self action:@selector(removeMoneyInput7:) forControlEvents:UIControlEventTouchUpInside];
    [item7 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item7];
    
//    UIView *item8 = [[UIView alloc] initWithFrame:CGRectMake(itemBoxSize + 20 + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item8 setBackgroundColor:[UIColor grayColor]];
//    [item8 setAlpha:0.7];
//    [itemView addSubview:item8];
    
    UIButton *item8 = [UIButton buttonWithType:UIButtonTypeCustom];
    item8.frame = CGRectMake(itemBoxSize + 20 + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item8 setImage:[UIImage imageNamed:@"infinityblade.jpg"] forState:UIControlStateNormal];
    [item8.imageView setContentMode:UIViewContentModeScaleAspectFill];
    item8.layer.backgroundColor = [UIColor blackColor].CGColor;
    item8.layer.borderWidth     = 2;
    [item8 addTarget:self action:@selector(removeMoneyInput8:) forControlEvents:UIControlEventTouchUpInside];
    [item8 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item8];
    
//    UIView *item9 = [[UIView alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4)];
//    [item9 setBackgroundColor:[UIColor grayColor]];
//    [item9 setAlpha:0.7];
//    [itemView addSubview:item9];
    
    UIButton *item9 = [UIButton buttonWithType:UIButtonTypeCustom];
    item9.frame = CGRectMake(20 + itemBoxSize + 30+ itemBoxSize +30, 20 + itemBoxSize2 + 20 + itemBoxSize2 + 20, self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 3 / 4);
    [item9 setImage:[UIImage imageNamed:@"prune.jpg"] forState:UIControlStateNormal];
    item9.layer.backgroundColor = [UIColor blackColor].CGColor;
    item9.layer.borderWidth     = 2;
    [item9 addTarget:self action:@selector(removeMoneyInput9:) forControlEvents:UIControlEventTouchUpInside];
    [item9 addTarget:self action:@selector(insuffiientMoney) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:item9];

    
    //총 9개의 자판기 아이템 뷰 생성했다가, 그냥 자체 버튼으로 만드는 것이 더 낫다는 어드바이스를 받음
    //따라서 기존 자판기 아이템 뷰 코드에서, 좌표 부분만 가져다가 9개 버튼을 다시 만듬...
    // 구매 액수가 0과 같거나 작아질 시, "잔액이 부족합니다" 띄우도록 self.sumLabel.text = [NSString stringWithFormat:@" "]을 작성함...작성한 메소드는 각 아이템 버튼에 추가로 연동함
    
    UILabel *itemLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel1 setText:@"15$"];
    [itemLabel1 setTextColor:[UIColor blackColor]];
    [itemLabel1 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel1];
    
    UILabel *itemLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30, 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel2 setText:@"10$"];
    [itemLabel2 setTextColor:[UIColor blackColor]];
    [itemLabel2 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel2];
    
    UILabel *itemLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize+ 30 + itemBoxSize + 30, 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel3 setText:@"8$"];
    [itemLabel3 setTextColor:[UIColor blackColor]];
    [itemLabel3 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel3];
    
    UILabel *itemLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + itemBoxSize2 + 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel4 setText:@"6$"];
    [itemLabel4 setTextColor:[UIColor blackColor]];
    [itemLabel4 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel4];
    
    UILabel *itemLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel5 setText:@"7$"];
    [itemLabel5 setTextColor:[UIColor blackColor]];
    [itemLabel5 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel5];
    
    UILabel *itemLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize+ 30 + itemBoxSize + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel6 setText:@"12$"];
    [itemLabel6 setTextColor:[UIColor blackColor]];
    [itemLabel6 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel6];
    
    UILabel *itemLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + itemBoxSize2 + 20 + itemBoxSize2 +20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel7 setText:@"3$"];
    [itemLabel7 setTextColor:[UIColor blackColor]];
    [itemLabel7 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel7];
    
    UILabel *itemLabel8 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2 +20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel8 setText:@"4$"];
    [itemLabel8 setTextColor:[UIColor blackColor]];
    [itemLabel8 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel8];
    
    UILabel *itemLabel9 = [[UILabel alloc] initWithFrame:CGRectMake(20 + itemBoxSize+ 30 + itemBoxSize + 30, 20 + itemBoxSize2 + 20 + itemBoxSize2 +20 + itemBoxSize2, itemBoxSize, 20)];
    [itemLabel9 setText:@"8$"];
    [itemLabel9 setTextColor:[UIColor blackColor]];
    [itemLabel9 setTextAlignment:NSTextAlignmentCenter];
    [itemView addSubview:itemLabel9];
    
    //9개의 아이템 별로 가격 라벨 만듬
    
    
    UIView *calculationView = [[UIView alloc] initWithFrame:CGRectMake(0, 444.667, self.view.frame.size.width, self.view.frame.size.height * 1 / 3)];
    [calculationView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - (444.667/4))];
    [calculationView setBackgroundColor:[UIColor orangeColor]];
    [calculationView setAlpha:0.7];
    [mainView addSubview:calculationView];
    
    //아이템 가격 총합 뷰, 사용자 입력 금액 계산 뷰 총괄 위한 계산 뷰 생성
    
    UIView *sumView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 20 - 20, 80)];
    [sumView setBackgroundColor:[UIColor whiteColor]];
    [sumView setAlpha:0.2];
    [calculationView addSubview:sumView];
    
    self.sumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sumView.frame.size.width, sumView.frame.size.height)];
    
    //아이템 가격 총합 뷰 생성...
    
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld", self.sum];
    [self.sumLabel setTextAlignment:NSTextAlignmentCenter];
    [sumView addSubview:self.sumLabel];
    //선언된 sumlabel에 프로퍼티 값을 넣어줌...아무곳에서 라벨 값을 바꾸기 위해서...

    
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(20, 20 + 60 + 20 + 20, self.view.frame.size.width - 20 - 20, 60)];
    [inputView setBackgroundColor:[UIColor whiteColor]];
    [inputView setAlpha:1];
    [calculationView addSubview:inputView];
    
    //사용자 입력 금액 계산 뷰 총괄 위한 계산 뷰 생성...10$, 5$, 1$, 0.25$ 버튼 뷰 혹은 버튼 생성 필요
    //아이템 들 뷰 9개를 버튼으로 만들어도 된다
    
    CGFloat moneyInputBoxWidth = (self.view.frame.size.width - 20 - 20) / 4;
    CGFloat moneyInputBoxHeight = 60;
    
    UIButton *moneyInput1 = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyInput1.frame = CGRectMake(0, 0, moneyInputBoxWidth, moneyInputBoxHeight);
    [moneyInput1 setTitle:@"10$" forState:UIControlStateNormal];
    [moneyInput1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moneyInput1 setBackgroundColor:[UIColor orangeColor]];
    [moneyInput1 setTitle:@"충전하기" forState:UIControlStateHighlighted];
    [moneyInput1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [moneyInput1 addTarget:self action:@selector(putMoneyInput1:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:moneyInput1];
    
    UIButton *moneyInput2 = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyInput2. frame = CGRectMake(moneyInputBoxWidth, 0, moneyInputBoxWidth, moneyInputBoxHeight);
    [moneyInput2 setTitle:@"5$" forState:UIControlStateNormal];
    [moneyInput2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moneyInput2 setBackgroundColor:[UIColor orangeColor]];
    [moneyInput2 setTitle:@"충전하기" forState:UIControlStateHighlighted];
    [moneyInput2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [moneyInput2 addTarget:self action:@selector(putMoneyInput2:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:moneyInput2];
        
    UIButton *moneyInput3 = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyInput3. frame = CGRectMake(moneyInputBoxWidth + moneyInputBoxWidth, 0, moneyInputBoxWidth, moneyInputBoxHeight);
    [moneyInput3 setTitle:@"2$" forState:UIControlStateNormal];
    [moneyInput3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moneyInput3 setBackgroundColor:[UIColor orangeColor]];
    [moneyInput3 setTitle:@"충전하기" forState:UIControlStateHighlighted];
    [moneyInput3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [moneyInput3 addTarget:self action:@selector(putMoneyInput3:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:moneyInput3];
    
    UIButton *moneyInput4 = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyInput4. frame = CGRectMake(moneyInputBoxWidth + moneyInputBoxWidth + moneyInputBoxWidth, 0, moneyInputBoxWidth, moneyInputBoxHeight);
    [moneyInput4 setTitle:@"1$" forState:UIControlStateNormal];
    [moneyInput4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moneyInput4 setBackgroundColor:[UIColor orangeColor]];
    [moneyInput4 setTitle:@"충전하기" forState:UIControlStateHighlighted];
    [moneyInput4 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [moneyInput4 addTarget:self action:@selector(putMoneyInput4:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:moneyInput4];
    
    //사용자 입력 금액 버튼 4개 생성...10$, 5$, 2$, 1$
    
    
}

- (void) putMoneyInput1:(UIButton *) sender {
    
    self.sum          += 10;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) putMoneyInput2:(UIButton *) sender {
    
    self.sum += 5;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
    
}

- (void) putMoneyInput3:(UIButton *) sender {
    self.sum += 2;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
    
}

- (void) putMoneyInput4:(UIButton *) sender {
    self.sum += 1;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
    
}

// 사용자 금액 충전 버튼 해당 메소드 4개 생성

- (void) removeMoneyInput1:(UIButton *) sender {
    
    self.sum          -= 15;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput2:(UIButton *) sender {
    
    self.sum          -= 10;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput3:(UIButton *) sender {
    
    self.sum          -= 8;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput4:(UIButton *) sender {
    
    self.sum          -= 6;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput5:(UIButton *) sender {
    
    self.sum          -= 7;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput6:(UIButton *) sender {
    
    self.sum          -= 12;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput7:(UIButton *) sender {
    
    self.sum          -= 3;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput8:(UIButton *) sender {
    
    self.sum          -= 4;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) removeMoneyInput9:(UIButton *) sender {
    
    self.sum          -= 8;
    self.sumLabel.text = [NSString stringWithFormat:@"잔액 : %ld$", self.sum];
}

- (void) insuffiientMoney{
    if (self.sum <= 0) {
        self.sumLabel.text = [NSString stringWithFormat:@"잔액이 부족합니다"];
        self.sum = 0;
    }

    
}

// 사용자 구매 버튼 해당 메소드 9개 생성
// 구매 액수가 0과 같거나 작아질 시, "잔액이 부족합니다" 띄우도록 self.sumLabel.text = [NSString stringWithFormat:@"잔액이 부족합니다."]을 작성함...작성한 메소드는 각 아이템 버튼에 추가로 연동함

//과제: 자판기 만들기
//UI디자인...루트 뷰 - 메인 뷰 / 아이템 메인 뷰 - 아이템 개별 뷰 / 계산 메인 뷰 - 계산 뷰, 금액 입력 뷰, 얻기 뷰
//라벨디자인...금액 라벨 == 제품 가격 == -값 / 계산 라벨 == 금액라벨과 금액입력 라벨의 계산 / 금액입력 라벨 == 돈 액수 == +값


//


- (void) moveToVendingMachine:(UIButton *) sender {
    if ([self.id.text isEqualToString:@"jun"] && [self.pw.text isEqualToString:@"jyjee"]) {
        [self.mainScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
    }
   
    
}

//UITextField* id; 부분을 참조하여, 로그인 버튼을 눌렀을 시 id와 pw 값을 확인, 해당 인자가 맞으면 다음 뷰로 넘어가도록 설정함

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField { //키보드에서 리턴 버튼이 눌렸을 때 실행됨
    if (textField.tag == 100) { //ID텍스트필드를 수정중이었을 때
        [self.pw becomeFirstResponder]; //비번 텍스트필드를 퍼스트 리스폰더로 만듦
    } else if (textField.tag == 200) { //비번 텍스트필드를 수정중이었을 때
        [textField resignFirstResponder]; //비번 텍스트필드를 퍼스트 리스폰더에서 해제시킴
        if ([self.id.text isEqualToString:@"jun"] && [self.pw.text isEqualToString:@"jyjee"]) {
            [self.mainScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
        }
        
    }
    //텍스트필드에서 자판 자동으로 내려가기, id와 pw 값을 확인, 해당 인자가 맞으면 다음 뷰로 넘어가도록 설정함
    
    return YES;
}


@end
