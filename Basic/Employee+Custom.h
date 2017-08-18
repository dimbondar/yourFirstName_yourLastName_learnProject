//
//  Employee+Custom.h
//  Basic
//
//  Created by Dima Bondar on 14.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee+CoreDataClass.h"

@interface Employee(CustomEmployee)

- (void)initWithFirstName:(NSString *)fn lastName:(NSString *)ln salary:(int)money;
+ (Employee *) parseToEmployee:(NSDictionary<NSString *, id> *) employee;


@end
