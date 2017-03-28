//
//  ViewController.m
//  DelegateTest
//
//  Created by ji jun young on 2017. 3. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerSecond.h"

@interface ViewController ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textField.delegate = self;

    
}


-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    self.label.text = textField.text;
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
