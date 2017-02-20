//
//  ViewController.m
//  tableView
//
//  Created by ji jun young on 2017. 2. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray* testMutableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableViewTest = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableViewTest.delegate = self;
    tableViewTest.dataSource = self;
    [self.view addSubview:tableViewTest];
    //테이블뷰 객체 생성
    
    
    self.testMutableArray = [[NSMutableArray alloc]initWithObjects:@"1번", @"2번", @"3번", @"4번", @"5번", @"6번", @"7번", @"8번", @"9번", @"10번", @"11번",@"12번",@"13번", nil];
    //각 셀 안에 뿌려줄 텍스트용 뮤터블 어레이 생성
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;

}
//섹션의 총 갯수는 5개로 생성


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.testMutableArray.count;
    
}
//섹션안의 로우 갯수는 뮤터블어레이 안의 데이터 갯수에 따라 증감하도록 self.testMutableArray.count를 반환하도록 설정함
//10을 적으면 10이 반횐되어 10개가 생성됨


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.testMutableArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

//셀 객체를 무한히 생성하면 안되므로, 테이블뷰가 디큐메소드를 사용하도록 작성함...셀이 닐값이면 셀을 새로 생성하도록 설정함
//cell.textLabel.text는 생성되는 셀에 들어갈 텍스트를 정하는 부분임. 스트링윗 포맷을 텍스트로 뿌려주되, 뮤터블어레이의 데이터들을 각 row에 뿌려주도록 함

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
            
        default:
            return @" ";
            break;
    }

}
//섹션들의 이름 정하는 곳...스위치문을 작성해 1,2,3,4,5 번째 섹션에 들어갈 이름들을 리스트 1,2,3~~~ 으로 정해줌

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    푸터를 중간에서만 나오게 하고, 맨 밑애 있는걸 없애는 법은 없음...
    //만일 푸터가 중간에만 있는 것 처럼 보이게 하려면, 셀 하나를 임의로 만들어서 푸터같이 디자인을 하고, 셀에 넣어주어야 함
    
    switch (section) {
        case 0:
            return @"리스트 1의 끝";
            break;
        case 1:
            return @"리스트 2의 끝";
            break;
        case 2:
            return @"리스트 3의 끝";
            break;
        case 3:
            return @"리스트 4의 끝";
            break;
        case 4:
            return @"리스트 5의 끝";
            break;
            
        default:
            return @" ";
            break;
    }
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

















