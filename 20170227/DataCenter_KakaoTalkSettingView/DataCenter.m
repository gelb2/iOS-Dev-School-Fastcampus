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

-(NSArray *)settingArrayDescriptionText{
    NSArray *arrayDescriptionText = [[NSArray alloc]initWithObjects:@"They’ve made what could be the best multiplayer shooting experience on a mobile device.“ – TouchGen",@"Features: Stunning console-quality graphics, first-class voice acting and Hollywood-grade audio production.",@"The player leads the princess Ida through mazes of optical illusions and impossible objects while manipulating the world around her to reach various platforms.",@"FROM THE CREATORS OF BASTION: Experience a science fiction action RPG like no other! Wield an extraordinary weapon of unknown origin as you fight through a stunning futuristic city.",@" AbyssRium is a game that helps relax your nerve. Level up your Stone, create your own fish and make the Aquarium belongs to you! A beautiful ocean world waiting for you to explore!",@"Bastion for iPad is just as good if not better than its console brethren.- TouchArcade (5 stars out of 5)",@"If you've not already played this brilliant, heart-wrenching game, then mobile is as good a place as any to let it completely destroy you. 9/10, Pocket Gamer UK",@"nfinity Blade was the fastest-grossing app in the history of iOS upon its release. It made US$1.6 million in its first four days, and over US$23 million by the end of 2011.",@"The visuals in Prune are stunningly beautiful. The game features a minimal look and feel to it, with rich, vibrant colors and deep blacks that contrast nicely with the creamy beige.",@"In Tengami you explore a beautifully crafted pop-up book world, with an art style inspired by traditional Japanese arts and crafts. Tengami is an atmospheric adventure game, full of wonder and mystery, set in Japan of ancient dark fairy tales. Flip, fold, slide and pull parts of the world to solve puzzles and discover secrets.",@"Take your part on saving the world and win unbelievable real prizes in specially designed tournaments. Earn the money every day from oil fields!",@"Explore the ITALIAN RENAISSANCE through the eyes of your OWN ASSASSIN, complete dozens of missions and unravel the epic mystery of The Crows.",@"When people think of mobile games, I know that one of the first few games that come to mind are endless runners or match-three puzzle games.", nil];
    self.arrayDescriptionText = arrayDescriptionText;
    
    return self.arrayDescriptionText;
    
    
}

@end
