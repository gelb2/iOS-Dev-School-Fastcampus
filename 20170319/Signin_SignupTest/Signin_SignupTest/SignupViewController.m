//
//  SignupViewController.m
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "SignupViewController.h"
#import "DataCenter.h"
#import "NetworkModule.h"
#import "MainViewController.h"

@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *password1TF;
@property (weak, nonatomic) IBOutlet UITextField *password2TF;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signupAction:(UIButton *)sender {
    
    NSLog(@"signupWithUsername : %@", self.usernameTF.text);
    NSLog(@"withpassword1 : %@", self.password1TF.text);
    NSLog(@"withpassword2 : %@", self.password2TF.text);
    
    [NetworkModule signupWithUsername:self.usernameTF.text
                        withpassword1:self.password1TF.text
                        withpassword2:self.password2TF.text
                      completionBlock:^(BOOL isSuccess, NSDictionary *result) {
                          
        if(isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);
            NSLog(@"가입성공!");
            dispatch_async(dispatch_get_main_queue(), ^{        // 이 부분 메인 스레드 돌여야 하는 이유?
                
                // dismiss한 후 Login VC viewWillAppear에서 바로 Token 값 nil 체크해서, nil이 아닐시 main VC로 넘어가게 되어있음
                dispatch_async(dispatch_get_main_queue(), ^{ //이 부분을 메인스레드로 돌려야 하는 이유는?
                    MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                    [self presentViewController:mainVC animated:YES completion:nil];
                });

                
                
            });
            
        } else {
//            NSLog(@"%@", result);
            
            
        }
    }];

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
