//
//  MainViewController.h
//  Basic
//
//  Created by Dima Bondar on 07.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UITableViewController<CreateEmployeeDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
