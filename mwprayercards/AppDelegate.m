//
//  AppDelegate.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/01/30.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "CardListViewController.h"
#import "DivineHoursChoiceViewController.h"
#import "AboutViewController.h"

#import "MyUINavigationController.h"
#import "SplashViewController.h"
#import "DataSource.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	[DataSource sharedDataSource]; //force preload of data
    
    //put these tabs together 
    CardListViewController* cardListVC = [[CardListViewController alloc] initWithNibName:@"CardListViewController" bundle:nil];
    DivineHoursChoiceViewController* divineHoursVC = [[DivineHoursChoiceViewController alloc] initWithNibName:@"DivineHoursChoiceViewController" bundle:nil];
    AboutViewController* aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];

    //first tab - cards    
    MyUINavigationController* navController1 = [[MyUINavigationController alloc] initWithRootViewController: cardListVC];
    navController1.toolbar.barStyle = UIBarStyleDefault;
    
    //second tab - divine hours
    MyUINavigationController* navController2 = [[MyUINavigationController alloc] initWithRootViewController:divineHoursVC];
    navController2.toolbar.barStyle = UIBarStyleDefault;
    
    //third tab - info / about
    MyUINavigationController* navController3 = [[MyUINavigationController alloc] initWithRootViewController:aboutVC];
    navController3.toolbar.barStyle = UIBarStyleDefault;
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2, navController3, nil];
    
    // Override point for customization after application launch.
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.48f green:0.14f blue:0.12f alpha:1.0f]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f], NSForegroundColorAttributeName:[UIColor whiteColor]}];

    
    [[UIApplication sharedApplication] setStatusBarHidden:YES   withAnimation:UIStatusBarAnimationNone] ;

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    [DataSource sharedDataSource];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}




/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
