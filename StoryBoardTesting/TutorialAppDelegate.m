//
//  TutorialAppDelegate.m
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/7/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "TutorialAppDelegate.h"
#import "Drink.h"
#import "DrinkViewController.h"

@implementation TutorialAppDelegate

@synthesize drinks = _drinks;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    
    NSLog(@"%@", @"Creating the array");
    ////Begin the drinks array
    _drinks = [NSMutableArray arrayWithCapacity:20];
    
    ///Create and add example drinks
    Drink *drink = [[Drink alloc] init];
    drink.name = @"Narcissus";
    drink.description = @"It's all gone";
    drink.abv = @"2 percent";
    //drink.thumbnailname = @"1.png";
    drink.thumbnailname = @"gold.png";
    [_drinks addObject:drink];
    
    drink = [[Drink alloc] init];
    drink.name = @"Beer";
    drink.description = @"It's generic";
    drink.abv = @"3 percent";
    //drink.thumbnailname = @"2.png";
    drink.thumbnailname = @"orange.png";
    [_drinks addObject:drink];
    
    drink = [[Drink alloc] init];
    drink.name = @"Forrest";
    drink.description = @"Your roommate";
    drink.abv = @"9000";
    //drink.thumbnailname = @"3.png";
    drink.thumbnailname = @"black.png";
    [_drinks addObject:drink];
    
    

    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
    
    
    ///Is this thing actually a tabviewcontroller? find out later tonight
    //    self.window.rootViewController.debugDescription;
    
    
    if ([navigationController respondsToSelector:@selector(objectAtIndex:)])
    {
        NSLog(@"%@", @"About to make some selector calls");
    }
    
    
    DrinkViewController *drinkController = [[navigationController viewControllers] objectAtIndex:0];
    
    drinkController.drinks = _drinks;
    
    NSLog(@"%@", @"Finished those calls");
    // Let the device know we want to receive push notifications
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    
    
    
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
