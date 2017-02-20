//
//  CustomTableViewCell.m
//  CustomViewSelfTest_CopyingAppMainView
//
//  Created by ji jun young on 2017. 2. 19..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property (nonatomic, weak) UIView *bigView;

@property (nonatomic, weak) UIView *imageViewForAuthor;
@property (nonatomic, weak) UIImageView *profileImage;
@property (nonatomic, weak) UILabel *authorName;
@property (nonatomic, weak) UILabel *locationName;

@property (nonatomic, weak) UIImageView *placeImage;
@property (nonatomic, weak) UILabel *placeTitle;

@property (nonatomic, weak) UIView *imageViewForTime;


@property (nonatomic, weak) UIView *imageViewForMeter;

@property (nonatomic, weak) UIView *descriptionView;
@property (nonatomic, weak) UILabel *descriptionText;

//셀에 들어가야 할 뷰, 이미지 뷰, 텍스트용 레이블을 각 프로퍼티로 선언함

@end

@implementation CustomTableViewCell

//셀에 들어가야 할 뷰, 이미지 뷰, 텍스트용 레이블들을 모두 객체로 만들고, 폰트속성 잡아주는 메소드 작성
- (void)makingCustomCellObject{
    UIView *bigView = [[UIView alloc]init];
    self.bigView = bigView;
    [self.contentView addSubview:bigView];

    UIView *imageViewForAuthor = [[UIView alloc]init];
    self.imageViewForAuthor = imageViewForAuthor;
    [self.bigView addSubview:imageViewForAuthor];
    
    UIImageView *profileImage = [[UIImageView alloc]init];
    self.profileImage = profileImage;
    self.profileImage.image = [UIImage imageNamed:@"profile.jpg"];
    [self.imageViewForAuthor addSubview:profileImage];
    
    UILabel *authorName = [[UILabel alloc]init];
    self.authorName = authorName;
    authorName.font = [UIFont boldSystemFontOfSize:15];
    self.authorName.text = @"Jun Young Jee";
    [self.imageViewForAuthor addSubview:authorName];
    
    UILabel *locationName = [[UILabel alloc]init];
    self.locationName = locationName;
    [locationName setTextColor:[UIColor lightGrayColor]];
    locationName.font = [UIFont systemFontOfSize:12];
    self.locationName.text = @"Seoul, South Korea";
    [self.imageViewForAuthor addSubview:locationName];
    
    UIImageView *placeImage = [[UIImageView alloc]init];
    self.placeImage = placeImage;
    self.placeImage.image = [UIImage imageNamed:@"itaewon.jpg"];
    [self.bigView addSubview:placeImage];
    
    UILabel *placeTitle = [[UILabel alloc]init];
    self.placeTitle = placeTitle;
    placeTitle.font = [UIFont boldSystemFontOfSize:28];
    placeTitle.textColor = [UIColor whiteColor];
    self.placeTitle.text = @"Itaewon \nThe Hottest";
    self.placeTitle.numberOfLines = 0;
    [self.placeImage addSubview:placeTitle];
    
    UIView *descriptionView = [[UIView alloc]init];
    self.descriptionView = descriptionView;
    [self.bigView addSubview:descriptionView];
    
    UILabel *descriptionText = [[UILabel alloc]init];
    self.descriptionText = descriptionText;
    descriptionText.textColor = [UIColor grayColor];
    descriptionText.font = [UIFont systemFontOfSize:12];
    descriptionText.textAlignment = NSTextAlignmentCenter;
    [self.descriptionText setLineBreakMode:NSLineBreakByWordWrapping];
    [self.descriptionText setNumberOfLines:0];
    self.descriptionText.text = @"Seoul, especially Itaewon in YongSan District is hottest place in the world.";
    [self.descriptionView addSubview:descriptionText];
    
}


//그리는 메소드 작성

- (void) settingCustomCell{
    const CGFloat MARGIN = 5;
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    offsetX += MARGIN;
    offsetY += MARGIN;
    
    //전체 뷰와 사용자 사진 및 이름 뜨는 뷰의 좌표 및 크기
    self.bigView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - MARGIN*2, self.frame.size.height - MARGIN*2 + 10);
    self.imageViewForAuthor.frame = CGRectMake(offsetX, offsetY, self.bigView.frame.size.width - (MARGIN*2), 70);
    
    offsetX += MARGIN*2;
    offsetY += MARGIN*2;
    
    //사용자 사진 뷰의 좌표 및 크기
    self.profileImage.frame = CGRectMake(offsetX, offsetY, self.imageViewForAuthor.frame.size.height - (MARGIN*5), self.imageViewForAuthor.frame.size.height - (MARGIN*5));
    [self.profileImage.layer setCornerRadius:(self.imageViewForAuthor.frame.size.height-(MARGIN * 5)) / 2];
    [self.profileImage setClipsToBounds:YES];
    
    offsetX += self.imageViewForAuthor.frame.size.height - (MARGIN*4) + MARGIN;
    offsetY = MARGIN*2;
    
    //사용자 이름 뷰의 좌표 및 크기
    self.authorName.frame = CGRectMake(offsetX, offsetY, self.imageViewForAuthor.frame.size.width - offsetX - MARGIN, (self.imageViewForAuthor.frame.size.height - (MARGIN *2)) / 2);
    
    offsetY += (self.imageViewForAuthor.frame.size.height - (MARGIN *2)) / 3;
    
    //사용자 지역 뷰의 좌표 및 크기
    self.locationName.frame = CGRectMake(offsetX, offsetY, self.imageViewForAuthor.frame.size.width - offsetX - MARGIN, (self.imageViewForAuthor.frame.size.height - (MARGIN *2)) / 2);
    
    offsetX = MARGIN;
    offsetY = MARGIN + self.imageViewForAuthor.frame.size.height;
    
    //사용자가 방문한 장소 뷰의 좌표 및 크기
    self.placeImage.frame = CGRectMake(offsetX, offsetY, self.bigView.frame.size.width - (MARGIN*2), 200);
    offsetX = MARGIN*3;
    offsetY = (self.placeImage.frame.size.height / 2) - 50;
    
    //사용자가 방문한 장소 레이블의 좌표 및 크기
    self.placeTitle.frame = CGRectMake(offsetX, offsetY, self.placeImage.frame.size.width - (MARGIN*6), 80);
    //사용자가 방문한 장소 설명 뷰와 레이블의 좌표 및 크기
    offsetX = MARGIN;
    offsetY = MARGIN + self.imageViewForAuthor.frame.size.height + self.placeImage.frame.size.height;
    self.descriptionView.frame = CGRectMake(offsetX, offsetY, self.bigView.frame.size.width - (MARGIN*2), 70);
    self.descriptionText.frame = CGRectMake(offsetX, 0, self.descriptionView.frame.size.width - (MARGIN*4), 70);
    
}

//초기화 메소드에 객체 만들기, 셀 세팅, 뷰 컬러 설정 메소드 호출 집어넣음

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makingCustomCellObject];
        [self settingCustomCell];
        [self settingColor];
    }
    
    return self;
    
}

- (void)settingColor{
    
    self.imageViewForAuthor.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.descriptionView.backgroundColor = [UIColor whiteColor];
}


//빅뷰의 사이즈를 컨텐츠뷰에 맞춰주는 메소드를 오버라이드 해서 쓰는 것임
- (void)layoutSubviews{
    
    [self settingCustomCell];
    
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
