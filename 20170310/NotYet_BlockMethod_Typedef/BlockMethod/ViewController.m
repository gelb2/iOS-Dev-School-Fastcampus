//
//  ViewController.m
//  BlockMethod
//
//  Created by ji jun young on 2017. 3. 10..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "ViewController.h"


//타입 별칭 연습
typedef NS_ENUM(NSUInteger, HSRecipeTime){
    HSRecipeTimeTo5min, //5분 이하
    HSRecipeTimeTo10min, //10분 이하
    HSRecipeTimeTo15min, //15분 이하
    
};

typedef NS_ENUM(NSUInteger, HSRecipeMoney){
    HSRecipeMoneyTo5000, //5000원 이하
    HSRecipeMoneyTo10000, //10000원 이하
    HSRecipeMoneyTo15000, //15000원 이하
};


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *bigView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    ///////////////* 블록함수 연습 *////////////////////
    
    void (^simpleBlock)(void);
    simpleBlock = ^{
        NSLog(@"블록함수 테스트");
    };
    
    
    void (^simpleBlock2)(void) = ^{NSLog(@"블록함수 테스트2");
    };
    
    simpleBlock();
    simpleBlock2();
    
    double (^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue){
        return firstValue * secondValue;
        
    };
    
    double result = multiplyTwoValues(2,4);
    NSLog(@"두 수의 곱은 %f입니다", result);
    
    [self testMethod];
    [self testMethod2];
    
    
}

- (void)testMethod{
    
   NSInteger anInteger = 42;
    void (^testBlock)(void) = ^{
        NSLog(@"입력된 인티저 값은 %li", anInteger);
        };
    anInteger = 84;
    testBlock();
    NSLog(@"두번째 인티저 값은 %li", anInteger);
}

- (void)testMethod2{
    __block NSInteger anInteger = 58;
    void (^testBlock)(void) = ^{
        NSLog(@"integer is %li", anInteger);
        anInteger = 100;
    };
    testBlock();
        NSLog(@"orginal is %li", anInteger);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
