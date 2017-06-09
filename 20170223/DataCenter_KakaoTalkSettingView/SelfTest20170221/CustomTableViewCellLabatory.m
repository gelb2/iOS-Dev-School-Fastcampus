//
//  CustomTableViewCellLabatory.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "CustomTableViewCellLabatory.h"

@interface CustomTableViewCellLabatory ()



@end

@implementation CustomTableViewCellLabatory

//////////////////////* 셀 관련 세팅 *////////////////////////

- (void)makingCustomCellObject{
    //테이블뷰에 실릴 텍스트 어레이로 정렬 및 이미지 뷰 세팅
    self.textArray = [[NSArray alloc]initWithObjects:@"일정 간편 등록",@"키워드 알림",@"우박 내리는 채팅방",@"롱탭검색", @"나의 위치 체크", @"개발자 출몰 지역 확인", nil];
    //루트 뷰에 총괄용 빅 뷰 올림
    UIView *bigView = [[UIView alloc]init];
    self.bigView = bigView;
    [self.contentView addSubview:self.bigView];
    
    //헤더 부분용 이미지 삽입 및 뷰 삽입
    UIImageView *headerImage = [[UIImageView alloc]init];
    self.headerImage = headerImage;
    self.headerImage.image = [UIImage imageNamed:@"kakaoLabatory.jpg"];
}

- (void)settingCell{
    const CGFloat MARGIN = 5;
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    self.bigView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width, MARGIN * 10);
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.bigView.backgroundColor = [UIColor whiteColor];
}



// 헤더 부분 세팅 관련 메소드
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *headerView = [[UIView alloc]
//    
//    return headerView;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 300;
//}


//////////////////////////* 초기화 메소드 재정의 *///////////////////////////
//
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self settingCell];
        [self makingCustomCellObject];
//      그리는 메소드, 배경색 칠하는 메소드 등 들어갈 자리
    }
    return self;
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
