//
//  CreateEmployeeViewController.h
//  Basic
//
//  Created by Dima Bondar on 08.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@protocol CreateEmployeeDelegate <NSObject>

- (void)onSave:(Employee *)newEmployee;

@end

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) id<CreateEmployeeDelegate> delagate;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *salary;

@end
