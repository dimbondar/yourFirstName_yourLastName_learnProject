//
//  CreateEmployeeViewController.m
//  Basic
//
//  Created by Dima Bondar on 08.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "CreateEmployeeViewController.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)onSaveClick:(id)sender
{
    Employee *newemployee = [[Employee alloc] initWithFirstName:self.firstName.text lastName:self.lastName.text salary:[self.salary.text intValue]];
    [self.delagate onSave:newemployee];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
