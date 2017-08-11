//
//  Employee+CoreDataClass.h
//  Basic
//
//  Created by Dima Bondar on 11.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSManagedObject

- (void)initWithFirstName:(NSString *)fn lastName:(NSString *)ln salary:(int)money;

@end

NS_ASSUME_NONNULL_END

#import "Employee+CoreDataProperties.h"
