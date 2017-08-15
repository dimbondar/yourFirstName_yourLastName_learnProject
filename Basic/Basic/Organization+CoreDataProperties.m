//
//  Organization+CoreDataProperties.m
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Organization+CoreDataProperties.h"

@implementation Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"OrganizationModel"];
}

@dynamic name;
@dynamic employees;

@end
