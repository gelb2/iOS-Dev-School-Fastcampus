//
//  MainViewController.m
//  Signin_SignupTest
//
//  Created by ji jun young on 2017. 4. 6..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "MainViewController.h"
#import "NetworkModule.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)logoutAction:(UIButton *)sender {
    [NetworkModule logOutWithCompletionBlock:^(BOOL isSuccess, NSDictionary *result) {
        if (isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
        }else{
            NSLog(@"%@", [result objectForKey:@"non_field_errors"]);
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
