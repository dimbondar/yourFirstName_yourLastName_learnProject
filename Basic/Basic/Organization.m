//
//  Organization.m
//  Basic
//
//  Created by Dima on 04.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Organization.h"
#import "Employee.h"
#include "stdlib.h"

@interface Organization()

@property(strong, nonatomic)NSArray<Employee *> *employees;

@end

@implementation Organization

- (id)initWithName:(NSString *) organizationName
{
    self = [super init];
    
    self.name = organizationName;
    self.employees = [[NSMutableArray alloc] init];
    return self;
}

- (void)addEmployeeWithName:(NSString *)employeeName
{
    NSArray<NSString *> *names = [employeeName componentsSeparatedByString:@" "];
    
    if(([names count]) == 2)
    {
        int randSalary = (arc4random_uniform(490) + 10) * 10;
        NSLog(@"Random salary: %i", randSalary);
        Employee *employee =
        [[Employee alloc] initWithFirstName:names[0] lastName:names[1] salary:randSalary];
        [self addEmployee:employee];
    }
    
}

- (void)addEmployee:(Employee *)employee
{
    self.employees = [self.employees arrayByAddingObject:employee];
}

- (double)calculateAverageSalary
{
    double averageSalary = 0.0;
    
    if(self.employees.count < 1)
    {
        return averageSalary;
    }
    
    for (Employee * employee in self.employees)
    {
        averageSalary += employee.salary;
        
    }
    
    averageSalary /= self.employees.count;
    
    return averageSalary;
}

- (int)employeeWithLowestSalary
{
    if(self.employees.count < 1)
    {
        return 0;
    }
    
    int lowestSalary = self.employees.firstObject.salary;
    
    for (Employee * em in self.employees)
    {
        lowestSalary = (lowestSalary <= em.salary)? lowestSalary : em.salary;
    }
    
    return lowestSalary;
}

- (NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance
{
    NSMutableArray<Employee *> *empls = [[NSMutableArray alloc] init];
    
    for (Employee * employee in self.employees)
    {
        if((employee.salary <= salary + tolerance) && (employee.salary >= salary-tolerance))
        {
            [empls addObject:employee];
        }
    }
    
    return empls.copy;
}

@end
