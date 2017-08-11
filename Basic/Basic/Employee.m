//
//  Employee.m
//  Basic
//
//  Created by Dima Bondar on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "Employee.h"

@interface Employee()

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

@end

@implementation Employee

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic fullName;

- (instancetype)iniitWithFirstName:(NSString *)fn
                          lastName:(NSString *)ln
                            salary:(int)money
{
    self.fullName = [NSString stringWithFormat:@"%@ %@",fn,ln];
    self.salary = money;
    
    return self;
}


- (void)initWithFirstName:(NSString *)fn
                 lastName:(NSString *)ln
                   salary:(int)money
{
    self.fullName = [NSString stringWithFormat:@"%@ %@",fn,ln];
    self.salary = money;
    
}

//- (NSString *)fullName
//{
//    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
//}

@end
