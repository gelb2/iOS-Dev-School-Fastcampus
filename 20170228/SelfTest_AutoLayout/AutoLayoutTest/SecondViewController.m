//
//  SecondViewController.m
//  AutoLayoutTest
//
//  Created by ji jun young on 2017. 2. 27..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomTableViewCell.h"

@interface SecondViewController ()
<UITableViewDelegate,UITableViewDataSource>


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.textLabel.text = @"1";
        
        return cell;

    } else {
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ttCell" forIndexPath:indexPath];
        cell.textLabel.text = @"FF";
        return cell;
    }
    
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
