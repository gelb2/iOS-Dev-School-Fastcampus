//
//  ViewControllerFirst.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 21..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerFirst.h"
#import "ViewController.h"

@interface ViewControllerFirst ()
<UITextFieldDelegate>

@property UITextField *identification;
@property UITextField *password;
@property UIButton *login;

@end

@implementation ViewControllerFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //아이디,패스워드,로그인 버튼 생성 위한 기본 수치 선언
    
    CGFloat FrameWidth = self.view.frame.size.width;
    CGFloat FrameHeight = self.view.frame.size.height;
    
    const CGFloat MARGIN = 5;
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    offsetX += MARGIN * 4;
    offsetY += MARGIN * 4;
    
    
    //아이디 입력 텍스트필드 생성
    self.identification = [[UITextField alloc]initWithFrame:CGRectMake(offsetX, offsetY, FrameWidth / 2, FrameHeight / 10)];
    self.identification.center = CGPointMake(FrameWidth / 2, FrameHeight / 2 - 100);
    self.identification.font = [UIFont systemFontOfSize:15];
    [self.identification setTextColor:[UIColor blackColor]];
    [self.identification setTextAlignment:NSTextAlignmentCenter];
    [self.identification setBorderStyle:UITextBorderStyleBezel];
    [self.identification setPlaceholder:@"Identification : Jun"];
    self.identification.delegate = self;
    [self.identification setTag:100];
    self.identification.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.identification];
    
//    //테스트...더 필요 없으므로 주석 처리함
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
//    [label setText:@"ViewControllerFirst"];
//    [self.view addSubview:label];
 
    //패스워드 입력 텍스트필드 생성
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(offsetX, offsetY, FrameWidth / 2, FrameHeight / 10)];
    self.password.center = CGPointMake(FrameWidth / 2, FrameHeight / 2);
    [self.password setTextColor:[UIColor blackColor]];
    self.password.font = [UIFont systemFontOfSize:15];
    [self.password setTextAlignment:NSTextAlignmentCenter];
    [self.password setBorderStyle:UITextBorderStyleBezel];
    [self.password setPlaceholder:@"Passcode : Jyjee"];
    self.password.delegate = self;
    self.password.tag = 200;
    [self.view addSubview:self.password];
    
    //로그인버튼 생성
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.login setTitle:@"Login" forState:UIControlStateNormal];
    [self.login setBackgroundColor:[UIColor grayColor]];
    [self.login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.login setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.login setAlpha:0.2];
    [self.login addTarget:self action:@selector(nextView:) forControlEvents:UIControlEventTouchUpInside];
    self.login.frame = CGRectMake(0, 0, 200, 100);
    self.login.center = CGPointMake(FrameWidth / 2, FrameHeight / 2 + 200);
    [self.view addSubview:self.login];
    
    
}

//맞는 아이디와 패스워드를 치면 다른 뷰컨트롤러로 넘어감
- (void)nextView:(UIButton *) sender {
    if ([self.identification.text isEqualToString:@"Jun"] && [self.password.text isEqualToString:@"Jyjee"]) {
        ViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        NSLog(@"id가 일치합니다");
        [self.navigationController pushViewController:View animated:YES];
        
        //뷰 윌 어피어를 통해 네비게이션 바 히든 여부를 구현했으므로 주석처리함
        //한 번 뒤로가기 버튼을 눌렀을 때 네비게이션 바가 사라지게 하는 것은 성공함. 다시 로그인을 했을때 나타나게 하는 것 성공함
//        [self.navigationController setNavigationBarHidden:NO animated:YES];

        
    }
    
}

//뷰가 나타날 때 네비게이션 바가 사라지게 하는 것 성공함.

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (bool)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == 100) {
        [self.password becomeFirstResponder];
    }
    else if (textField.tag == 200) {
        [self.password resignFirstResponder];
        [self.identification resignFirstResponder];
        
    }

return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
