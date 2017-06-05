//
//  ViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryViewController.h"
#import "DiaryTableViewCell.h"
#import "DiarySettingViewController.h"
#import "DiaryPostingViewController.h"
#import "DiaryDataCenter.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface DiaryViewController ()
<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *monthView;
@property (weak, nonatomic) IBOutlet UIView *yearView;
@property (weak, nonatomic) UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) UIView *gestureView;


@end

@implementation DiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[DiaryDataCenter sharedInstance] settingPostingMutableArray];
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.monthView.alpha = 0.0f;
    self.yearView.alpha = 0.0f;
    
    NSLog(@"메인 뷰디드로드의 인티저넘버 : %lu", [DiaryDataCenter sharedInstance].integerRow);
    
    if ([[NSUserDefaults standardUserDefaults] floatForKey:@"fingerPrintOnOff"] == 1.0f) {
        NSLog(@"finger auth Activated");
        LAContext *myContext = [[LAContext alloc] init];
        NSError *authError = nil;
        NSString *myLocalizedReasonString = @"Unlock Your Diary";
        
        if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
            [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                      localizedReason:myLocalizedReasonString
                                reply:^(BOOL success, NSError *error) {
                                    if (success) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            NSLog(@"finger success");
                                        });
                                    } else {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self performSegueWithIdentifier:@"keypadSegue" sender:nil];
                                            NSLog(@"invalid Finger");
                                        });
                                    }
                                }];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"finger autherror");
                
            });
        }
    }else if ([[NSUserDefaults standardUserDefaults] objectForKey:@"userPasscode"] != nil && [[NSUserDefaults standardUserDefaults] objectForKey:@"fingerPrintOnOff"] == nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"keypadSegue" sender:nil];
        });
    }
    
    else{
        NSLog(@"finger auth Deactivated");
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.fontSize = [[NSUserDefaults standardUserDefaults] floatForKey:@"fontSize"];
    [self.mainTableView reloadData];
//    
//    NSLog(@"포스팅 어레이 텍스트들 : %@", [DiaryDataCenter sharedInstance].postingMutableArray);
//    
    NSLog(@"메인 뷰윌어피어의 인티저넘버 : %lu", [DiaryDataCenter sharedInstance].integerRow);
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return 31;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [DiaryDataCenter sharedInstance].integerRow = indexPath.row;
    DiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[DiaryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    
    cell.diaryLabel.text = [[DiaryDataCenter sharedInstance].postingMutableArray objectAtIndex:[DiaryDataCenter sharedInstance].integerRow];
//    
//    NSLog(@"테이블뷰 로우 텍스트 : %@", [[DiaryDataCenter sharedInstance].postingMutableArray objectAtIndex:[DiaryDataCenter sharedInstance].integerRow]);
//    
    if (self.fontSize == 0.0f) {
        [cell.diaryLabel setFont:[UIFont systemFontOfSize:13.0f]];
    }else{
    [cell.diaryLabel setFont:[UIFont systemFontOfSize:self.fontSize]];    
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [DiaryDataCenter sharedInstance].integerRow = indexPath.row;
    
    NSLog(@"메인 디드설렉트로우의 인티저넘버 : %lu", [DiaryDataCenter sharedInstance].integerRow);
    
}


- (IBAction)showMonthViewAction:(UIButton *)sender {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen:)];
    self.tapGesture = tapGesture;
    self.tapGesture.delegate = self;
    self.tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.tapGesture];
    
    [UIView animateWithDuration:0.7 animations:^{
    self.monthView.alpha = 1.0f;
    }];
}

- (IBAction)showYearViewAction:(UIButton *)sender {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen:)];
    self.tapGesture = tapGesture;
    self.tapGesture.delegate = self;
    self.tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.tapGesture];
    
    [UIView animateWithDuration:0.7 animations:^{
        self.yearView.alpha = 1.0f;
    }];
    
}

- (void)tapScreen:(UIGestureRecognizer *)sender{
    [self.view removeGestureRecognizer:self.tapGesture];
    if (self.monthView.alpha == 1.0f) {
        [UIView animateWithDuration:0.7 animations:^{
            self.monthView.alpha = 0.0f;
        }];
    }else if (self.yearView.alpha == 1.0f){
        [UIView animateWithDuration:0.7 animations:^{
            self.yearView.alpha = 0.0f;
        }];
    }
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
