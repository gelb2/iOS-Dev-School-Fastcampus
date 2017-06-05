//
//  DiaryTableViewCell.h
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *dayNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayStringLabel;
@property (weak, nonatomic) IBOutlet UILabel *diaryLabel;


@end
