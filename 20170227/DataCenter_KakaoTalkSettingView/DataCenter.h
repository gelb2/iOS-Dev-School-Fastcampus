//
//  DataCenter.h
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 23..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property NSString *textForHeader;

@property NSArray *arrayName;

@property NSArray *arrayImage;

@property NSArray *arrayDeveloper;

@property NSArray *arrayHeaderImage;

//싱글턴객체는 프로그램이 종료될 때까지 살아 있고, 새로운 값을 넣으면 차후에 다른 값을 넣을 때까지 해당 값으로 작동된다. 따라서
// viewcontrollerFourth의 didselectRowAtIndexPath에서 indexpath.row 값을 currentRow값에 넣어준 것임
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//[DataCenter sharedInstance].currentRow = indexPath.row;
@property NSInteger currentRow;

+ (instancetype)sharedInstance;

- (NSString*)test;

- (NSArray *)settingArrayName;

- (NSArray *)settingArrayImage;

-(NSArray *)settingArrayDeveloper;

-(NSArray *)settingArrayHeaderImage;

@end
