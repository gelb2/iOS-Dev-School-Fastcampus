//
//  ViewControllerLabatory.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerLabatory.h"
#import "CustomTableViewCellLabatory.h"

@interface ViewControllerLabatory ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewControllerLabatory

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Labatory";
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
}

///////////////* 섹션 갯수 설정 *///////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

///////////////* 섹션 당 로우 갯수 설정 *///////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 4;
}

///////////////* 디큐 설정 *///////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[CustomTableViewCellLabatory alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = [[[CustomTableViewCellLabatory alloc]init].textArray objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //왜 customTableViewCellLabatory.textArray 로는 프로퍼티를 불러올 수 없을까...
    }
    
    return cell;
}

/////////////* 헤더 부분 설정 *///////////////////////

- (UIImageView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];

    UIImageView *headerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"kakaoLabatory.jpg"]];
    headerView.frame = CGRectMake(self.view.frame.size.width / 2, 0, 150, 150);
    [headerView setCenter:CGPointMake(bigView.frame.size.width / 2, bigView.frame.size.height / 2)];
    [bigView addSubview:headerView];
    
    UILabel *headerText = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, 300, 50)];
    headerText.center = CGPointMake(bigView.frame.size.width / 2, bigView.frame.size.height / 2 + headerView.frame.size.height / 2 + 20);
    headerText.text = @"Jun의 UI 카피 실험실";
    headerText.textAlignment = NSTextAlignmentCenter;
    [bigView addSubview:headerText];
    
//    [headerView setContentMode:UIViewContentModeScaleAspectFit];
//    [headerView setAutoresizesSubviews:YES];
    
    return bigView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Jun의 카카오톡 카피 실험실에 오신 것을 환영합니다";
            break;
            
        default:
            return @"";
            break;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *footerText = @"실험실 기능은 개발자의 취향에 따라 소리없이 사라질 수 있습니다";
    switch (section) {
        case 0:
            return footerText;
            break;
            
        default:
            return @"";
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
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
