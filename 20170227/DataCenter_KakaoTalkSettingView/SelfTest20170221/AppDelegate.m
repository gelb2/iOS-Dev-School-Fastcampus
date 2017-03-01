//
//  AppDelegate.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 21..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "AppDelegate.h"
#import "DataCenter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //데이터 센터 세팅...앱 델리게이트의 didfinishlaunch 는 앱. 실행 시 가장 먼저 불리는 부분이므로
    [[DataCenter sharedInstance] settingArrayName];
    [[DataCenter sharedInstance] settingArrayImage];
    [[DataCenter sharedInstance] settingArrayDeveloper];
    [[DataCenter sharedInstance] settingArrayHeaderImage];
    [[DataCenter sharedInstance] settingArrayDescriptionText];
//상단의 코드에서 데이터센터 세팅 및 메소드 호출을 하지 않으면, 하단의 코드는 오작동이 남...setting이하 메소드들이 호출되지 않아 값이 세팅되지 않았으므로. 하단 코드는 nil값을 불러오게 되므로 오작동이 남
    //    self.headerImage.image = [UIImage imageNamed:[[DataCenter sharedInstance].arrayHeaderImage objectAtIndex:[DataCenter sharedInstance].currentRow]];
    //앱 델리게이트에서 상단 코드로 메소드를 호출하고 싶지 않다면, 하단에서 처럼 해당 셀이나 뷰 컨트롤러에서 데이터센터의 메소드를 호출해서 값을 세팅해주는 방법도 있음
//    self.developerName.text = [[[DataCenter sharedInstance] settingArrayDeveloper] objectAtIndex:[DataCenter sharedInstance].currentRow];
    
    
    //메인 윈도우 하나 만듬
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //스토리보드 하나 만듬
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    //네비게이션바를 소유해줄 뷰컨트롤러 객체 하나 만듬
//    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    
    
    //네비게이션바 하나 만듬
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:vc];
    
    //네비게이션바를 루트뷰로 올림
    self.window.rootViewController = navigationController;
    
    //윈도우를 보이도록 함
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
