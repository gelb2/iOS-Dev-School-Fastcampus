//
//  CustomTableViewCell.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "DataCenter.h"

@interface CustomTableViewCell ()

//커스텀 셀 만들기의 소스코드를 재활용 및 수정함

@property (nonatomic, weak) UIView *bigView;

@property (nonatomic, weak) UIView *imageViewForDeveloper;
@property (nonatomic, weak) UIImageView *profileImage;
@property (nonatomic, weak) UILabel *titleName;
@property (nonatomic, weak) UILabel *developerName;

@property (nonatomic, weak) UIImageView *headerImage;
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
    
    UIView *imageViewForDeveloper = [[UIView alloc]init];
    self.imageViewForDeveloper = imageViewForDeveloper;
    [self.bigView addSubview:imageViewForDeveloper];
    
    
    UIImageView *profileImage = [[UIImageView alloc]init];
    self.profileImage = profileImage;
    self.profileImage.image = [UIImage imageNamed:@"thiswarofmine.jpg"];
    [self.profileImage setClipsToBounds:YES];
    [self.imageViewForDeveloper addSubview:profileImage];
    
    UILabel *titleName = [[UILabel alloc]init];
    self.titleName = titleName;
    titleName.font = [UIFont boldSystemFontOfSize:15];
    titleName.textColor = [UIColor whiteColor];
    self.titleName.text = @"This War of Mine";
    [self.imageViewForDeveloper addSubview:titleName];
    
    //데이터센터 스트링 써보기
    UILabel *developerName = [[UILabel alloc]init];
    self.developerName = developerName;
    [developerName setTextColor:[UIColor lightGrayColor]];
    developerName.font = [UIFont systemFontOfSize:12];
    
    //싱글턴을 활용하여 스트링을 불러옴...//    @“11 bit studios s.a. >”;
    self.developerName.text = [[DataCenter sharedInstance] test];
    [self.imageViewForDeveloper addSubview:developerName];
    
    UIImageView *headerImage = [[UIImageView alloc]init];
    self.headerImage = headerImage;
    self.headerImage.image = [UIImage imageNamed:@"thiswarofmineheader.jpg"];
    [self.bigView addSubview:headerImage];
    
    
    UIView *descriptionView = [[UIView alloc]init];
    self.descriptionView = descriptionView;
    descriptionView.backgroundColor = [UIColor blackColor];
    [self.bigView addSubview:descriptionView];
    
    UILabel *descriptionText = [[UILabel alloc]init];
    self.descriptionText = descriptionText;
    descriptionText.textColor = [UIColor lightGrayColor];
    descriptionText.font = [UIFont systemFontOfSize:12];
    descriptionText.textAlignment = NSTextAlignmentCenter;
    [self.descriptionText setLineBreakMode:NSLineBreakByWordWrapping];
    [self.descriptionText setNumberOfLines:0];
    self.descriptionText.text = @"If you've not already played this brilliant, heart-wrenching game, then mobile is as good a place as any to let it completely destroy you. 9/10, Pocket Gamer UK";
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
    self.imageViewForDeveloper.frame = CGRectMake(offsetX, offsetY, self.bigView.frame.size.width - (MARGIN*2), 70);
    
    offsetX += MARGIN*2;
    offsetY += MARGIN*2;
    
    //사용자 사진 뷰의 좌표 및 크기
    self.profileImage.frame = CGRectMake(offsetX, offsetY, self.imageViewForDeveloper.frame.size.height - (MARGIN*5), self.imageViewForDeveloper.frame.size.height - (MARGIN*5));
    
    offsetX += self.imageViewForDeveloper.frame.size.height - (MARGIN*4) + MARGIN;
    offsetY = MARGIN*2;
    
    //사용자 이름 뷰의 좌표 및 크기
    self.titleName.frame = CGRectMake(offsetX, offsetY, self.imageViewForDeveloper.frame.size.width - offsetX - MARGIN, (self.imageViewForDeveloper.frame.size.height - (MARGIN *2)) / 2);
    
    offsetY += (self.imageViewForDeveloper.frame.size.height - (MARGIN *2)) / 3;
    
    //사용자 지역 뷰의 좌표 및 크기
    self.developerName.frame = CGRectMake(offsetX, offsetY, self.imageViewForDeveloper.frame.size.width - offsetX - MARGIN, (self.imageViewForDeveloper.frame.size.height - (MARGIN *2)) / 2);
    
    offsetX = MARGIN;
    offsetY = MARGIN + self.imageViewForDeveloper.frame.size.height;
    
    //사용자가 방문한 장소 뷰의 좌표 및 크기
    self.headerImage.frame = CGRectMake(offsetX, offsetY, self.bigView.frame.size.width - (MARGIN*2), 200);
    offsetX = MARGIN*3;
    offsetY = (self.headerImage.frame.size.height / 2) - 50;
    
    //사용자가 방문한 장소 설명 뷰와 레이블의 좌표 및 크기
    offsetX = MARGIN;
    offsetY = MARGIN + self.imageViewForDeveloper.frame.size.height + self.headerImage.frame.size.height;
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
    
    self.imageViewForDeveloper.backgroundColor = [UIColor blackColor];
    self.contentView.backgroundColor = [UIColor blackColor];
    self.descriptionView.backgroundColor = [UIColor blackColor];
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
