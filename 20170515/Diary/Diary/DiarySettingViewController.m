//
//  DiarySettingViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiarySettingViewController.h"
#import "DiaryViewController.h"
#import "DiaryPWMakeViewController.h"


@interface DiarySettingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fontSize13Button;
@property (weak, nonatomic) IBOutlet UIButton *fontSize15Button;
@property (weak, nonatomic) IBOutlet UIButton *fontSize17Button;
@property (weak, nonatomic) IBOutlet UIButton *fontSize19Button;
@property (weak, nonatomic) IBOutlet UIButton *fontSize21Button;

@property (nonatomic) CGFloat fontSize;

@end

@implementation DiarySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"settingSegue"]) {
        DiaryViewController *dvc = (DiaryViewController*)segue.destinationViewController;
        dvc.fontSize = self.fontSize;
        [[NSUserDefaults standardUserDefaults] setFloat:self.fontSize forKey:@"fontSize"];
    }
    
    if ([segue.identifier isEqualToString:@"passcodeOn"]) {
        DiaryPWMakeViewController *dpvc = (DiaryPWMakeViewController*)segue.destinationViewController;
        dpvc.segueConfirmationFloat = 0.0f;
    }else if ([segue.identifier isEqualToString:@"passcodeOff"]){
        DiaryPWMakeViewController *dpvc = (DiaryPWMakeViewController*)segue.destinationViewController;
        dpvc.segueConfirmationFloat = 1.0f;
    }
    
    
}
- (IBAction)fontSize13Action:(UIButton *)sender {
    self.fontSize = 13.0f;
    
}
- (IBAction)fontSize15Action:(UIButton *)sender {
    self.fontSize = 15.0f;
}
- (IBAction)fontSize17Action:(UIButton *)sender {
    self.fontSize = 17.0f;
}
- (IBAction)fontSize19Action:(UIButton *)sender {
    self.fontSize = 19.0f;
}
- (IBAction)fontSize21Action:(UIButton *)sender {
    self.fontSize = 21.0f;
}

- (IBAction)fingerPrintOnAction:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:1.0f forKey:@"fingerPrintOnOff"];
    
}
- (IBAction)fingerPrintOffAction:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"fingerPrintOnOff"];

}

-(IBAction)unwindSegue:(UIStoryboardSegue*)sender{
    
    
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
