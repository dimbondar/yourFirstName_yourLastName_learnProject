//
//  DetailViewController.m
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void) viewDidLoad
{
    self.title = self.employee.fullName;
    NSString *sal = [NSString stringWithFormat:@"Salary is %i", self.employee.salary];
    self.salary.text = sal;
}

@end
