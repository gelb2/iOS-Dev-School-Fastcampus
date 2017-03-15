//
//  ViewController.m
//  Network_ImageDownload
//
//  Created by ji jun young on 2017. 3. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageTest;
@property (weak, nonatomic) IBOutlet UIImageView *imageTest2;
@property (weak, nonatomic) IBOutlet UIImageView *imageTest3;
@property (weak, nonatomic) IBOutlet UIImageView *imageTest4;
@property (weak, nonatomic) IBOutlet UIImageView *imageTest5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //해당 코드는 메인스레드에서 돌아가는 코드임...따라서 이미지를 여러개 불러올 경우엔 이미지가 다 불러질 때까지 기다리게 됨...따라서 ui도 안먹히게 됨...즉 비동기 처리를 해줘야 함
//    self.imageTest.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile8.uf.tistory.com/image/23480045537238AE0172C1"]]];
    
//    self.imageTest2.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile4.uf.tistory.com/image/236DB53D53F5CD45125DB0"]]];
//    self.imageTest3.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile7.uf.tistory.com/image/250D44415488D11D315948"]]];
//    self.imageTest4.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile3.uf.tistory.com/image/190EB848510A63712F4544"]]];
    
    
    //////////////* 하단의 코드들은 세션, 세션테스크를 각각 생성하고, GCD를 사용해 각 이미지들이 비동기화 과정으로+메인큐에서 띄워지도록 설정함 *///////////////
    
    //////////////* 세션1 생성 *///////////////
    
    
    NSURL *thumbnailURL1 = [NSURL URLWithString:@"http://cfile8.uf.tistory.com/image/23480045537238AE0172C1"];
    NSURLSession *session1 = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task1 = [session1 dataTaskWithURL:thumbnailURL1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data){
            UIImage *image1 = [UIImage imageWithData:data];
            if(image1){
                //ui변경 코드
                //변경을 위해 GCD 사용
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    self.imageTest.image = image1;
                });
                
            }
        }
    }];
   
    [task1 resume];

    //////////////* 세션2 생성 *///////////////
    
    NSURL *thumbnailURL2 = [NSURL URLWithString:@"http://cfile4.uf.tistory.com/image/236DB53D53F5CD45125DB0"];
    NSURLSession *session2 = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task2 = [session2 dataTaskWithURL:thumbnailURL2 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image2 = [UIImage imageWithData:data];
            
            if (image2) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                    self.imageTest2.image = image2;
                });
            }
        }
    }];
    
    [task2 resume];
    
    //////////////* 세션3 생성 *///////////////
    
    NSURL *thumbnailURL3 = [NSURL URLWithString:@"http://cfile7.uf.tistory.com/image/250D44415488D11D315948"];
    NSURLSession *session3 = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task3 = [session3 dataTaskWithURL:thumbnailURL3 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image3 = [UIImage imageWithData:data];
            if (image3) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    self.imageTest3.image = image3;
                });
            }
        }
    }];
    [task3 resume];
    
    //////////////* 세션4 생성 *///////////////
    
    NSURL *thumbnailURL4 = [NSURL URLWithString:@"http://cfile3.uf.tistory.com/image/190EB848510A63712F4544"];
    NSURLSession *session4 = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task4 = [session4 dataTaskWithURL:thumbnailURL4 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image4 = [UIImage imageWithData:data];
            if (image4) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
                    self.imageTest4.image = image4;
                });
            }
        }
    }];
    [task4 resume];

    //////////////* 세션5 생성 *///////////////
    
    NSURL *thumbnailURL5 = [NSURL URLWithString:@"http://mblogthumb4.phinf.naver.net/20160106_163/euimok_1452060575427J3ThJ_PNG/%BF%A1%B9%D9_1.PNG?type=w2"];
    NSURLSession *session5 = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task5 = [session5 dataTaskWithURL:thumbnailURL5 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image5 = [UIImage imageWithData:data];
            if (image5) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.imageTest5.image = image5;
                });
            }
        }
    }];
    [task5 resume];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
