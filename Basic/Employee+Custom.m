//
//  Employee+Custom.m
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Employee+Custom.h"

@implementation Employee(CustomEmployee)

- (void)initWithFirstName:(NSString *)fn
                 lastName:(NSString *)ln
                   salary:(int)money
{
    self.fullName = [NSString stringWithFormat:@"%@ %@",fn,ln];
    self.salary = money;
    
}

@end
