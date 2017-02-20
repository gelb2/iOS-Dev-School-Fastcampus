//
//  ViewController.m
//  TableView2
//
//  Created by ji jun young on 2017. 2. 16..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray* arrayTest;

@property (nonatomic) NSArray* arrayImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    
    return self.arrayTest.count / 2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
           cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
        }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.arrayTest objectAtIndex:indexPath.row]];
    NSString *imageNames = [self.arrayImage objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageNames];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    tableView.rowHeight = 45;
    
//    tableView.estimatedSectionHeaderHeight = 200;
//    tableView.sectionHeaderHeight = 20;
//    tableView.separatorInset;
//    - (CGRect)rectForHeaderInSection:(NSInteger)section;
//    위에 것들은 뭐하는 코드지?   @property (nonatomic) UIEdgeInsets separatorInset NS_AVAILABLE_IOS(7_0) UI_APPEARANCE_SELECTOR; // allows customization of the frame of cell separators

    
    return cell;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"리스트 1";
            break;
        case 1:
            return @"리스트 2";
            break;
        case 2:
            return @"리스트 3";
            break;
        case 3:
            return @"리스트 4";
            break;
        case 4:
            return @"리스트 5";
            break;
        case 5:
            return @"리스트 6";
            break;
        case 6:
            return @"리스트 7";
            break;
        case 7:
            return @"리스트 8";
            break;
        case 8:
            return @"리스트 9";
            break;
        case 9:
            return @"리스트 10";
            break;
        case 10:
            return @"리스트 11";
            break;
        case 11:
            return @"리스트 12";
            break;
        case 12:
            return @"리스트 13";
            break;
            
        default:
            return @"";
            break;
    }
    
}

//[moneyInput1 addTarget:self action:@selector(putMoneyInput1:) forControlEvents:UIControlEventTouchUpInside];


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
