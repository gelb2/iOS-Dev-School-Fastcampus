//
//  ViewController.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 21..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerFirst.h"
#import "ViewControllerThird.h"
#import "ViewControllerFourth.h"
#import "ViewControllerLabatory.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property NSArray *textArraySection0;
@property NSArray *textArraySection1;
@property NSArray *imageArraySection0;
@property NSArray *imageArraySection1;
@property UIAlertController *alertController;
@property UIAlertAction *okAction;
@property UIAlertAction *cancelAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /////////////////얼럿 컨트롤러 생성///////////////////
    self.alertController = [UIAlertController alertControllerWithTitle:@"알림" message:@"아직 공사중인 곳이 많습니다" preferredStyle:UIAlertControllerStyleAlert];
    self.okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"화인을 눌렀음");
    }];
    self.cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:nil];
    [self.alertController addAction:self.okAction];
    [self.alertController addAction:self.cancelAction];
    
    /////////////////텍스트 어레이, 이미지 어레이 생성////////////////////
    self.textArraySection0 = [[NSArray alloc]initWithObjects:@"공지사항", @"실험실(테이블뷰가 있는 메인)", @"버전정보", nil];
    self.textArraySection1 = [[NSArray alloc] initWithObjects:@"개인 및 보안", @"알림 및 친구(스위치가 있는 메인)",@"채팅", @"화면",@"게임(테이블뷰가 있는 메인)",@"기타", nil];
    
//네비게이션바 세팅 관련 부분 /////////////////////////////////////////////////////////////////
    
    //네비게이션바 제목 지정
    self.navigationItem.title = @"Setting";
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    //네비게이션 바용 버튼 2개 생성
    UIButton *goBack = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 35, 35)];
    [goBack setBackgroundImage:[UIImage imageNamed:@"arrowBack"] forState:UIControlStateNormal];
    [goBack addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];

    //UX상 필요없을 듯 하여 주석처리함
//    UIButton *goFront = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 35, 35)];
//    [goFront setBackgroundImage:[UIImage imageNamed:@"arrowFront"] forState:UIControlStateNormal];
//    [goFront addTarget:self action:@selector(gotoFront:) forControlEvents:UIControlEventTouchUpInside];
    
    //네비게이션바 왼쪽, 오른쪽 버튼 생성
    //버튼을 생성하고, 생성된 버튼 객체들을 바버튼 객체에 다시 집어넣으면 위치는 무시된다. 이미지는 크기가 알아서 보정된다
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:goBack];
    self.navigationItem.leftBarButtonItem =backItem;
    
    //ux상 필요없을 듯 하여 주석처리함
//    UIBarButtonItem *frontItem = [[UIBarButtonItem alloc]initWithCustomView:goFront];
//    self.navigationItem.rightBarButtonItem = frontItem;
    
//   //테스트용 레이블
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
//    [label setText:@"ViewController"];
//    [self.view addSubview:label];
    
    ///////////////////////////테이블뷰 작성 부분/////////////////////////////////////////
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.view addSubview:tableView];
    
        ///////////////////////////서치바 만들어 보기/////////////
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 30)];
    searchBar.barStyle = UISearchBarStyleDefault;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.placeholder = @"검색어를 입력하시오";
    [tableView addSubview:searchBar];

    
}

//섹션의 로우 갯수 지정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    } else if(section == 1){
        return 6;
    }
    else{
        return 1;
    }
}

//테이블뷰의 섹션 갯수 지정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

