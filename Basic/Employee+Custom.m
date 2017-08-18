//
//  Employee+Custom.m
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Employee+Custom.h"
#import "AppDelegate.h"

@implementation Employee(CustomEmployee)

- (void)initWithFirstName:(NSString *)fn
                 lastName:(NSString *)ln
                   salary:(int)money
{
    self.fullName = [NSString stringWithFormat:@"%@ %@",fn,ln];
    self.salary = money;
    
}

+ (Employee *) parseToEmployee:(NSDictionary<NSString *, id> *) employee
{
    Employee *empl = [NSEntityDescription insertNewObjectForEntityForName:@"EmployeeModel" inManagedObjectContext:AppDelegate.instance.persistentContainer.viewContext];
    NSString *salary = [employee objectForKey:@"salary"];
    if([employee objectForKey:@"salary"] != [NSNull null])
    {
        empl.salary = salary.intValue;
    }
    empl.fullName = [[NSString alloc] initWithFormat:@"%@ %@", [employee objectForKey:@"first_name"], [employee objectForKey:@"last_name"]];
    return empl;
}

@end
