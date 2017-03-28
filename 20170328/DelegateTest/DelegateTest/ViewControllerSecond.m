//
//  ViewControllerSecond.m
//  DelegateTest
//
//  Created by ji jun young on 2017. 3. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerSecond.h"

#import "MyDelegate.h"

@interface ViewControllerSecond () <mySampleDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewControllerSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requiredDelegate {
    
}

@end
