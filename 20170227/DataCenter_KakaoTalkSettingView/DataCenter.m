//
//  DataCenter.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

//싱글턴 활용해보기

+ (instancetype)sharedInstance{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    
    
    return dataCenter;
}

//- (instancetype)init {
//    
//    self = [super init];
//    if (self) {
//        
//        self.textForHeader = @"1234";
//    }
//    return self;
//}

//한 뷰 컨트롤러에 뿌려줄 데이터를 모조리 저장하는 역할이 데이터센터의 역할이고
//데이터센터는 모든 뷰컨트롤러와 객체들이 바라볼 수 있는 클라우드의 개념임


- (NSString*)test{
    NSString *test = @"11 bit studios s.a. >";
    self.textForHeader = test;
    return self.textForHeader;
}

- (NSArray *)settingArrayName{

    NSArray *arrayName = [[NSArray alloc]initWithObjects:@"Shadowgun", @"Implosion", @"MonumentValley", @"Transistor", @"Abyssrium", @"Bastion", @"This War Of Mine", @"InfinityBlade", @"Prune", @"Tengami", @"DeadTrigger2", @"AssasinCreed:Identity", @"Never Alone", nil];

    self.arrayName = arrayName;
//텍스트 데이터 뿌려주기 위한 어레이 생성 및 기존 숫자 데이터에서 스트링 데이터로 수정

    return self.arrayName;
}

- (NSArray *)settingArrayImage{
    NSArray *arrayImage = @[@"shadowgun.jpg", @"implosion.png", @"monumentvalley.jpg", @"transistor.png", @"abyssrium.jpg", @"bastion.jpg", @"thiswarofmine.jpg", @"infinityblade.jpg", @"prune.jpg", @"Tengami.jpg", @"DeadTrigger2.png", @"AssasinCreedIdentity.jpg", @"NeverAlone.jpg"];
    
    self.arrayImage = arrayImage;
    
    return self.arrayImage;
}

-(NSArray *)settingArrayDeveloper{
    NSArray *arrayDeveloper = @[@"MadfingerGames",@"Rayark inc",@"usTwo Games",@"Supergiant Games",@"SangHeon Kim",@"Supergiant Games",@"11 bit studios s.a.",@"Chair Entertainment",@"Joel McDonald",@"Nyamyam",@"MadfingerGames",@"Ubisoft",@"E-line Media"];
    self.arrayDeveloper = arrayDeveloper;
    return self.arrayDeveloper;
    
}

-(NSArray *)settingArrayHeaderImage{
    NSArray *arrayHeaderImage = [[NSArray alloc]initWithObjects:@"shadowgunheader.jpg", @"implosionheader.png", @"monumentvalleyheader.jpg",@"transistorheader.jpg", @"abyssriumheader.jpg", @"bastionheader.jpg", @"thiswarofmineheader.jpg", @"infinitybladeheader.jpg", @"pruneheader.jpg", @"tengamiheader.jpg", @"deadtrigger2header.jpg", @"assasincreedheader.jpg", @"neveraloneheader.jpg", nil];
    
    self.arrayHeaderImage = arrayHeaderImage;
    
    return self.arrayHeaderImage;
    
    
}

@end
