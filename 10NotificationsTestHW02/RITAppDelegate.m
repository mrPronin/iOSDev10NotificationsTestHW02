//
//  RITAppDelegate.m
//  10NotificationsTestHW02
//
//  Created by Aleksandr Pronin on 06.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITAppDelegate.h"
#import "RITGovernment.h"
#import "RITDoctor.h"
#import "RITPensioner.h"
#import "RITBusinessman.h"

@interface RITAppDelegate ()
@property (strong, nonatomic) RITGovernment* government;
@end

@implementation RITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // create government object
    self.government  = [[RITGovernment alloc] init];
    
    // create human objects
    RITDoctor*      doctor01    = [[RITDoctor alloc] init];
    
    RITPensioner*   pensioner01 = [[RITPensioner alloc] init];
    
    RITBusinessman* businessman = [[RITBusinessman alloc] init];
    
    // set initial values
    doctor01.name       = @"Doctor";
    
    pensioner01.name    = @"Pensioner";
    
    businessman.name    = @"Businessman";
    
    doctor01.salary = self.government.salary;
    doctor01.averagePrice = self.government.averagePrice;
    
    pensioner01.pension = self.government.pension;
    pensioner01.averagePrice = self.government.averagePrice;
    
    businessman.taxLevel = self.government.taxLevel;
    businessman.averagePrice = self.government.averagePrice;
    
    // change government options #01
    NSLog(@"Government options: 2011 year");
    self.government.averagePrice    = 15;
    self.government.taxLevel        = 5.5f;
    self.government.salary          = 1100;
    self.government.pension         = 550;
    NSLog(@"\n");
    
    // change government options #02
    NSLog(@"Government options: 2012 year");
    self.government.averagePrice    = 18;
    self.government.taxLevel        = 5.2f;
    self.government.salary          = 1050;
    self.government.pension         = 555;
    NSLog(@"\n");
    
    // change government options #03
    NSLog(@"Government options: 2013 year");
    self.government.averagePrice    = 21;
    self.government.taxLevel        = 3.1f;
    self.government.salary          = 1150;
    self.government.pension         = 555;
    NSLog(@"\n");
    
    // change government options #04
    NSLog(@"Government options: 2014 year");
    self.government.averagePrice    = 22;
    self.government.taxLevel        = 2.0f;
    self.government.salary          = 900;
    self.government.pension         = 555;
    NSLog(@"\n");
    
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
