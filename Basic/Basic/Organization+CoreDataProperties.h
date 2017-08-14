//
//  Organization+CoreDataProperties.h
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Organization+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Employee *> *employees;

@end

NS_ASSUME_NONNULL_END
