//
//  DiaryMonthViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryMonthViewController.h"
#import "DiaryMonthCollectionViewCell.h"
#import "DiaryDataCenter.h"

@interface DiaryMonthViewController ()
<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *monthCollectionView;
@property (nonatomic) NSArray* monthArray;


@end

@implementation DiaryMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.monthCollectionView.delegate = self;
    self.monthCollectionView.dataSource = self;
    self.monthArray = [[NSArray alloc]initWithObjects:@"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN", @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC", nil];
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    [DiaryDataCenter sharedInstance].integerRow = indexPath.row;
    DiaryMonthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.monthButton setTitle:[self.monthArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    return cell;
}

- (IBAction)monthButtonAction:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"JAN"]) {
        NSLog(@"JAN touched");
    }else if ([sender.titleLabel.text isEqualToString:@"FEB"]){
        NSLog(@"FEB touched");
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