//cellforrowatindexpath + 디큐 설정

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    if (indexPath.section == 0) {
        
        
        
        cell.textLabel.text = [self.textArraySection0 objectAtIndex:indexPath.row];
        //버전 숫자와 악세사리를 같이 놓는 방법은?
        //        if (indexPath.section == 0 && indexPath.row ==2) {
//            UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//            testLabel.text = @"Ver 2.23";
//            testLabel.textAlignment = NSTextAlignmentLeft;
//            testLabel.textColor = [UIColor blackColor];
//            testLabel.font = [UIFont systemFontOfSize:12];
//            cell.accessoryView = testLabel;
//        }
        
        
        if (indexPath.row == 0) {
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img1 = [[UIImage alloc]init];
            img1 = [UIImage imageNamed:@"pic1"];
            CGRect rect1 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect1.size);
            [img1 drawInRect:rect1];
            UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData1 = UIImagePNGRepresentation(picture1);
//            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData1];
            
            
            
        } else if(indexPath.row == 1){
            UIImage *img2 = [[UIImage alloc]init];
            img2 = [UIImage imageNamed:@"pic2"];
            CGRect rect2 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect2.size);
            [img2 drawInRect:rect2];
            UIImage *picture2 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData2 = UIImagePNGRepresentation(picture2);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData2];
        }
        else{
            UIImage *img3 = [[UIImage alloc]init];
            img3 = [UIImage imageNamed:@"pic3"];
            CGRect rect3 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect3.size);
            [img3 drawInRect:rect3];
            UIImage *picture3 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData3 = UIImagePNGRepresentation(picture3);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData3];
        
        }
    }
    
//    UIImage *img1 = [[UIImage alloc] init];
//    img1 = [UIImage imageNamed:@"settings-icon3"];
//    
//    // UIImage 사이즈 변환
//    CGRect rect = CGRectMake(0,0,30,30);
//    UIGraphicsBeginImageContext( rect.size );
//    [img1 drawInRect:rect];
//    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    NSData *imageData = UIImagePNGRepresentation(picture1);
//    UIImage *img=[UIImage imageWithData:imageData];
//    
//    이미지 리사이징 코드입니다
    
    
    
    else if(indexPath.section == 1){
        cell.textLabel.text = [self.textArraySection1 objectAtIndex:indexPath.row];
        
        if (indexPath.row == 0) {
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img4 = [[UIImage alloc]init];
            img4 = [UIImage imageNamed:@"pic4"];
            CGRect rect4 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect4.size);
            [img4 drawInRect:rect4];
            UIImage *picture4 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData4 = UIImagePNGRepresentation(picture4);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData4];
        } else if(indexPath.row == 1){
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img5 = [[UIImage alloc]init];
            img5 = [UIImage imageNamed:@"pic5"];
            CGRect rect5 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect5.size);
            [img5 drawInRect:rect5];
            UIImage *picture5 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData5 = UIImagePNGRepresentation(picture5);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData5];
        }
        else if (indexPath.row == 2){
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img6 = [[UIImage alloc]init];
            img6 = [UIImage imageNamed:@"pic6"];
            CGRect rect6 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect6.size);
            [img6 drawInRect:rect6];
            UIImage *picture6 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData6 = UIImagePNGRepresentation(picture6);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData6];
        
        }
        else if (indexPath.row == 3){
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img7 = [[UIImage alloc]init];
            img7 = [UIImage imageNamed:@"pic7"];
            CGRect rect7 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect7.size);
            [img7 drawInRect:rect7];
            UIImage *picture7 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData7 = UIImagePNGRepresentation(picture7);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData7];
            
        }
        else if (indexPath.row == 4){
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img8 = [[UIImage alloc]init];
            img8 = [UIImage imageNamed:@"pic8"];
            CGRect rect8 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect8.size);
            [img8 drawInRect:rect8];
            UIImage *picture8 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData8 = UIImagePNGRepresentation(picture8);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData8];
            
        }
        else if (indexPath.row == 5){
            //이미지 크기를 변환하고, 셀의 이미지 프로퍼티에 집어넣는 메소드 묶음 실행
            UIImage *img9 = [[UIImage alloc]init];
            img9 = [UIImage imageNamed:@"pic9"];
            CGRect rect9 = CGRectMake(0, 0, 25, 25);
            UIGraphicsBeginImageContext(rect9.size);
            [img9 drawInRect:rect9];
            UIImage *picture9 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSData *imageData9 = UIImagePNGRepresentation(picture9);
            //            UIImage *image1 = [UIImage imageWithData:imageData1];
            cell.imageView.image = [UIImage imageWithData:imageData9];
            
        }
