//
//  MainViewController.h
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"
#import "DetailViewController.h"
@interface MainViewController : UITableViewController

@property(strong, nonatomic) Organization *organization;

@end
