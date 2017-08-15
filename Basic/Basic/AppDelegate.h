//
//  AppDelegate.h
//  Basic
//
//  Created by Dima Bondar on 04.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSPersistentContainer *persistentContainer;

+ (AppDelegate *)instance;

@end


