//
//  AppDelegate.m
//  Basic
//
//  Created by Dima on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "Employee.h"
#import "Organization.h"
#include "stdlib.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        
    Employee *empl = [[Employee alloc] initWithFirstName:@"Dima" lastName:@"Bondar" salary:1200];
    
    NSLog(@"Full name: %@", [empl fullName]);
    
    Organization * organ = [[Organization alloc]initWithName:@"ww ee"];
    
    [organ addEmployeeWithName:@"tt rr"];
    [organ addEmployeeWithName:@"tw rw"];
    [organ addEmployeeWithName:@"tc rc"];
    [organ addEmployee:empl];
    
    NSLog(@"Avarage salary: %f", [organ calculateAverageSalary]);
    NSLog(@"LowestSalary: %i", [organ employeeWithLowestSalary]);
    for (Employee * em in [organ employeesWithSalary:1300 tolerance:200]) {
        NSLog(@"Tolerance: %i", em.salary);
    }
    
    [organ removeEmployee:empl];
    
    NSLog(@"Avarage salary: %f", [organ calculateAverageSalary]);

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
