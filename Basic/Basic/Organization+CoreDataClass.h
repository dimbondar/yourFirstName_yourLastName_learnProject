//
//  Organization+CoreDataClass.h
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

NS_ASSUME_NONNULL_BEGIN

@interface Organization : NSManagedObject

- (id)initWithName:(NSString *)organizationName;
- (void)addEmployeeWithName:(NSString *)employeeName;
- (void)addEmployee:(Employee *)employee;
- (double)calculateAverageSalary;
- (int)employeeWithLowestSalary;
- (NSMutableArray<Employee *> *)employeesWithSalary:(int) salary tolerance:(int)tolerance;
- (void)removeEmployee:(Employee *)employee;

@end

NS_ASSUME_NONNULL_END

#import "Organization+CoreDataProperties.h"
