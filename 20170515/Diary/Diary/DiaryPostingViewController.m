//
//  DiaryPostingViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryPostingViewController.h"
#import "DiaryDataCenter.h"
#import "DiaryViewController.h"

@interface DiaryPostingViewController ()
<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITextView *postingTextView;




@end

@implementation DiaryPostingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.titleLabel.text = [presentDa]
//    
//    NSLocale* currentLocale = [NSLocale currentLocale];
//    [[NSDate date] descriptionWithLocale:currentLocale];
//    or use
//    
//    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
//    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy / MM / dd"];
//    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    self.titleLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    
    
//    NSLog(@" 포스팅 뷰디드로드의 데이터센터 텍스트 : %@", [DiaryDataCenter sharedInstance].postingMutableArray);
    NSLog(@"포스팅 뷰디드로드의 인티저넘버 : %lu", [DiaryDataCenter sharedInstance].integerRow);
    //이건 왜 값이 지 맘대로 달라지지?
//    self.postingTextView.text = [[DiaryDataCenter sharedInstance].postingMutableArray objectAtIndex:[DiaryDataCenter sharedInstance].integerRow];
    
    
    [self.postingTextView isFirstResponder];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"포스팅 뷰윌어피어의 인티저넘버 : %lu", [DiaryDataCenter sharedInstance].integerRow);
    self.postingTextView.text = [[DiaryDataCenter sharedInstance].postingMutableArray objectAtIndex:[DiaryDataCenter sharedInstance].integerRow];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"postingDoneSegue"]) {
        [self.postingTextView resignFirstResponder];
        [[DiaryDataCenter sharedInstance].postingMutableArray replaceObjectAtIndex:[DiaryDataCenter sharedInstance].integerRow withObject:self.postingTextView.text];
        
        
        
    }
    
    
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
