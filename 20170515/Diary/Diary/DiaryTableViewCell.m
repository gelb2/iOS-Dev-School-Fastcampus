//
//  DiaryTableViewCell.m
//  Diary
//
//  Created by ji jun young on 2017. 5. 15..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DiaryTableViewCell.h"

@interface DiaryTableViewCell ()


@end


@implementation DiaryTableViewCell

- (void)makingCustomCellObject{
    
    
    
}

- (void)settingCustomCellObject{
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            [self makingCustomCellObject];
            [self settingCustomCellObject];
        }
        return self;
}

- (void)layoutSubviews{
    
    [self settingCustomCellObject];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
