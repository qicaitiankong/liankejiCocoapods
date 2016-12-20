//
//  AppDelegate.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstPageViewController.h"
#import "NavViewControllerForFirstPage.h"

#import "PersonalTableViewController.h"
#import "NavViewControllerForPersonal.h"
//首页的左右侧拉，实际项目按需要再变化
#import "leftDrawerViewController.h"
#import "rightDrawerTableController.h"

#import "CommunicateFirstViewController.h"
#import "CommunicateNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%lf,%lf",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    self.window = [[UIWindow alloc]init];
    //首页中的左侧抽屉
    leftDrawerViewController *leftVC = [[leftDrawerViewController alloc]init];
    rightDrawerTableController *rightTableVC = [[rightDrawerTableController alloc]initWithStyle:UITableViewStylePlain];
    //首页
    FirstPageViewController *firstpageVC = [[FirstPageViewController alloc]init];
    NavViewControllerForFirstPage *firstPageNav = [[NavViewControllerForFirstPage alloc]initWithRootViewController:firstpageVC];
    //社区交流
    CommunicateFirstViewController *communicateVC = [[CommunicateFirstViewController alloc]init];
    CommunicateNavigationViewController *communicateNav = [[CommunicateNavigationViewController alloc]initWithRootViewController:communicateVC];
    //个人中心我的
    PersonalTableViewController *personalVC = [[PersonalTableViewController alloc]init];
    NavViewControllerForPersonal *personalNav = [[NavViewControllerForPersonal alloc]initWithRootViewController:personalVC];
    
     //创建抽屉对象，即实现类似于QQ界面,若后期给社区和我的添加侧拉，并在TABBAR上显示图标，需要在MMDrawerController.m中设置标题及图片
    self.drawer = [[MMDrawerController alloc]initWithCenterViewController:firstPageNav leftDrawerViewController:leftVC rightDrawerViewController:rightTableVC];
    //NSLog(@"抽屉地址：%p %p",self.drawer,drawer2);
    self.drawer.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawer.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    self.drawer.maximumLeftDrawerWidth = 200;
    
    UITabBarController *tabBarControl = [[UITabBarController alloc]init];
    [tabBarControl setViewControllers:@[self.drawer,communicateNav,personalNav]];
    self.window.rootViewController = tabBarControl;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
