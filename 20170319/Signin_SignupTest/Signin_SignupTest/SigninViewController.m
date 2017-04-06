//
//  ViewController.m
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "SigninViewController.h"
#import "NetworkModule.h"
#import "DataCenter.h"
#import "MainViewController.h"
#import "SignupViewController.h"

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwTextField;

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)unwindSegue:(UIStoryboardSegue*)unwindsegue{
    
}

- (IBAction)signinButtonAction:(UIButton *)sender {
    
    [NetworkModule logInwithUsername:self.idTextField.text withPassword:self.pwTextField.text completionBlock:^(BOOL isSuccess, NSDictionary* result) {
        if (isSuccess) {
            NSLog(@"token : %@", [DataCenter sharedInstance].token);
            dispatch_async(dispatch_get_main_queue(), ^{ //이 부분을 메인스레드로 돌려야 하는 이유는?
                MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                [self presentViewController:mainVC animated:YES completion:nil];
            });
        }else{
                NSLog(@"%@", [result objectForKey:@"non_field_errors"]);
            }
    }];
    
}
- (IBAction)signupAction:(id)sender {
    SignupViewController *signupVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    [self presentViewController:signupVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
