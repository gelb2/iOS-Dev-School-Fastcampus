//
//  ViewControllerUserLocation.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 3. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerUserLocation.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
//""과 <>의 차이는 파일 하나를 임포트 하느냐, 혹은 프레임워크를 임포트 하느냐의 차이임

@interface ViewControllerUserLocation ()
<CLLocationManagerDelegate>


//스토리보드로 지도를 생성 후 m파일에 연결함
//map과 location은 별개의 사항이므로 사용자의 위치를 표시하려면 두 가지를 혼용해서 써야 함
//따라서 location은 지도 이외에도 다른 곳에도 사용 가능함...ex.apple beacon, 건물 내 에서의 위치측정(실내측위)
@property (nonatomic, weak) IBOutlet MKMapView *mapViewTest;

//@property IBOutlet
//스토리보드에서 뷰컨트롤러2개, 맵뷰2개 만들고 한 파일에 연결하는 것은 가능하긴 하지만, 화면이 분할되어서 띄워짐
//따라서 뷰컨트롤러, 맵뷰를 2개 만들어서, 전체화면으로 각각 작동되는 맵을 만들고자 한다면, 한다면 파일도 2개를 만들어서 드래그, 프로퍼티, 메소드를 작성해야 함

@property CLLocationManager *locationManager;


@end

@implementation ViewControllerUserLocation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //////////////*사용자의 위치 바로 지도에 표시해보기 예제 *////////////////////
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    //info.plist에서 위치정보 사용에 대한 속성을 지정해 주어야 함
    
    [self.mapViewTest setShowsUserLocation:YES];
    
    
    
    
}

//지도가 위치를 업데이트했을 시의 줌 비율, 위치 업데이트 멈추도록 델리게이트 메소드 작성
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocationCoordinate2D coordinate = ((CLLocation *)locations.lastObject).coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [self.mapViewTest setRegion:region];
    
    [self.locationManager stopUpdatingLocation];
    
    
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
