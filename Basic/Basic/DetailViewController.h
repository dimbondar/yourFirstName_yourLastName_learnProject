//
//  DetailViewController.h
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) Employee *employee;
@property (strong, nonatomic) IBOutlet UILabel *salary;

@end
