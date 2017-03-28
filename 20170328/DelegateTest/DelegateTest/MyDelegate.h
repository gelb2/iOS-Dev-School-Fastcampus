//
//  MyDelegate.h
//  DelegateTest
//
//  Created by ji jun young on 2017. 3. 28..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol mySampleDelegate;

@interface MyDelegate : NSObject

@property (weak, nonatomic) id<mySampleDelegate> delegate;

@end


@protocol mySampleDelegate <NSObject>

@required

- (void)requiredDelegate;

@optional

-(void)optionalDelegate;

@end
