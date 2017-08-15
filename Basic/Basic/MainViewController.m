//
//  MainViewController.m
//  Basic
//
//  Created by Dima Bondar on 07.08.17.
//  Copyright © 2017 Dima Bondar. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Organization+Custom.h"
#import "Employee+Custom.h"

@interface MainViewController()

@property (strong, nonatomic) Organization *organization;
@property (weak, nonatomic) Employee *selectedEmployee;

@end

@implementation MainViewController

- (void) viewDidLoad
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"OrganizationModel"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name = %@",@"ggg"]];
    int organizationsAmount = (int)[[[AppDelegate instance] persistentContainer].viewContext countForFetchRequest:fetchRequest error:nil];
    
    if (organizationsAmount == 0)
    {
        self.organization = [NSEntityDescription insertNewObjectForEntityForName:@"OrganizationModel" inManagedObjectContext:[[AppDelegate instance] persistentContainer].viewContext];
        self.organization.name = @"ggg";
        NSError *error = nil;
        if (![[[AppDelegate instance] persistentContainer].viewContext save:&error])
        {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
    } else
    {
        self.organization = [[[AppDelegate instance] persistentContainer].viewContext executeFetchRequest:fetchRequest error:nil].firstObject;
    }
    
    self.title = self.organization.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.organization.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"employeeTableCell"];
    tableCell.textLabel.text = self.organization.employees.allObjects[indexPath.row].fullName;
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedEmployee = self.organization.employees.allObjects[indexPath.row];
    [self performSegueWithIdentifier:@"toEmployeeDetail" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEmployeeDetail"])
    {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        detailVC.employee = self.selectedEmployee;
    }
    else if ([segue.identifier isEqualToString:@"toCreateEmployee"])
    {
        CreateEmployeeViewController *createEVC = (CreateEmployeeViewController *)segue.destinationViewController;
        createEVC.delagate = self;
        Employee *emplo = (Employee *)[NSEntityDescription insertNewObjectForEntityForName:@"EmployeeModel" inManagedObjectContext:[[AppDelegate instance] persistentContainer].viewContext];
        createEVC.employee = emplo;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Employee *ob = self.organization.employees.allObjects[(int)indexPath.row];
        [[[AppDelegate instance] persistentContainer].viewContext deleteObject: ob];
        NSError *error = nil;
        // Save the object to persistent store
        if (![[[AppDelegate instance] persistentContainer].viewContext save:&error])
        {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self.tableView reloadData];
    }
}


- (IBAction)onAddClick:(id)sender
{
    [self performSegueWithIdentifier:@"toCreateEmployee" sender:self];
}

- (void)onSave:(Employee *)newEmployee
{
    [self.organization addEmployee:newEmployee];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![[[AppDelegate instance] persistentContainer].viewContext save:&error])
    {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.tableView reloadData];
}

@end
