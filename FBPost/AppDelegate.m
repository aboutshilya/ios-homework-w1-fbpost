//
//  AppDelegate.m
//  FBPost
//
//  Created by Shilya Lee on 6/9/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RestViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Init all tab views here
    ViewController *NFViewController = [[ViewController alloc] init];
    UINavigationController *NFNavController = [[UINavigationController alloc] initWithRootViewController:NFViewController];
    NFNavController.tabBarItem.title = @"News Feed";
    NFNavController.tabBarItem.image = [UIImage imageNamed:@"news-feed"];
    
    RestViewController *RQViewController = [[RestViewController alloc] init];
    
    UINavigationController *RQNavController = [[UINavigationController alloc] initWithRootViewController:RQViewController];
    
    RQNavController.tabBarItem.title = @"Requests";
    RQNavController.tabBarItem.image = [UIImage imageNamed:@"request-icon"];
    
    RestViewController *MSGViewController = [[RestViewController alloc] init];
    
    UINavigationController *MSGNavController = [[UINavigationController alloc] initWithRootViewController:MSGViewController];
    
    MSGNavController.tabBarItem.title = @"Messages";
    MSGNavController.tabBarItem.image = [UIImage imageNamed:@"message-icon"];
    
    RestViewController *NotiViewController = [[RestViewController alloc] init];
    
    UINavigationController *NotiNavController = [[UINavigationController alloc] initWithRootViewController:NotiViewController];
    
    NotiNavController.tabBarItem.title = @"Notifications";
    NotiNavController.tabBarItem.image = [UIImage imageNamed:@"notification-icon"];
    
    RestViewController *MoreViewController = [[RestViewController alloc] init];
    
    UINavigationController *MoreNavController = [[UINavigationController alloc] initWithRootViewController:MoreViewController];
    
    MoreNavController.tabBarItem.title = @"More";
    MoreNavController.tabBarItem.image = [UIImage imageNamed:@"more-icon"];

    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[NFNavController, RQNavController, MSGNavController, NotiNavController, MoreNavController];
    
    self.window.rootViewController = tabBarController;
    
    UIColor *bgColor = [UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1.0f];
    self.window.backgroundColor = bgColor;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
