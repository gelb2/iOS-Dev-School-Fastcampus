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

@property UIView *bigView;
@property UITextField *identification;
@property UITextField *password;
@property UIButton *login;

@property (nonatomic) UIAlertController *alertcontroller1;


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

    //키보드 올라가고, 내려감에 따라 뷰도 올라가고, 내려가도록 했으나 뒤의 검은화면 보여서 하얀색으로 지정함
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bigView];
    
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
    
    [self.bigView addSubview:self.identification];
    
    
    
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
    
    //패스워드 입력 시 '가려지도록' 프로퍼티 부여
    self.password.secureTextEntry =YES;
    
    self.password.delegate = self;
    self.password.tag = 200;
    [self.bigView addSubview:self.password];
    
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
    [self.bigView addSubview:self.login];
    
    //노티피케이션 센터 메소드를 호출함
    [self addingKeyboardObserver];
    [self addingKeyboardObserver2];
    [self addingIdentificationObserver];
    [self addingPasscodeObserver];
    
    //얼럿 컨트롤러 생성...
    self.alertcontroller1 = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"아이디와 패스코드가 틀립니다" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //확인을 누르면 자동으로 커서가 ID입력 레이블로 가도록 become,resignFirstResponder를 설정함
        [self.identification becomeFirstResponder];
        [self.password resignFirstResponder];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:nil];
    [self.alertcontroller1 addAction:okAction];
    [self.alertcontroller1 addAction:cancelAction];
    
    
}

//맞는 아이디와 패스워드를 치면 다른 뷰컨트롤러로 넘어감...
- (void)nextView:(UIButton *) sender {
    if ([self.identification.text isEqualToString:@"Jun"] && [self.password.text isEqualToString:@"Jyjee"]) {
        ViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        NSLog(@"id가 일치합니다");
        [self.navigationController pushViewController:View animated:YES];
        
        //뷰 윌 어피어를 통해 네비게이션 바 히든 여부를 구현했으므로 주석처리함
        //한 번 뒤로가기 버튼을 눌렀을 때 네비게이션 바가 사라지게 하는 것은 성공함. 다시 로그인을 했을때 나타나게 하는 것 성공함
//        [self.navigationController setNavigationBarHidden:NO animated:YES];

        
    }//아이디와 패스워드가 틀리면 AlertController1이 띄워짐
    else{
        [self presentViewController:self.alertcontroller1 animated:YES completion:nil];
        
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
//        텍스트필드슈드리턴이 활성화 될 시 포스트 되도록 설정함
        [self postTypingIdentification];
    }
    else if (textField.tag == 200) {
        [self.password resignFirstResponder];
        [self.identification resignFirstResponder];
        //        텍스트필드슈드리턴이 활성화 될 시 포스트 되도록 설정함
        [self postTypingPasscode];
        
        
    }

return YES;
}

//노티피케이션 센터 만들어 보기--키보드 올라오면 화면이 자동으로 올라가게 하기
//키보드 올라오는 애니메이션이 부자연 스러운 것은, UIKeyboardDidShowNotification 이 did이기 때문임...will로 설정해야 함
//will로 설정하면 애니메이트 윗 듀레이션을 따로 줄 필요도 없음

- (void)addingKeyboardObserver{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didShowKeyboardNotification:) name:UIKeyboardWillShowNotification object:nil];
    
}

- (void)didShowKeyboardNotification:(NSNotification *)sender{
    
//    테스트를 완료한 로그이므로 주석처리함
//    NSLog(@"키보드노티피케이션 테스트");
    
    CGFloat keyboardHeight = [[sender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    
    [self.bigView setCenter:CGPointMake(self.view.frame.size.width / 2, keyboardHeight - 100)];
    //UIKeyboarddidShowNotification 를 will로 바꾸면 애니메이트 윗 듀레이션은 설정할 필요 없음
//    [UIView animateWithDuration:0.3 animations:^{
//       [self.bigView setCenter:CGPointMake(self.view.frame.size.width / 2, keyboardHeight - 100)];
//    }];
    
    
    
    NSLog(@"%lf", keyboardHeight);
    
}


//////////*노티피케이션 센터 만들어 보기--키보드 내려가면 화면이 자동으로 내려가게 하기*///////////////////
//노티피케이션 센터 만들어 보기--키보드 올라오면 화면이 자동으로 올라가게 하기
//키보드 올라오는 애니메이션이 부자연 스러운 것은, UIKeyboardDidShowNotification 이 did이기 때문임...will로 설정해야 함
//will로 설정하면 애니메이트 윗 듀레이션을 따로 줄 필요도 없음


- (void)addingKeyboardObserver2{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didHideKeyboardNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) didHideKeyboardNotification:(NSNotification *)sender{
    
    
    [self.bigView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
//    로그 테스트 완료했으므로 주석 처리함
//    NSLog(@"키보드노티피케이션2 테스트");
    
    //UIKeyboarddidHideNotification 를 will로 바꾸면 애니메이트 윗 듀레이션은 설정할 필요 없음
//    [UIView animateWithDuration:0.3 animations:^{
//        [self.bigView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
//        
//    }];
    
}

     /////////////////////////* id 텍스트 레이블 누르면 메시지가 나오게 하기* /////////////////
     
- (void)addingIdentificationObserver{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(typingIdentification:) name:@"typingIdentification" object:nil];
    
}

- (void) typingIdentification:(NSNotification *)sender{
    
    NSLog(@"ID를 입력중입니다");
    NSLog(@"%@", sender.userInfo);
    //사용자가 입력한 값을 어떻게 로그로 찍히게 하지?
    
}

- (void) postTypingIdentification{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"typingIdentification" object:nil];
    
}


- (void)addingPasscodeObserver{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(typingPasscode:) name:@"typingPasscode" object:nil];
    
    
}

- (void) typingPasscode:(NSNotification *)sender{
    
    NSLog(@"PW를 입력중입니다");
    NSLog(@"%@", sender.userInfo);
    
}

- (void)postTypingPasscode{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"typingPasscode" object:nil];
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
