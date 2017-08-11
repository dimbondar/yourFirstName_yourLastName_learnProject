//
//  Employee+CoreDataClass.m
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Employee+CoreDataClass.h"

@implementation Employee

- (void)initWithFirstName:(NSString *)fn
                 lastName:(NSString *)ln
                   salary:(int)money
{
    self.fullName = [NSString stringWithFormat:@"%@ %@",fn,ln];
    self.salary = money;
    
}

@end
