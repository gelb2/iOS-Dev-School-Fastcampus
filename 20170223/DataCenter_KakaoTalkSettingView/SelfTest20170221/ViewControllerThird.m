//
//  ViewControllerThird.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 21..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewControllerThird.h"
#import "ViewController.h"


@interface ViewControllerThird ()
<UITableViewDelegate, UITableViewDataSource>

@property NSArray *textArraySection0;
@property NSArray *textArraySection1;

@property UISwitch *switchForSearchingFriend;
@property UISwitch *switchForRecommendingFriend;
@property UISwitch *switchForSyncingFriendName;


@property UITableView *mainTableView;

@end

@implementation ViewControllerThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Friend";
    
    //////////////////테이블뷰 생성//////////////////////////
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.view addSubview:tableView];
    self.mainTableView = tableView;
    
//    초기 뷰 생성 테스트용 라벨 만드는 코드...필요 없으므로 주석처리함
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
//    [label setText:@"ViewControllerThird"];
//    [self.view addSubview:label];
    
}

//섹션의 로우 갯수 지정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else if(section == 1){
        return 1;
    }
    else if(section == 2){
        return 1;
    }
    else{
        return 2;
    }
}

//테이블뷰의 섹션 갯수 지정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}

//cellforrowatindexpath + 디큐 설정

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //스위치의 켜고 끔 저장 되도록 설정함
    //스위치의 켜고 끔은 스위치라는 객체가 그려지는 시점과도 연관되어 있음, 즉 켜고 끔을 저장하도록 boolforkey로 스위치.on 프로퍼티에 YES값을 넣어주는 것은 스위치 객체가 그려진 이후에 진행되어야 함...스위치 객체가 그려지기 이전에 메소드가 호출되면 프로퍼티로 선언되어 있는 스위치는 nil값이므로 "메소드를 들어줄 객체"가 없는 상황임
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"자동 친구 추가";
            self.switchForSearchingFriend = [[UISwitch alloc]initWithFrame:CGRectZero];
            cell.accessoryView = self.switchForSearchingFriend;
            [self.switchForSearchingFriend addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
            self.switchForSearchingFriend.tag = 0;
            
            self.switchForSearchingFriend.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"1"];
//            [self.switchForSearchingFriend addTarget:self action:@selector(savingSwitchClick:) forControlEvents:UIControlEventValueChanged];
        } else {
            cell.textLabel.text = @"친구 목록 새로고침";
            
        }
    }
    //스위치의 켜고 끔 저장 되도록 설정함
    //스위치의 켜고 끔은 스위치라는 객체가 그려지는 시점과도 연관되어 있음, 즉 켜고 끔을 저장하도록 boolforkey로 스위치.on 프로퍼티에 YES값을 넣어주는 것은 스위치 객체가 그려진 이후에 진행되어야 함...스위치 객체가 그려지기 이전에 메소드가 호출되면 프로퍼티로 선언되어 있는 스위치는 nil값이므로 "메소드를 들어줄 객체"가 없는 상황임
    
    else if(indexPath.section == 1){
        cell.textLabel.text = @"친구 추천 허용";
        self.switchForRecommendingFriend = [[UISwitch alloc]initWithFrame:CGRectZero];
        cell.accessoryView = self.switchForRecommendingFriend;
        [self.switchForRecommendingFriend addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
        self.switchForRecommendingFriend.tag = 1;
        
        self.switchForRecommendingFriend.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"2"];
//        [self.switchForRecommendingFriend addTarget:self action:@selector(savingSwitchClick:) forControlEvents:UIControlEventValueChanged];
        
    }
    //스위치의 켜고 끔 저장 되도록 설정함
    //스위치의 켜고 끔은 스위치라는 객체가 그려지는 시점과도 연관되어 있음, 즉 켜고 끔을 저장하도록 boolforkey로 스위치.on 프로퍼티에 YES값을 넣어주는 것은 스위치 객체가 그려진 이후에 진행되어야 함...스위치 객체가 그려지기 이전에 메소드가 호출되면 프로퍼티로 선언되어 있는 스위치는 nil값이므로 "메소드를 들어줄 객체"가 없는 상황임
    
    else if(indexPath.section == 2){
        cell.textLabel.text = @"친구 이름 동기화";
        self.switchForSyncingFriendName = [[UISwitch alloc]initWithFrame:CGRectZero];
        cell.accessoryView = self.switchForSyncingFriendName;
        [self.switchForSyncingFriendName addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
        self.switchForSyncingFriendName.tag = 2;
        
        self.switchForSyncingFriendName.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"3"];
//        [self.switchForSyncingFriendName addTarget:self action:@selector(savingSwitchClick:) forControlEvents:UIControlEventValueChanged];
    }
        else{
            if (indexPath.row == 0) {
                cell.textLabel.text = @"숨김친구 관리";
            } else {
                cell.textLabel.text = @"차단친구 관리";
            }
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    
    
    //    ////////////스위치 만들기//////////////////////
    //    UISwitch *turnOnOff = [[UISwitch alloc]initWithFrame:CGRectMake(20, 100, 50, 50)];
    //    [tableView addSubview:turnOnOff];
    //    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    //    aCell.accessoryView = switchView;
    //    [switcher addTarget:self action:@selector(switcherClick:) forControlEvents:UIControlEventValueChanged];
    //  self.accessoryView = switcher;
     //}
//
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"친구 추가 설정";
            break;
        case 1:
            return @"친구 추천 설정";
            break;
        case 2:
            return @" 친구 동기화 설정";
            break;
        case 3:
            return @" 친구 관리";
            break;
            
        default:
            return @" ";
            break;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"일단 연락처에 번호가 있는지 부터 확인해보자";
            break;
        case 1:
            return @"추천은 할 건데, 그냥 랜덤으로 추천할거야";
            break;
        case 2:
            return @"앞에서도 말했지만, 일단 연락처에 번호가 있는지 부터 확인해보자";
            break;

        default:
            return @" ";
            break;
    }
    
    
    
}

- (void)switchClick:(UISwitch*)sender{
    if ([sender isOn]) {
        if ([sender isEqual:self.switchForSearchingFriend]) {
            NSLog(@"자동으로 친구가 추가됩니다");
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"1"];
            
        }
        else if(sender == self.switchForRecommendingFriend){
            NSLog(@"친구 추천 기능이 허용됩니다");
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"2"];
            
        }
        else if([sender isEqual:self.switchForSyncingFriendName]){
            NSLog(@"친구 이름이 동기화됩니다");
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"3"];
            
        }
    }
    if (sender.on != YES) {
        if (sender == self.switchForSearchingFriend) {
            NSLog(@"친구추가 설정이 삭제되었습니다");
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"1"];
        }
        else if([sender isEqual:self.switchForRecommendingFriend]){
            NSLog(@"친구추천 설정이 삭제되었습니다");
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"2"];
        }
        else if(sender == self.switchForSyncingFriendName){
            NSLog(@"친구이름 동기화 설정이 삭제되었습니다");
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"3"];
            
        }
    }
    
    
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
