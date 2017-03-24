//
//  ViewController.m
//  SegueTest
//
//  Created by ji jun young on 2017. 3. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UITextField *testTextField1;

@property (weak, nonatomic) IBOutlet UITextField *testTextField5;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTemp:) name:@"testNotification" object:nil];
}

- (void)didTemp:(NSNotification *)sender {
    
    NSLog(@"testNotification");
    
    self.testTextField1.text = sender.object;
    self.testTextField1.text = [sender.userInfo objectForKey:@"test"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    NSLog(@"unwindSegue");
    //두번째 뷰컨트롤러에서 unwindsegue통해 첫번째 뷰컨트롤러로 돌아오는 순간 텍스트필드의 텍스트가 사라지도록 설정함
    self.testTextField1.text = nil;
}

//세그가 실행되는 순간 텍스트필드에 텍스트가 작성되도록 설정
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [super prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender];
    
    
    self.testTextField1.text = @"PrepareForSegue";
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
