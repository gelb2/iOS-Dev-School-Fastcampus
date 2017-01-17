//
//  ViewController.m
//  FirstTest170116
//
//  Created by ji jun young on 2017. 1. 16..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"브레이크 포인트 전") ;
    
    NSLog(@"브레이크 포인트 후") ;
    
    NSLog(@"중간 공백....") ;
    
    NSLog(@"다음 브레이크 포인트 전") ;
    
    NSLog(@"다음 브레이크 포인트 후") ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction
{
    
    [self.titleLB setText:@"텍스트바뀜\n텍스트가 잘 바뀌나"];
    
    NSLog(@"버튼이 활성화 되었음") ;
}


- (IBAction)swtAction:(UISwitch *)sender
{
    
    if (sender.isOn == YES) {
        [self.titleLB setText:@"TEST...텍스트 추가\n 작성 얼마나 길게 써지는지..."];
        NSLog(@"스위치가 켜졌음") ;
    }else{
        [self.titleLB setText:@"텍스트바뀜\n텍스트가 잘 바뀌나"];
        NSLog(@"스위치가 꺼졌음") ;
    }

    
    
}



@end
