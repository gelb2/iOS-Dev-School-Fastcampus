//
//  ViewController.m
//  ThreadTest
//
//  Created by ji jun young on 2017. 3. 13..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (nonatomic) NSString *textForLabel;

@property (nonatomic) NSThread *thread;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//ns스레드 객체 생성
    //스레드는 실행되고 나서는 사라진다
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadAction:) object:nil];
    //스래드
    [self.thread start];
    
    [self.button addTarget:self action:@selector(stopCount:) forControlEvents:UIControlEventTouchUpInside];

    [self.button2 addTarget:self action:@selector(restartCount:) forControlEvents:UIControlEventTouchUpInside];
}

//스레드의 셀렉터 메소드 작성
- (void)threadAction:(NSString *)sender{
    
//        for (int i = 0; i < 15; i++) {
//            NSLog(@"%d", i);
//            sleep(1);
//            [self performSelectorOnMainThread:@selector(changeText:) withObject:[NSString stringWithFormat:@"%d", i] waitUntilDone:YES];
//        }
    int i;
    i = 0;
    while (YES) {
        [self performSelectorOnMainThread:@selector(changeText:) withObject:[NSString stringWithFormat:@"%d", i] waitUntilDone:YES];
        NSLog(@"%d",i);
        
        
        if ([[NSThread currentThread]isCancelled] == YES) {
            break;
        }
        i += 1;
    }
    
    
    
   
    self.label.text = @"카운트 종료";
}

- (void)changeText:(NSString *)sender{
    
    [self.label setText:sender];
    
}



-(void)stopCount:(UIButton *)sender{
    
    [self.thread cancel];
    [self.label setText:@"카운트 강제종료"];
    
}

-(void)restartCount:(UIButton *)sender{
    //스레드는 실행되고 나서는 사라진다
    
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadAction:) object:nil];
    //스래드
    [self.thread start];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
