//
//  Employee.m
//  Basic
//
//  Created by Dima on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "Employee.h"

@interface Employee()

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

@end

@implementation Employee

- (id)initWithFirstName:(NSString *)fn
               lastName:(NSString *)ln
                 salary:(int)money
{
    self = [super init];
    if (self)
    {
        self.firstName = fn;
        self.lastName = ln;
        self.salary = money;
    }
    return self;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
