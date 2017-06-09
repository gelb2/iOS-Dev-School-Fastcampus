//
//  ViewControllerFourth.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerFourth.h"
#import "ViewControllerFifth.h"
#import "DataCenter.h"
#import "CustomTableViewCell.h"

@interface ViewControllerFourth ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray* arrayName;

@property (nonatomic) NSArray* arrayImage;

@end

@implementation ViewControllerFourth

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Game";
    
    UITableView *tableViewTest = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    tableViewTest.delegate = self;
    tableViewTest.dataSource = self;
    [self.view addSubview:tableViewTest];
    
    //텍스트 데이터 뿌려주기 위한 어레이 생성, 생성된 어레이에 데이터센터의 어레이 값을 집어넣음
    self.arrayName = [[NSArray alloc]initWithArray:[[DataCenter sharedInstance]settingArrayName]];
    
    //이미지 데이터 뿌려주기 위한 어레이 생성, 생성된 어레이에 데이터센터의 어레이 값을 집어넣음
    self.arrayImage = [[NSArray alloc]initWithArray:[[DataCenter sharedInstance]settingArrayImage]];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.arrayName.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.arrayName objectAtIndex:indexPath.row]];
    NSString *imageNames = [self.arrayImage objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageNames];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableView.rowHeight = 45;
    
    //    tableView.estimatedSectionHeaderHeight = 200;
    //    tableView.sectionHeaderHeight = 20;
    //    tableView.separatorInset;
    //    - (CGRect)rectForHeaderInSection:(NSInteger)section;
    //    위에 것들은 뭐하는 코드지?   @property (nonatomic) UIEdgeInsets separatorInset NS_AVAILABLE_IOS(7_0) UI_APPEARANCE_SELECTOR; // allows customization of the frame of cell separators
    
    
    return cell;
    
    
}


//[moneyInput1 addTarget:self action:@selector(putMoneyInput1:) forControlEvents:UIControlEventTouchUpInside];


//로우가 선택되면 커스텀 테이블뷰 셀이 어떤 이미지를 뿌려줘야 할 지 정할 수 있도록, 뷰컨트롤러fifth로 이동 하도록 코드 작성 중
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [DataCenter sharedInstance].currentRow = indexPath.row;
    
    ViewControllerFifth *fifthView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFifth"];
    [self.navigationController pushViewController:fifthView animated:YES];
    
    //로우 별로 이미지, 텍스트들이 바뀌도록 설정할 것이므로 주석 처리함
//    if (indexPath.row == 6) {
//        ViewControllerFifth *fifthView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFifth"];
//        [self.navigationController pushViewController:fifthView animated:YES];
//    }
//    
    //셀을 클릭 시 다른 뷰로 이동하고, 그와 동시에 선택이 해제됨
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



//@property (nonatomic, weak) UIImageView *profileImage;
//@property (nonatomic, weak) UILabel *titleName;
//@property (nonatomic, weak) UILabel *developerName;
//
//@property (nonatomic, weak) UIImageView *headerImage;
//
//@property (nonatomic, weak) UILabel *descriptionText;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
