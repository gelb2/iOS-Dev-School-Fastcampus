//
//  ViewControllerDeveloperLocation.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 3. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerDeveloperLocation.h"
#import "Annotation.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

//지도에 특정 위치를 표시하기 위한 위도 경도 선언
const CGFloat LATITUDE = 37.534993;
const CGFloat LONGITUDE = 126.993521;


@interface ViewControllerDeveloperLocation ()
<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapViewTest;


@property (weak, nonatomic) UIAlertController *alertController;

@property (weak, nonatomic) UIAlertAction *okAction;

@property (weak, nonatomic) UIAlertAction *cancelAction;
@property (weak, nonatomic) IBOutlet UIButton *test;


@end

@implementation ViewControllerDeveloperLocation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Developer Location";
    
    ////////////* 탭 제스처 레코그나이저 객체 생성 *////////////////////
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]init];
    [tapGesture addTarget:self action:@selector(tapAlert:)];
    tapGesture.numberOfTapsRequired = 5;
    [self.view addGestureRecognizer:tapGesture];
    
    
//        //////////////////////* 얼럿 컨트롤러 만들기 및 자동으로 띄우기 *//////////////////////////////
//    
//        self.alertController = [UIAlertController alertControllerWithTitle:@"스페셜 이벤트" message:@"개발자를 잡으면 수제맥주가 공짜 ^_^" preferredStyle:UIAlertControllerStyleAlert];
//        self.okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
//        self.cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:nil];
//        [self.alertController addAction:self.okAction];
//        [self.alertController addAction:self.cancelAction];
//        
//    
    
    ///////////////////////////* 지도 만들어 보고 특정 위치 바로 표시해보기 예제 *////////////
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(LATITUDE, LONGITUDE);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    self.mapViewTest.delegate = self;
    [self.mapViewTest setRegion:region];

    //////////////////////////* 맵에 찍힐 핀 만들기 예제 *//////////////////////
    
    Annotation *annotationTest = [[Annotation alloc]initWithTitle:@"myPosition" AndCoordinate:coordinate];
    [self.mapViewTest addAnnotation:annotationTest];
    
    
}


////////////////////* 핀 위한 델리게이트 메소드의 작성, 셀의 deque설정과 유사함 */////////////////
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //   kPinAnnotationIdentifier 부분은 pin을 잘못 쓸 것을 대비하여 const 형태로 선언한 것
    //    static NSString * const kPinAnnotationIdentifier = @"pin";
    MKAnnotationView *newAnnotation = (MKAnnotationView*)[self.mapViewTest dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (newAnnotation == nil) {
        Annotation *myAnnotation = (Annotation *)annotation;
        newAnnotation = [[MKAnnotationView alloc]initWithAnnotation:myAnnotation reuseIdentifier:@"pin"];
        
        //핀을 커스텀하게 만들고자 uiview를 만들고 addsub함
        UIView *viewForAnnotation = [[UIView alloc]init];
        //        viewForAnnotation.backgroundColor = [UIColor blueColor];
        viewForAnnotation.frame = CGRectMake(0, 0, 80, 80);
        newAnnotation.frame = CGRectMake(0, 0, 80, 80);
        [newAnnotation addSubview:viewForAnnotation];
        
        //핀에 임의의 이미지를 넣고자 상단의 백그라운드 컬러를 주석처리하고 별도의 이미지를 uiview에 addsubview함
        UIImageView *imageViewForAnnotation = [[UIImageView alloc]init];
        imageViewForAnnotation.image = [UIImage imageNamed:@"gelbpin.png"];
        imageViewForAnnotation.frame = CGRectMake(0, 0, 80, 80);
        [viewForAnnotation addSubview:imageViewForAnnotation];
        
    }
    

    return newAnnotation;
    
}

- (void)tapAlert:(UIGestureRecognizer *)sender{
    
//    [self presentViewController:self.alertController animated:YES completion:nil];
    NSLog(@"tapped");
    
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