//        else{
//            UIImage *img10 = [[UIImage alloc]init];
//            img10 = [UIImage imageNamed:@"pic10"];
//            CGRect rect10 = CGRectMake(0, 0, 25, 25);
//            UIGraphicsBeginImageContext(rect10.size);
//            [img10 drawInRect:rect10];
//            UIImage *picture10 = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//            NSData *imageData10 = UIImagePNGRepresentation(picture10);
//            //            UIImage *image1 = [UIImage imageWithData:imageData1];
//            cell.imageView.image = [UIImage imageWithData:imageData10];
        
        
        
    }else{
        cell.textLabel.text = @"고객센터 및 도움말";
        UIImage *img11 = [[UIImage alloc]init];
        img11 = [UIImage imageNamed:@"pic11"];
        CGRect rect11 = CGRectMake(0, 0, 25, 25);
        UIGraphicsBeginImageContext(rect11.size);
        [img11 drawInRect:rect11];
        UIImage *picture11 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        NSData *imageData11 = UIImagePNGRepresentation(picture11);
        //            UIImage *image1 = [UIImage imageWithData:imageData1];
        cell.imageView.image = [UIImage imageWithData:imageData11];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    
//    cell.textLabel.text = [self.textArray objectAtIndex:indexPath.row]
//    ;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"기본설정";
            break;
        case 1:
            return @"친구설정";
            break;
        case 2:
            return @" ";
            break;
            
        default:
            return @" ";
            break;
    }
    
}


//네비게이션바의 뷰컨트롤러 이동용 메소드
-(void)gotoBack:(UIButton *)sender{
    
    ViewControllerFirst *firstView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFirst"];
    [self.navigationController pushViewController:firstView animated:YES];

    //    [self.navigationController setNavigationBarHidden:YES animated:YES];

    //한 번 뒤로가기 버튼을 눌렀을 때 네비게이션 바가 사라지게 하는 것은 성공함. 다시 로그인을 했을때 나타나게 하는 것 성공함
    //뷰 윌 어피어를 통해 네비게이션 바 히든 여부를 구현했으므로 주석처리함
    //네비게이션바의 히든의 경우, 버튼에 거는 것 보단, "자기 자신"이 처리할 수 있도록 viewwillappear 를 활용해서 히든을 걸어주는 것이 좋다    
}

//뷰가 나타날 때 네비게이션 바가 사라지게 하는 것 성공함.
//테스트 결과 NSuserDefault를 통한 스위치 켜고 껐을 시 데이터 저장은 잘 되는 듯 함...이제 스위치를 진짜로 켜고 끄는 것을 저장하게끔 하면 됨...setBOOL

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self presentViewController:self.alertController animated:YES completion:^{
        NSLog(@"얼럿 컨트롤러가 띄워짐");
    }];

}

//셀 눌렀을 때 다른 뷰로 가게 하는 메소드
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //셀 눌렀을 시 다른 뷰로 이동하면서 '선택'이 풀리도록 설정
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ViewControllerThird *thirdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThird"];
            [self.navigationController pushViewController:thirdView animated:YES];
            
        }
        else if (indexPath.row == 1){
            ViewControllerLabatory *viewControllerLabatory = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerLabatory"];
            [self.navigationController pushViewController:viewControllerLabatory animated:YES];
        }
        else{
            ViewControllerThird *thirdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThird"];
            [self.navigationController pushViewController:thirdView animated:YES];
        }
    }
    
    else if (indexPath.section == 1) {
        if (indexPath.row == 4) {
            ViewControllerFourth *fourthView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFourth"];
            [self.navigationController pushViewController:fourthView animated:YES];
        }
        else{
            ViewControllerThird *thirdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThird"];
            [self.navigationController pushViewController:thirdView animated:YES];
        }
        
    }
    else{
        
    ViewControllerThird *thirdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThird"];
    [self.navigationController pushViewController:thirdView animated:YES];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
