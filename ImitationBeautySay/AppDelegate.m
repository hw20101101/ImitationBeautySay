//
//  AppDelegate.m
//  ImitationBeautySay
//
//  Created by hw on 2016/12/19.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "AppDelegate.h"
#import "HWTabBarController.h"

@interface AppDelegate ()

//@property (nonatomic, strong) WXTabBarController *tabbarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HWTabBarController *tabBarController = [[HWTabBarController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (WXTabBarController *)tabbarController{
//    
//    if (!_tabbarController) {
//        _tabbarController = [[WXTabBarController alloc] init];
//        
//        //1.创建首页视图控制器
//        HWHomeViewController *homeVC = [[HWHomeViewController alloc] init];
//        UIImage *homeImage   = [UIImage imageNamed:@"tabbar_home"];
//        UIImage *homeHLImage = [UIImage imageNamed:@"tabbar_homeHL"];
//        homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImage selectedImage:homeHLImage];
//        
//        //2.创建分类视图控制器
//        HWClassifyViewController *classifyVC = [[HWClassifyViewController alloc] init];
//        UIImage *classifyImage   = [UIImage imageNamed:@"tabbar_classify"];
//        UIImage *classifyHLImage = [UIImage imageNamed:@"tabbar_classifyHL"];
//        classifyVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:classifyImage selectedImage:classifyHLImage];
//        
//        //3.创建购物车视图控制器
//        HWCartViewController *cartVC = [[HWCartViewController alloc] init];
//        UIImage *cartImage   = [UIImage imageNamed:@"tabbar_cart"];
//        UIImage *cartHLImage = [UIImage imageNamed:@"tabbar_cartHL"];
//        cartVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:cartImage selectedImage:cartHLImage];
//        
//        //4.创建我视图控制器
//        HWMeViewController *meVC = [[HWMeViewController alloc] init];
//        UIImage *meImage   = [UIImage imageNamed:@"tabbar_me"];
//        UIImage *meHLImage = [UIImage imageNamed:@"tabbar_meHL"];
//        meVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:meImage selectedImage:meHLImage];
//        
//        //5.设置tabar控制器
//        _tabbarController.title = @"首页";
//        _tabbarController.tabBar.tintColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
//        _tabbarController.viewControllers = @[
//                                             [[UINavigationController alloc] initWithRootViewController:homeVC],
//                                             [[UINavigationController alloc] initWithRootViewController:classifyVC],
//                                             [[UINavigationController alloc] initWithRootViewController:cartVC],
//                                             [[UINavigationController alloc] initWithRootViewController:meVC],
//                                             ];
//        
//    }
//    return _tabbarController;
//}

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
