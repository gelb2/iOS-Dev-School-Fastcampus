//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by ji jun young on 2017. 2. 27..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *test3;

@property (nonatomic, weak) IBOutlet UIView *testView;

@property (nonatomic, weak) IBOutlet UIView *test2;

@property (nonatomic, weak) IBOutlet UILabel *testLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttonMadebyStoryBoard;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollStoryBoard;


//iboutlet을 적어주면 스토리보드에서 아울렛 연결이 가능함
//헤더파일이 아닌 엠파일에 프로퍼티를 작성해도 아울렛 연결 가능함
//스토리보드의 아울렛 연결해주는 공간 가서 드래그 해서 만들어 둔 뷰에 드래그 하면 연결됨
//스토리보드에서 회색으로 뷰를 설정했으나, 코드로 블루컬러를 주니 바뀜
//스토리보드에 올리면 그것은 그 자체로 Addsubview 된 것임
//스토이보드에 없는 것은 코드로 쳐야 한다고 봐야 함
//만일 코드에서 프로퍼티 이름을 바꾸면, 스토리보드 상에서 느낌표가 뜬다(없는 이름에 연결되어 있으므로...실행하면 뻑남
//코드에서 변경이 되면, 무조건 스토리보드에서 확인을 해줘야 함
//스토리보드에서 만든 객체들은 클릭+컨트롤+코드부분으로 드래그 하면 바로 추가 가능함
//스토리보드--뷰컨트롤러--에디터--임베드 인--네비게이션 컨트롤러 ----> 그리고 특정 뷰의 버튼 ---> 컨트롤+ 다른 뷰로 드래그 하면 뷰 간 이동 구현 가능함
//테이블뷰의 델리게이트와 데이터소스의 경우는 스토리보드에서도 연결 가능함...이 연결은 self.delegate = self; 를 의미함 ---> 코드상으로는 <ui~~~delegate, ui~~~datasource>는 직접 써주어야 함
//
//하단의 코드를 작성하고, 스토리보드에서 identifier를 cell로 직접 지정해 주어야 함
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//
//cell.textLabel.text = @"1";
//
//return cell;
//}




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
  self.testView.backgroundColor = [UIColor blueColor];
    
    
    
}


- (IBAction)btnAction:(UIButton *)sender{
    
    self.testLabel.text = @"테스트 중임";
    
    
}

- (IBAction)buttonActionStoryBoard:(UIButton *)sender {
    
    self.buttonMadebyStoryBoard.titleLabel.text = @"스토리보드로 만든 버튼 테스트 중임";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
