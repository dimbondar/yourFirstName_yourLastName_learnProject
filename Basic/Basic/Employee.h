//
//  Employee.h
//  Basic
//
//  Created by Dima Bondar on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (assign, nonatomic) int salary;
@property (strong, nonatomic) NSString *fullName;

- (void)initWithFirstName:(NSString *)fn lastName:(NSString *)ln salary:(int)money;
- (instancetype)iniitWithFirstName:(NSString *)fn lastName:(NSString *)ln salary:(int)money;


@end
