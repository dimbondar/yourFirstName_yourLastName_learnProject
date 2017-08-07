//
//  DetailViewController.m
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void) viewDidLoad
{
    [self setTitle: self.employee.fullName];
    NSString* sal = [NSString stringWithFormat:@"Salary is %i", self.employee.salary];
    [self.salary setText: sal];
}

@end
