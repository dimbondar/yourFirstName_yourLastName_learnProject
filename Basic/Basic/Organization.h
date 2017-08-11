//
//  Organization.h
//  Basic
//
//  Created by Dima Bondar on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import <CoreData/CoreData.h>

@interface Organization : NSManagedObject

@property (strong, nonatomic) NSString* name;

@property (strong, nonatomic) NSSet<Employee *> *employees;

- (id)initWithName:(NSString *)organizationName;
- (void)addEmployeeWithName:(NSString *)employeeName;
- (void)addEmployee:(Employee *)employee;
- (double)calculateAverageSalary;
- (int)employeeWithLowestSalary;
- (NSMutableArray<Employee *> *)employeesWithSalary:(int) salary tolerance:(int)tolerance;
- (void)removeEmployee:(Employee *)employee;
@end
