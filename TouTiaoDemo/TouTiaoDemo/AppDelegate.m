//
//  AppDelegate.m
//  TouTiaoDemo
//
//  Created by ruixinyi on 2019/10/31.
//  Copyright © 2019 ruixinyi. All rights reserved.
//

#import "AppDelegate.h"
#import <TTTracker/TTTracker.h>
#import <TTTracker/TTTrackerHeader.h>
#import <TTTracker/TTTracker+Game.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //========= 在初始化之前配置SDK ============
    // 初始化
    //[[TTTracker sharedInstance] setSessionEnable:YES];
    [TTTracker startWithAppID:@"170219" channel:@"local_test" appName:@"iosyxggj"];

    
    /*
     自定义事件上报
     第一个参数为： 在头条数据后台注册的事件名称
     第二个参数为： 本次事件需要上传的参数
     */
    //[TTTracker eventV3:@"toutiao" params:@{@"is_log_in":@(2)}];
    
    
   /* 商业化SDK对外提供了一些预先定义好的事件，接入方可以恰当的时机直接调用相关方法上报对应事件（注册register事件必传；支付purchase事件必传，其中仅isSuccess和currency_amount必传），游戏预埋事件API在TTTeacker+Game.h文件中。
   */
    [TTTracker registerEventByMethod:@"weixin" isSuccess:YES];
    /* 支付上报
     */
    [TTTracker purchaseEventWithContentType:@"道具"
                                contentName:@"金币"
                                  contentID:@"156541536132131"  //dbt111111166666666666
                              contentNumber:1
                             paymentChannel:@"apple"
                                   currency:@"CYN"
                            currency_amount:6
                                  isSuccess:YES];
    NSLog(@"finished");
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
