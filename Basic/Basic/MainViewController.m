//
//  MainViewController.m
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController()

@property (strong, nonatomic) Organization *organization;
@property (weak, nonatomic) Employee *selectedEmployee;

@end

@implementation MainViewController

- (void) viewDidLoad
{
    self.organization = [[Organization alloc] initWithName:@"GGG company"];
    
    [self.organization addEmployeeWithName:@"Jim Bon"];
    [self.organization addEmployeeWithName:@"Jack Li"];
    [self.organization addEmployeeWithName:@"Nick Nu"];
    [self.organization addEmployeeWithName:@"John Ve"];
    
    self.title = self.organization.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.organization.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"employeeTableCell"];
    tableCell.textLabel.text = self.organization.employees[indexPath.row].fullName;
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedEmployee = self.organization.employees [indexPath.row];
    [self performSegueWithIdentifier:@"toEmployeeDetail" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEmployeeDetail"])
    {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        detailVC.employee = self.selectedEmployee;
    }
}

@end
