//
//  Organization.h
//  Basic
//
//  Created by Dima on 04.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface Organization : NSObject

@property(strong, nonatomic) NSString* name;

- (id) initWithName:(NSString *) organizationName;
- (void) addEmployeeWithName:(NSString *) employeeName;
- (void) addEmployee:(Employee *) employee;
- (double) calculateAverageSalary;
- (int) employeeWithLowestSalary;
- (NSMutableArray<Employee *> *)employeesWithSalary:(int) salary tolerance:(int)tolerance;

@end
