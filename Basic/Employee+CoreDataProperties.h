//
//  Employee+CoreDataProperties.h
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *fullName;
@property (nonatomic) int32_t salary;
@property (nullable, nonatomic, retain) Organization *organization;

@end

NS_ASSUME_NONNULL_END
