//
//  DiaryYearViewController.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryYearViewController.h"
#import "DiaryDataCenter.h"
#import "DiaryYearCollectionViewCell.h"

@interface DiaryYearViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *yearCollectionView;
@property (nonatomic) NSMutableArray* yearMutableArray;

@end

@implementation DiaryYearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.titleLabel.text = [presentDa]
    //
    //    NSLocale* currentLocale = [NSLocale currentLocale];
    //    [[NSDate date] descriptionWithLocale:currentLocale];
    //    or use
    //
    //    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    //    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"yyyy / MM / dd"];
//    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
//    self.titleLabel.text = [dateFormatter stringFromDate:[NSDate date]];
//    [self.postingTextView isFirstResponder];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"yyyy"];
//    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    self.yearCollectionView.delegate = self;
    self.yearCollectionView.dataSource = self;
    
    NSMutableArray *yearMutableArray = [[NSMutableArray alloc]initWithCapacity:7];
    self.yearMutableArray = yearMutableArray;
    for (NSInteger i = 0; i <= 7; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy"];
        NSString *tempYearString;
        tempYearString = [dateFormatter stringFromDate:[NSDate date]];
        NSInteger tempYearInteger;
        tempYearInteger = [tempYearString integerValue];
        NSInteger yearInteger;
        yearInteger = tempYearInteger - i;
        NSString *yearString = [NSString stringWithFormat:@"%ld", yearInteger];
        [self.yearMutableArray addObject: yearString];
//        NSLog(@" 이어 뮤터뷸 어레이 %@", self.yearMutableArray);
        
    }
    
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    [DiaryDataCenter sharedInstance].integerRow = indexPath.row;
    DiaryYearCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.yearButton setTitle:[self.yearMutableArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    
    return cell;
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
