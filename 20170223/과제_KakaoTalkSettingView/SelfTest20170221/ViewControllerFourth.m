//
//  ViewControllerFourth.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerFourth.h"
#import "ViewControllerFifth.h"

@interface ViewControllerFourth ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray* arrayTest;

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
    
    self.arrayTest = [[NSArray alloc]initWithObjects:@"Shadowgun", @"Implosion", @"MonumentValley", @"Transistor", @"Abyssrium", @"Bastion", @"ThisWarOfMine", @"InfinityBlade", @"Prune", @"Tengami", @"DeadTrigger2", @"AssasinCreed:Identity", @"Never Alone", nil];
    
    //텍스트 데이터 뿌려주기 위한 어레이 생성 및 기존 숫자 데이터에서 스트링 데이터로 수정
    
    self.arrayImage = @[@"shadowgun.jpg", @"implosion.png", @"monumentvalley.jpg", @"transistor.png", @"abyssrium.jpg", @"bastion.jpg", @"thiswarofmine.jpg", @"infinityblade.jpg", @"prune.jpg", @"Tengami.jpg", @"DeadTrigger2.png", @"AssasinCreedidentity.jpg", @"NeverAlone.jpg"];
    
    
    //이미지 정렬 위한 어레이 생성
    
    //    self.arrayImage = [[NSArray alloc]initWithContentsOfFile:@"monumentvalley.jpg"];
    //이 메소드는 뭐하는 기능이지?
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.arrayTest.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.arrayTest objectAtIndex:indexPath.row]];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 6) {
        ViewControllerFifth *fifthView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFifth"];
        [self.navigationController pushViewController:fifthView animated:YES];
    }
    
    NSLog(@"Row Selected");
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row DeSelected");
    
}


//- (void)selectRowAtIndexPath:(nullable NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
//- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;
//
//// Appearance


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
