//
//  CustomTableViewCell.h
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView *profileImage;
@property (nonatomic, weak) UILabel *titleName;
@property (nonatomic, weak) UILabel *developerName;

@property (nonatomic, weak) UIImageView *headerImage;

@property (nonatomic, weak) UILabel *descriptionText;

@end
