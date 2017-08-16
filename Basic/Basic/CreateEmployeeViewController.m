//
//  CreateEmployeeViewController.m
//  Basic
//
//  Created by Dima Bondar on 08.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "Employee+Custom.h"
#import "HSDatePickerViewController.h"


@interface CreateEmployeeViewController() <HSDatePickerViewControllerDelegate>

@end

@implementation CreateEmployeeViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dateChanged:(id)sender
{
    [self showDatePicker:self];
}

- (IBAction)onSaveClick:(id)sender
{
    [self.employee initWithFirstName:self.firstName.text lastName:self.lastName.text salary:[self.salary.text intValue]];
    [self.delagate onSave:self.employee];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)showDatePicker:(id)sender
{
    self.dateTextField.text = self.employee.dateOfBirth.description;
    
    HSDatePickerViewController *hsdpvc = [[HSDatePickerViewController alloc] init];
    hsdpvc.delegate = self;
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

- (void)hsDatePickerPickedDate:(NSDate *)date
{
    self.dateTextField.text = [NSString stringWithFormat:@"%@", date];
    self.employee.dateOfBirth = date;
}

@end
