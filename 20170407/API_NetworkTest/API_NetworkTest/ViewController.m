//
//  ViewController.m
//  API_NetworkTest
//
//  Created by ji jun young on 2017. 4. 7..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"
#import "NetworkModule.h"
#import "DataCenter.h"
#import "MainTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *categoryButton;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) UIImageView *headerImageView;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [NetworkModule getPostListWithCompletionBlock:^(BOOL isSuccess, NSDictionary *result) {
//        
//        NSLog(@"viewdidload에서 네트워크 모듈 메소드를 호출함");
//    }];
    
//    [[DataCenter sharedInstance] receivingServerData];
    
//    [[DataCenter sharedInstance] changingArraytoDic];

    
    /**************** tableView Setting ********************************/
    
    //    UITableView *mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStylePlain];
    //    self.mainTableView = mainTableView;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    //    [self.view addSubview:self.mainTableView];
        [[DataCenter sharedInstance]receiveServerDataWithCompletionBlock:^(BOOL isSuccess) {
            if (isSuccess) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mainTableView reloadData];
                    NSLog(@"ReceivingServerData and ReloadingData is Completed");
                });
            }else{
                NSLog(@"ReceivingServerData and ReloadingData is Failed");
            }
        }];

     /**************** Deprecated due to if/else issue ***********************/
    //    [[DataCenter sharedInstance] receivingServerDatawithCompletionBlock:^{
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self.mainTableView reloadData];
    //        });
    //
    //        NSLog(@"receivingServerDatawithCompletionBlock, reloadData");
    //    }];

}

/**************** tableviewDelegate ********************************/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ([DataCenter sharedInstance].networkDataArray.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**************** Deprecated. currentRow is replaced by networkDataArray ***********************/
//    [DataCenter sharedInstance].currentRow = indexPath.row;
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
    cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    /**************** changing cell text with networkDataArray ********************************/
    NSDictionary *temp = [[DataCenter sharedInstance].networkDataArray objectAtIndex:indexPath.row];
    
    //cell이 별도의 메소드를 사용해서 불러오는 것 보다는 하단의 방법으로 텍스트와 이미지를 바꾸는 것이 더 낫다고 함
    //왜냐하면 tableview의 dataSource가 self(ViewController) 이므로
    cell.tutorNameLabel.text = [[temp objectForKey:@"tutor"] objectForKey:@"name"];
    cell.titleLabel.text = [temp objectForKey:@"title"];
    cell.tuteeCountNumberLabel.text = [NSString stringWithFormat:@"%@", [temp objectForKey:@"registration_count"]];
    
    /**************** changing cell image with networkDataArray ********************************/
    NSString *titleImageViewURL = [NSString stringWithFormat:@"%@", [temp objectForKey:@"cover_image"]];
    NSURL *titleURL = [NSURL URLWithString:titleImageViewURL];
    cell.titleImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:titleURL]];
    
    NSString *profileImageViewURL = [NSString stringWithFormat:@"%@", [[temp objectForKey:@"tutor"] objectForKey:@"profile_image"]];
    NSURL *profileURL = [NSURL URLWithString:profileImageViewURL];
    cell.profileImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:profileURL]];
    
    //해당 코드는 메인스레드에서 돌아가는 코드임...따라서 이미지를 여러개 불러올 경우엔 이미지가 다 불러질 때까지 기다리게 됨...따라서 ui도 안먹히게 됨...즉 비동기 처리를 해줘야 함
    
//    NSLog(@"%ld", [DataCenter sharedInstance].currentRow);
    
    /**************** Deprecated due to setting tableView Data issue ***********************/
//    [cell settingText:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MainTableViewCell *cell= [[MainTableViewCell alloc]init];
//    heightForRow = cell.mainView.frame.size.height;
    
//    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    return cell.frame.size.height;

    
    return 200;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
