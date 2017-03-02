//
//  ViewController.m
//  AlertController
//
//  Created by ji jun young on 2017. 3. 2..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//얼럿 컨트롤러 자체를 프로퍼티로 등록함. 버튼 액션 메소드에서 호출 가능 해야 하므로

@property UIAlertController *alertController1;

@property UIAlertController *alertController2;

@property UILabel *tapCountText;

@property (nonatomic) NSUInteger testNumber;
@property (nonatomic) CGPoint touchPoint;

@property (nonatomic) UIImagePickerController *cameraController;

@property (nonatomic) UIImageView *imgView;

@property (nonatomic) NSDictionary *imageDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //제스처
    UITapGestureRecognizer *tapGestrue1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    tapGestrue1.delegate = self;
    tapGestrue1.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapGestrue1];
    
    //얼럿 컨트롤러
    self.alertController1 = [UIAlertController alertControllerWithTitle:@"타이틀"
                                                                             message:@"메시지"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"PickerView"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action){
                                                         NSLog(@"ok버튼이 클릭됨");
                                                         [self presentViewController:self.cameraController animated:YES completion:nil];
                                                     }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [self.alertController1 addAction:okAction];
    [self.alertController1 addAction:cancelAction];

    self.alertController2 = [UIAlertController alertControllerWithTitle:@"타이틀2" message:@"메시지2" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * okAction2 = [UIAlertAction actionWithTitle:@"PickerView2" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){[self presentViewController:self.cameraController animated:YES completion:nil];
    }];
    UIAlertAction *cancelAction2 = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [self.alertController2 addAction:okAction2];
    [self.alertController2 addAction:cancelAction2];
    
    //얼럿 버튼
    UIButton *AlertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [AlertButton setTitle:@"Alert" forState:UIControlStateNormal];
    [AlertButton setBackgroundColor:[UIColor lightGrayColor]];
    [AlertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AlertButton.frame = CGRectMake(30, 30, 80, 50);
    [AlertButton addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:AlertButton];
    
    UIButton *ActionSheet = [UIButton buttonWithType:UIButtonTypeCustom];
    [ActionSheet setTitle:@"ActionSheet" forState:UIControlStateNormal];
    [ActionSheet setBackgroundColor:[UIColor lightGrayColor]];
    [ActionSheet setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ActionSheet.frame = CGRectMake(230, 30, 80, 50);
    [ActionSheet addTarget:self action:@selector(test2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ActionSheet];
    
    UIButton *ActionSheet2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [ActionSheet2 setTitle:@"ActionSheet2" forState:UIControlStateNormal];
    [ActionSheet2 setBackgroundColor:[UIColor lightGrayColor]];
    [ActionSheet2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ActionSheet2.frame = CGRectMake(230, 120, 80, 50);
    [ActionSheet2 addTarget:self action:@selector(test3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ActionSheet2];
    
    //제스처, ui터치, ui제스처델리게이트를 통한 탭 횟수, 탭 좌표 찍는 레이블
    self.tapCountText = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 50)];
    self.tapCountText.textColor = [UIColor blackColor];
    
    [self.view addSubview:self.tapCountText];
    
    //이미지피커
    self.cameraController = [[UIImagePickerController alloc] init];
    self.cameraController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.cameraController.allowsEditing = NO;
    self.cameraController.delegate = self;
//    [self presentViewController:self.cameraController animated:YES completion:nil];
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:self.imgView];
    
}

//이미지피커 델리게이트

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSLog(@"info %@", info);
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imgView.image = image;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//- (void)viewDidAppear:(BOOL)animated {
//    
//    //viewDidAppear는 viewDidLoad 다음에 불리는 시점
//    //viewDidLoad가 전부 읽히더라도, 뷰,버튼,얼럿같은 객체들이 띄워지려면 viewDidAppear가 전부 읽혀야 함
//    //따라서 viewDidLoad에서 presentViewController를 호출하면 "해당 뷰는 윈도우 위계관계에 없음"이라고 뜨며 띄워지지 않음
//    [self presentViewController:self.alertController animated:YES completion:nil];
//    
//}

-(void)test1:(UIButton *)sender{
    
    
    //버튼에 에드타겟을 주고 presentViewController 메소드를 view(self)가 실행해야 버튼을 누르면 얼럿이 뜸...버튼에 다른 메소드를 주는 것과 같다고 보면 됨
        [self presentViewController:self.alertController1 animated:YES completion:nil];
}


-(void)test2:(UIButton *)sender{
    [self presentViewController:self.cameraController animated:YES completion:nil];
    
}

-(void)test3:(UIButton *)sender{
    
    [self presentViewController:self.alertController2 animated:YES completion:nil];
}


- (void)handleTap:(UITapGestureRecognizer *)sender{
//    NSLog(@"위치가 탭 되었음");
    
    //     UI 표시
    NSLog(@"handleTap");
    self.tapCountText.text = [NSString stringWithFormat:@"%ld, %lf, %lf",self.testNumber, self.touchPoint.x, self.touchPoint.y];
    [self presentViewController:self.alertController2 animated:YES completion:nil];

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    NSLog(@"gestureRecognizer");
    //값 저장
    self.testNumber = touch.tapCount;
    self.touchPoint = [touch locationInView:touch.view];
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
