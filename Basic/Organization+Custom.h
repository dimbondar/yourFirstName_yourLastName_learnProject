//
//  Organization+Custom.h
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization+CoreDataClass.h"

@interface Organization(CustomOrganization)

- (void)addEmployee:(Employee *)employee;
- (double)calculateAverageSalary;
- (int)employeeWithLowestSalary;
- (NSMutableArray<Employee *> *)employeesWithSalary:(int) salary tolerance:(int)tolerance;
- (void)removeEmployee:(Employee *)employee;

+ (NSArray<Organization *> *)parseToOrganizationArray:(NSDictionary<NSString *, id> *) json;
@end
