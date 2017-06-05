//
//  DiaryKeypadViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 20..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryKeypadViewController.h"

@interface DiaryKeypadViewController ()
<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *userPasscodeTextView;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel1;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel2;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel3;
@property (weak, nonatomic) IBOutlet UILabel *passcodeDotLabel4;

@end

@implementation DiaryKeypadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userPasscodeTextView.delegate = self;
    self.userPasscodeTextView.keyboardType = UIKeyboardTypeNumberPad;
    [self.userPasscodeTextView becomeFirstResponder];
    
}

- (void)textViewDidChange:(UITextView *)textView{
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
    if ([self.userPasscodeTextView.text isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"userPasscode"]] && self.userPasscodeTextView.text.length == 4) {
        [self.userPasscodeTextView resignFirstResponder];
    }else if (self.userPasscodeTextView.text != [[NSUserDefaults standardUserDefaults] objectForKey:@"userPasscode"] && self.userPasscodeTextView.text.length == 4){
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

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [self performSegueWithIdentifier:@"pwSuccessSegue" sender:nil];
    return YES;
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
