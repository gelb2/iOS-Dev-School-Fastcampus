//
//  ViewControllerFifth.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerFifth.h"
#import "CustomTableViewCell.h"
#import "DataCenter.h"

@interface ViewControllerFifth ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewControllerFifth

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //상단 네비게이션바의 타이틀 지정
//    self.navigationItem.title = @"This War Of Mine";

//    DataCenter *data = [DataCenter sharedInstance];
//    NSInteger currentRow = data.currentRow;
//    self.navigationItem.title = [data.arrayName objectAtIndex:currentRow];
    self.navigationItem.title = [[DataCenter sharedInstance].arrayName objectAtIndex:[DataCenter sharedInstance].currentRow];
    
    //루트뷰의 백그라운드 컬러 및 테이블 뷰 생성
    self.view.backgroundColor = [UIColor blackColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor blackColor];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    [self.view addSubview:tableView];
    
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //    위의 코드는 셀 사이사이에 구분선 넣어주는 메소드임...none으로 하면 안보이도록 해주는 것이고...다른 옵션을 주어서 선을 넣는데 쓰임
    
}

//섹션 수는 디폴트로 1이 잡히지만 순서 외우기 용으로 일단 작성함
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//섹션당 로우 수 지정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

//셀의 디큐설정 및 셀 객체 생성 작성

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.view.frame.size.height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
