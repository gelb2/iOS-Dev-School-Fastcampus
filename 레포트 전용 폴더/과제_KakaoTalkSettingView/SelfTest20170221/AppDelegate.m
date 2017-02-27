//
//  AppDelegate.m
//  SelfTest20170221
//
//  Created by ji jun young on 2017. 2. 21..
//  Copyright © 2017년 Fastcampus. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //메인 윈도우 하나 만듬
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //스토리보드 하나 만듬
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    //네비게이션바를 소유해줄 뷰컨트롤러 객체 하나 만듬
//    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerFirst"];
    
    
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
