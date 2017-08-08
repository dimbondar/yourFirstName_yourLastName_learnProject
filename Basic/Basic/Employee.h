//
//  Employee.h
//  Basic
//
//  Created by Dima Bondar on 04.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (assign, nonatomic) int salary;
@property (readonly, strong, nonatomic) NSString *fullName;

- (instancetype)initWithFirstName:(NSString *)fn lastName:(NSString *)ln salary:(int)money;

@end
