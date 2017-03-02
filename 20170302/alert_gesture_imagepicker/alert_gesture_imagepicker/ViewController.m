//
//  ViewController.m
//  alert_gesture_imagepicker
//
//  Created by ji jun young on 2017. 3. 2..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//제스처 델리게이트 하나, 이미지피커 설정 시 이미지피커 델리게이트와 네비게이션컨트롤러 델리게이트 설정함

@property (nonatomic) UIAlertController *alertController1;

@property (nonatomic) UIAlertController *alertController2;

@property (nonatomic) UITapGestureRecognizer *tapGesture1;

@property (nonatomic) UIButton *button1;

@property (nonatomic) UIButton *button2;

@property (nonatomic) UIButton *button3;

@property (nonatomic) UILabel *label1;

@property (nonatomic) NSUInteger touchCheck1;

@property (nonatomic) CGPoint touchLocationCheck1;

@property (nonatomic) UIImageView *imageView1;

@property (nonatomic) UIImagePickerController *cameraController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ///////////////* 얼럿 객체 생성 *////////////////
    
    self.alertController1 = [UIAlertController alertControllerWithTitle:@"타이틀1" message:@"메시지1" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm1 = [UIAlertAction actionWithTitle:@"확인1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"확인1이 눌렸습니다");
    }];
    UIAlertAction *cancel1 = [UIAlertAction actionWithTitle:@"취소1" style:UIAlertActionStyleDestructive handler:nil];
    
    [self.alertController1 addAction:confirm1];
    [self.alertController1 addAction:cancel1];
    
    self.alertController2 = [UIAlertController alertControllerWithTitle:@"타이틀2" message:@"메시지2" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *confirm2 = [UIAlertAction actionWithTitle:@"확인2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"확인2가 눌렸습니다");
    }];
    UIAlertAction *cancel2 = [UIAlertAction actionWithTitle:@"취소2" style:UIAlertActionStyleCancel handler:nil];
    [self.alertController2 addAction:confirm2];
    [self.alertController2 addAction:cancel2];
    
    /////////////* 제스처 객체 생성 *////////////////////////
    
    self.tapGesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture1:)];
    self.tapGesture1.delegate = self;
    self.tapGesture1.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.tapGesture1];
    
    ////////////* 버튼 객체 생성 *///////////////////////////////
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectMake(self.view.frame.size.width / 10, self.view.frame.size.height / 8, 100, 80);
    [self.button1 setTitle:@"버튼1" forState:UIControlStateNormal];
    [self.button1 setBackgroundColor:[UIColor lightGrayColor]];
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(button1didSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(self.view.frame.size.width / 1.5, self.view.frame.size.height / 8, 100, 80);
    [self.button2 setTitle:@"버튼2" forState:UIControlStateNormal];
    [self.button2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button2 addTarget:self action:@selector(button2didSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3.frame = CGRectMake(self.view.frame.size.width / 10, self.view.frame.size.height / 1.7, 100, 80);
    [self.button3 setTitle:@"사진선택" forState:UIControlStateNormal];
    [self.button3 setBackgroundColor:[UIColor lightGrayColor]];
    [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button3 addTarget:self action:@selector(button3didSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button3];
    
    ///////////////////* 탭 횟수 기록용 레이블 객체 생성 */////////////////
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, self.view.frame.size.width, 80)];
    self.label1.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    self.label1.backgroundColor = [UIColor whiteColor];
    self.label1.alpha =1;
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.label1 setTextColor:[UIColor blackColor]];
    [self.view addSubview:self.label1];
    
    ////////////////////////* 이미지 피커 컨트롤러 객체 생성 *//////////////////
    self.cameraController = [[UIImagePickerController alloc]init];
    self.cameraController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.cameraController.allowsEditing = NO;
    self.cameraController.delegate = self;
    
    ///////////////////* 이미지 피커의 이미지를 보여줄 이미지 뷰 객체 생성 */////////////////
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 1.5, self.view.frame.size.height / 1.7, 100, 100)];
    [self.imageView1 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.imageView1];
    
}


/////////////////////////////* 버튼 눌렸을 시 메소드 작성 *///////////////////////
- (void)button1didSelected:(UIButton *)sender{
    [self presentViewController:self.alertController1 animated:YES completion:nil];
    
}

-(void)button2didSelected:(UIButton *)sender{
    [self presentViewController:self.alertController2 animated:YES completion:nil];
    
}

-(void)button3didSelected:(UIButton *)sender{
    [self presentViewController:self.cameraController animated:YES completion:nil];
    
}


//////////////////////* 제스처 메소드와 터치 델리게이트 메소드의 작성 *///////////////////

- (void)tapGesture1:(UITapGestureRecognizer *)sender{
    self.label1.text = [NSString stringWithFormat:@"%ld, %lf, %lf", self.touchCheck1, self.touchLocationCheck1.x, self.touchLocationCheck1.y];
    NSLog(@"탭이 됨");
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    self.touchCheck1 = touch.tapCount;
    self.touchLocationCheck1 = [touch locationInView:self.view];
    return YES;
}

/////////////////////*이미지 피커 컨트롤러 델리게이트의 작성 */////////////////////////

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView1.image = image;
    
    //이미지를 선택하고서 알아서 dismiss되도록 설정해 줘야 함
    [self dismissViewControllerAnimated:YES completion:nil];
}

//이미지를 선택을 취소하고서 알아서 dismiss되도록 설정해 줘야 함
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
