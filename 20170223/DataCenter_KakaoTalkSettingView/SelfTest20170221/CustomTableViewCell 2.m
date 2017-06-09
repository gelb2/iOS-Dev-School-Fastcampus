//
//  CustomTableViewCell.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "DataCenter.h"
#import "ViewControllerFourth.h"

@interface CustomTableViewCell ()

//커스텀 셀 만들기의 소스코드를 재활용 및 수정함

@property (nonatomic, weak) UIView *bigView;

@property (nonatomic, weak) UIView *imageViewForDeveloper;
@property (nonatomic, weak) UILabel *placeTitle;

@property (nonatomic, weak) UIView *imageViewForTime;


@property (nonatomic, weak) UIView *imageViewForMeter;

@property (nonatomic, weak) UIView *descriptionView;

//@property (nonatomic, weak) UIImageView *profileImage;
//@property (nonatomic, weak) UILabel *titleName;
//@property (nonatomic, weak) UILabel *developerName;
//
//@property (nonatomic, weak) UIImageView *headerImage;
//
//@property (nonatomic, weak) UILabel *descriptionText;




//셀에 들어가야 할 뷰, 이미지 뷰, 텍스트용 레이블을 각 프로퍼티로 선언함

@end

@implementation CustomTableViewCell

///////////////////////////*노티피케이션센터용 포스트 메소드 작성 *////////////////////////////

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
    //싱글턴을 사용해 어레이로 정렬한 이미지를 불러옴
    self.profileImage.image = [UIImage imageNamed:[[DataCenter sharedInstance].arrayImage objectAtIndex:[DataCenter sharedInstance].currentRow]];
    [self.profileImage setClipsToBounds:YES];
    [self.imageViewForDeveloper addSubview:profileImage];
    
    UILabel *titleName = [[UILabel alloc]init];
    self.titleName = titleName;
    titleName.font = [UIFont boldSystemFontOfSize:15];
    titleName.textColor = [UIColor whiteColor];
    self.titleName.text = [[[DataCenter sharedInstance]settingArrayName] objectAtIndex:[DataCenter sharedInstance].currentRow];
    [self.imageViewForDeveloper addSubview:titleName];
    
    //데이터센터 스트링 써보기
    //싱글턴을 활용하여 데이터센터의 어레이를 만든 후 불러오기
    UILabel *developerName = [[UILabel alloc]init];
    self.developerName = developerName;
    [developerName setTextColor:[UIColor lightGrayColor]];
    developerName.font = [UIFont systemFontOfSize:12];
    self.developerName.text = [[[DataCenter sharedInstance] settingArrayDeveloper] objectAtIndex:[DataCenter sharedInstance].currentRow];
    [self.imageViewForDeveloper addSubview:developerName];
    
    //데이터센터 스트링 써보기
    //게임 별 커스텀 셀 위에 들어갈 헤더 이미지를 데이터센터 어레이에서 불러옴
    UIImageView *headerImage = [[UIImageView alloc]init];
    self.headerImage = headerImage;
    //하단의 코드는 앱 델리게이트 부분에서 데이터센터 객체가 setting으로 시작되는 어레이 관련 메소드를 호출 해 주었으므로, 호출 후에 세팅된 어레이 값에 접근 가능하므로 작동 가능한 것임
    self.headerImage.image = [UIImage imageNamed:[[DataCenter sharedInstance].arrayHeaderImage objectAtIndex:[DataCenter sharedInstance].currentRow]];
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
    self.descriptionText.text = [[DataCenter sharedInstance].arrayDescriptionText objectAtIndex:[DataCenter sharedInstance].currentRow];
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


//빅뷰의 사이즈를 컨텐츠뷰에 맞춰줌
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
