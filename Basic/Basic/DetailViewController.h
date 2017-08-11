//
//  DetailViewController.h
//  Basic
//
//  Created by Dima Bondar on 07.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee+CoreDataClass.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Employee *employee;
@property (weak, nonatomic) IBOutlet UILabel *salary;

@end
