//
//  Employee+CoreDataProperties.m
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EmployeeModel"];
}

@dynamic fullName;
@dynamic salary;

@end
