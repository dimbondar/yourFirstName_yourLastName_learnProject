//
//  Organization+Custom.m
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Organization+Custom.h"
#import "Employee+Custom.h"
#import "AppDelegate.h"
#include <stdlib.h>

@implementation Organization(CustomOrganization)

- (void)addEmployee:(Employee *)employee
{
    NSMutableOrderedSet *mutSet = self.employees.mutableCopy;
    [mutSet addObject:employee];
    self.employees = mutSet.copy;
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
    
    int lowestSalary = self.employees.set.anyObject.salary;
    
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

- (void)removeEmployee:(Employee *)employee
{
    NSMutableArray *mutEmployees = self.employees.mutableCopy;
    [mutEmployees removeObject:employee];
    self.employees = mutEmployees.copy;
}

+ (NSArray<Organization *> *)parseToOrganizationArray:(NSDictionary<NSString *, id> *)json
{
    NSMutableArray<Organization *> *organizations = [[NSMutableArray alloc] init];

    if (json != nil)
    {
        NSArray<NSDictionary<NSString *, id> *> *jsonOrganizations = [json objectForKey:@"organizations"];
        for (NSDictionary<NSString *, id> *organization in jsonOrganizations)
        {
            
            Organization *org = [NSEntityDescription insertNewObjectForEntityForName:@"OrganizationModel" inManagedObjectContext:AppDelegate.instance.persistentContainer.viewContext];
            
            org.name = [organization valueForKey:@"name"];
            
            NSArray<NSDictionary<NSString *, id> *> *jsonEmployee = [organization valueForKey:@"employees"];
            
            for (NSDictionary<NSString *, id> *employee in jsonEmployee)
            {                
                Employee *empl = [Employee parseToEmployee:employee];
                empl.organization = org;

                [org addEmployee:empl];
            }
            
            [organizations addObject:org];
        }
        return organizations;
    }
    else
    {
        return organizations;
    }
    
}

@end
