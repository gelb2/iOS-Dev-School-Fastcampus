//
//  SecondViewController.m
//  SegueTest
//
//  Created by ji jun young on 2017. 3. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton2;
@property (weak, nonatomic) IBOutlet UITextField *testTextField4;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC {
    
    FirstViewController * vc = unwindSegue.destinationViewController;
    vc.testTextField3.text = self.testTextField2.text;
}

- (IBAction)didClickNotiTest:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"testNotification" object:self.testTextField4.text userInfo:@{@"test":self.testTextField4.text}];
}

-(NSString *)stringSaving{
    self.stringTest = self.testTextField4.text;
    
    return self.stringTest;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self stringSaving];
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
