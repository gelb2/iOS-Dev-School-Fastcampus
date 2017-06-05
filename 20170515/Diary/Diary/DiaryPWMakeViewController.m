//
//  DiaryPWMakeViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 22..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryPWMakeViewController.h"

@interface DiaryPWMakeViewController ()
<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *userPasscodeTextView;
@property (weak, nonatomic) NSString* userFirstInput;
@property (weak, nonatomic) NSString* userSecondInput;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel1;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel2;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel3;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel4;

@end

@implementation DiaryPWMakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userPasscodeTextView.delegate = self;
    self.userPasscodeTextView.keyboardType = UIKeyboardTypeNumberPad;
    [self.userPasscodeTextView becomeFirstResponder];
    
}

-(void)textViewDidChange:(UITextView *)textView{
    switch (self.userPasscodeTextView.text.length) {
        case 0:
            self.passcodeDotLabel1.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel1.alpha = 1.0f;
            self.passcodeDotLabel2.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel2.alpha = 1.0f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
            break;
        case 1:
            self.passcodeDotLabel1.textColor = [UIColor blackColor];
            self.passcodeDotLabel1.alpha = 0.7f;
            self.passcodeDotLabel2.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel2.alpha = 1.0f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
            break;
        case 2:
            self.passcodeDotLabel1.textColor = [UIColor blackColor];
            self.passcodeDotLabel1.alpha = 0.7f;
            self.passcodeDotLabel2.textColor = [UIColor blackColor];
            self.passcodeDotLabel2.alpha = 0.7f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
            break;
        case 3:
            self.passcodeDotLabel1.textColor = [UIColor blackColor];
            self.passcodeDotLabel1.alpha = 0.7f;
            self.passcodeDotLabel2.textColor = [UIColor blackColor];
            self.passcodeDotLabel2.alpha = 0.7f;
            self.passcodeDotLabel3.textColor = [UIColor blackColor];
            self.passcodeDotLabel3.alpha = 0.7f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
            break;
        case 4:
            self.passcodeDotLabel1.textColor = [UIColor blackColor];
            self.passcodeDotLabel1.alpha = 0.7f;
            self.passcodeDotLabel2.textColor = [UIColor blackColor];
            self.passcodeDotLabel2.alpha = 0.7f;
            self.passcodeDotLabel3.textColor = [UIColor blackColor];
            self.passcodeDotLabel3.alpha = 0.7f;
            self.passcodeDotLabel4.textColor = [UIColor blackColor];
            self.passcodeDotLabel4.alpha = 0.7f;
            break;
        default:
            break;
    }
    
    
    
    if (self.segueConfirmationFloat == 0.0f) {
        if (self.userPasscodeTextView.text.length == 4 && self.userFirstInput == nil && self.userSecondInput == nil) {
            self.userFirstInput = self.userPasscodeTextView.text;
            self.userPasscodeTextView.text = @"";
            self.passcodeDotLabel1.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel1.alpha = 1.0f;
            self.passcodeDotLabel2.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel2.alpha = 1.0f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
        }else if (self.userPasscodeTextView.text.length == 4 && self.userFirstInput != nil && self.userSecondInput == nil){
            self.userSecondInput = self.userPasscodeTextView.text;
            self.userPasscodeTextView.text = @"";
            self.passcodeDotLabel1.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel1.alpha = 1.0f;
            self.passcodeDotLabel2.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel2.alpha = 1.0f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
            if (self.userFirstInput == self.userSecondInput) {
                NSLog(@"첫 번째 입력값과 두 번째 입력값이 같습니다. %@, %@", self.userFirstInput, self.userSecondInput);
                [self.userPasscodeTextView resignFirstResponder];
                [[NSUserDefaults standardUserDefaults] setObject:self.userSecondInput forKey:@"userPasscode"];
                [self performSegueWithIdentifier:@"PWMakeSegue" sender:nil];
            }else if (self.userFirstInput != self.userSecondInput){
                NSLog(@"첫 번째 입력값과 두 번째 입력값이 같지 않습니다. %@, %@", self.userFirstInput, self.userSecondInput);
                self.userFirstInput = nil;
                self.userSecondInput = nil;
                self.userPasscodeTextView.text = @"";
            }
        }
    }else if (self.segueConfirmationFloat == 1.0f){
        if (self.userPasscodeTextView.text.length == 4 && self.userPasscodeTextView.text == [[NSUserDefaults standardUserDefaults] objectForKey:@"userPasscode"]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userPasscode"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"fingerPrintOnOff"];
            [self.userPasscodeTextView resignFirstResponder];
            [self performSegueWithIdentifier:@"PWMakeSegue" sender:nil];
        }else if (self.userPasscodeTextView.text.length == 4 && self.userPasscodeTextView.text != [[NSUserDefaults standardUserDefaults] objectForKey:@"userPasscode"]){
            self.userPasscodeTextView.text = @"";
            self.passcodeDotLabel1.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel1.alpha = 1.0f;
            self.passcodeDotLabel2.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel2.alpha = 1.0f;
            self.passcodeDotLabel3.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel3.alpha = 1.0f;
            self.passcodeDotLabel4.textColor = [UIColor groupTableViewBackgroundColor];
            self.passcodeDotLabel4.alpha = 1.0f;
        }
    }
    
    
    
}
- (IBAction)cancelButtonAction:(UIButton *)sender {
    [self.userPasscodeTextView resignFirstResponder];
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
