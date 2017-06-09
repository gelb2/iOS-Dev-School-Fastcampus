//
//  ViewControllerSecond.m
//  NavigationController
//
//  Created by ji jun young on 2017. 2. 20..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerSecond.h"

@interface ViewControllerSecond ()
<UITextFieldDelegate>

@property NSInteger sum;
@property UILabel *sumLabel;
@property UITextField* id;
@property UITextField* pw;
@property UIScrollView* mainScrollView;


@end

@implementation ViewControllerSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat viewSizeWidth;
    viewSizeWidth = self. view.frame.size.width;
    CGFloat viewSizeHeight;
    viewSizeHeight = self. view.frame.size.height;
    
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.mainScrollView setContentSize:CGSizeMake(self.mainScrollView.frame.size.width * 2, self.mainScrollView.frame.size.height)];
    [self.mainScrollView setBackgroundColor:[UIColor orangeColor]];
    self.mainScrollView.pagingEnabled = YES;
    //    mainScrollView.delegate = self;
    self.mainScrollView.scrollEnabled = NO;
    [self.view addSubview:self.mainScrollView];
    
    UIView *scrollViewDecoration = [[UIView alloc] initWithFrame:CGRectMake(0, 444.667, self.view.frame.size.width, self.view.frame.size.height * 1 / 3)];
    [scrollViewDecoration setBackgroundColor:[UIColor whiteColor]];
    [scrollViewDecoration setAlpha:0.3];
    [self.mainScrollView addSubview:scrollViewDecoration];
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login setTitle:@"Sign Up" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [login setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    login.frame = CGRectMake(0, 0, 200, 100);
    [login setBackgroundColor:[UIColor whiteColor]];
    [login setAlpha:0.2];
    [login setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 120)];
    [self.mainScrollView addSubview:login];
    
    self.id = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    [self.id setCenter:CGPointMake(viewSizeWidth / 2, viewSizeHeight / 3)];
    self.id.font = [UIFont systemFontOfSize:15];
    self.id.textColor = [UIColor whiteColor];
    self.id.textAlignment = NSTextAlignmentCenter;
    self.id.borderStyle = UITextBorderStyleNone;
    self.id.placeholder = @"Put New ID";
    self.id.delegate = self;
    self.id.tag = 100;
    [self.mainScrollView addSubview:self.id];
    
    self.pw = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    [self.pw setCenter:CGPointMake(viewSizeWidth / 2, viewSizeHeight / 3 + 60 + 20)];
    self.pw.font = [UIFont systemFontOfSize:15];
    self.pw.textColor = [UIColor whiteColor];
    self.pw.textAlignment = NSTextAlignmentCenter;
    self.pw.borderStyle = UITextBorderStyleNone;
    self.pw.placeholder = @"Put New Passcode";
    self.pw.delegate = self;
    self.pw.tag = 200;
    [self.mainScrollView addSubview:self.pw];
    
    
    
    
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
