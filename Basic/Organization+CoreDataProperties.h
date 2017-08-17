//
//  Organization+CoreDataProperties.h
//  Basic
//
//  Created by Dima Bondar on 16.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "Organization+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<Employee *> *employees;

@end

@interface Organization (CoreDataGeneratedAccessors)

- (void)insertObject:(Employee *)value inEmployeesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)idx;
- (void)insertEmployees:(NSArray<Employee *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEmployeesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEmployeesAtIndex:(NSUInteger)idx withObject:(Employee *)value;
- (void)replaceEmployeesAtIndexes:(NSIndexSet *)indexes withEmployees:(NSArray<Employee *> *)values;
- (void)addEmployeesObject:(Employee *)value;
- (void)removeEmployeesObject:(Employee *)value;
- (void)addEmployees:(NSOrderedSet<Employee *> *)values;
- (void)removeEmployees:(NSOrderedSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
