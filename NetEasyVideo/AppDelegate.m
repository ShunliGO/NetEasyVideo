//
//  AppDelegate.m
//  NetEasyVideo
//
//  Created by yingxin on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configSystem:launchOptions];
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    _window.rootViewController = navi;
    return YES;
}


@end
