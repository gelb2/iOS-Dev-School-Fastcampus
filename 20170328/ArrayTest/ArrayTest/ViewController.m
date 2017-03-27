//
//  ViewController.m
//  ArrayTest
//
//  Created by ji jun young on 2017. 3. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{@"1":@"a", @"2":@"b"};
    NSLog(@"%@", [dic objectForKey:@"1"]);
    
    NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"1", @"a", @"2", @"b", @"3", @"c", nil];
    NSLog(@"%@", [dic2 objectForKey:@"a"]);
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
