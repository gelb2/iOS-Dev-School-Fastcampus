//
//  ViewController.m
//  ViewTest
//
//  Created by ji jun young on 2017. 2. 3..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
//    
//    [myView setBackgroundColor:[UIColor redColor]];
//    
//    [myView setAlpha:0.2];
//    
//    [self.view addSubview:myView];

//20170203테스트 차원으로 맨 처음 만들어 본 UI코드
    
//    UIView *myView1 = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 375 - 30 , 667 - 30)];
//    [myView1 setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:myView1];
//    
//    UIView *myView2 = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 375 - 60, 667 - 60)];
//    [myView2 setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:myView2];
//    
//    UIView *myView3 = [[UIView alloc]initWithFrame:CGRectMake(45, 45, 375 - 90, 667 - 90)];
//    [myView3 setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:myView3];
//    
//    //20170203 예제 1, 각 뷰의 상하좌우 여백은 15, 계층구조로 3개 뷰 만들기
//    
//    UIView *myview4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 64)];
//    [myview4 setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:myview4];
//    
//    UIView *myview5 = [[UIView alloc]initWithFrame:CGRectMake(0, 667 - 48, 375, 48)];
//    [myview5 setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:myview5];
//    
//    //20170203 예제 2, 상하여백이 각각 64, 48포인트인 뷰 만들기
//    

    
    //UIColor colorWithRed
    
//
//        UIView *myView0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100 , 100)];
//        [myView0 setCenter:CGPointMake(self.view.center.x, self.view.center.y)];
//        [myView0 setBackgroundColor:[UIColor redColor]];
//        [self.view addSubview:myView0];
//    
//        UIView *myView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90 , 10)];
//        [myView1 setBackgroundColor:[UIColor blueColor]];
//        [myView0 addSubview:myView1];
//
//    UIView *myView2 = [[UIView alloc] initWithFrame:CGRectMake(90, 0, 10 , 90)];
//    [myView2 setBackgroundColor:[UIColor yellowColor]];
//    [myView0 addSubview:myView2];
//    
//    UIView *myView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, 90 , 10)];
//    [myView3 setBackgroundColor:[UIColor blackColor]];
//    [myView0 addSubview:myView3];
//    
//    UIView *myView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10 , 90)];
//    [myView4 setBackgroundColor:[UIColor orangeColor]];
//    [myView0 addSubview:myView4];
//    
    //20170203 예제 3 가로 90, 세로 10인 뷰 4개, 가운데 센터를 비운 상태로 냅두고, 액자 틀 같이 만들 것
    //375 - 100 = 275
    //667 - 100 = 567
    //275 / 2 = 137.5
    // 567 / 2 = 283.5
    //375 / 2 = 187.5
    //667 / 2 = 333.5
    //사실 setCenter를 응용하는 것이 나은 선택이었음...
    //self.view.frame.size.height ---> 는 내 클래스의 생성된 객체(self)의 view 속의 frame 속의, size 속의 height가 얼마인지를 묻는 것임...따라서 해당 클래스의 폭인 375를 컴파일러가 자동으로 찾아줌
    //[~~ addSubview: ㅁㅁ]는 ㅁㅁ를 ~~에 속하는 뷰로 하겠다는 것을 의미
    
    CGFloat margin = 10;
    CGFloat offsetX = margin;
    CGFloat offsetY = margin;
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 80)];
    baseView.layer.borderColor = [UIColor grayColor].CGColor;
    baseView.layer.borderWidth = 1;
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    UIView *profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 60, 60)];
    profileImage.layer.borderColor = [UIColor grayColor].CGColor;
    profileImage.layer.borderWidth = 1;
    profileImage.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:profileImage];
    
    UIView *profileIntroduction = [[UIImageView alloc] initWithFrame:CGRectMake(60 + (offsetX * 2), offsetY, baseView.frame.size.width - 10 - 60 - 10 - 10, 40)];
    profileIntroduction.layer.borderColor = [UIColor grayColor].CGColor;
    profileIntroduction.layer.borderWidth = 1;
    profileIntroduction.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:profileIntroduction];
    
    UIView *profileFewIntroduction = [[UIImageView alloc] initWithFrame:CGRectMake(60 + (offsetX * 2), offsetY + offsetY +40, baseView.frame.size.width - 10 - 60 - 10 - 10, 10)];
    profileFewIntroduction.layer.borderColor = [UIColor grayColor].CGColor;
    profileFewIntroduction.layer.borderWidth = 1;
    profileFewIntroduction.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:profileFewIntroduction];
    
    
    
    //각 뷰 간의 여백은 10, 60 60의 정사각형 80 view.width의 직사각형 40 view.width - 10 - 60 - 10 -10 직사각형
    //view.width - 10 - 60 - 10 -10 10의 직사각형
    
    //아직 진행중임
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(175, 150, 100, 100);
    [testBtn setTitle:@"눌러봐" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [testBtn setTitle:@"그만눌러" forState:UIControlStateHighlighted];
    [testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [testBtn addTarget:self action:@selector(didSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
     
     }
    
- (void) didSelectedBtn:(UIButton *)sender{
    NSLog(@"버튼을 눌렀습니다");
    }

//버튼 만들기

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
