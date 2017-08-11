//
//  MainViewController.m
//  Basic
//
//  Created by Dima Bondar on 07.08.17.
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
    
    NSEntityDescription *decs = [NSEntityDescription entityForName:@"OrganizationModel" inManagedObjectContext:self.managedObjectContext];
    self.organization.name = @"bbn";
    self.organization = [[Organization alloc] initWithEntity:decs insertIntoManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"OrganizationModel"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name = %@",self.organization.name]];
    int count = (int)[self.managedObjectContext countForFetchRequest:fetchRequest error:nil];
    if( count== 0)
    {
        NSError *error = nil;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
    } else
    {
        self.organization = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil].firstObject;
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
        NSEntityDescription *decs = [NSEntityDescription entityForName:@"EmployeeModel" inManagedObjectContext:self.managedObjectContext];
        CreateEmployeeViewController *createEVC = (CreateEmployeeViewController *)segue.destinationViewController;
        createEVC.delagate = self;
        createEVC.employee = [[Employee alloc] initWithEntity:decs insertIntoManagedObjectContext:self.managedObjectContext];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ssssssssssssss");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Employee *ob = self.organization.employees.allObjects[(int)indexPath.row];
        [self.organization removeEmployee: ob];
        [self.managedObjectContext deleteObject: ob];
        NSError *error = nil;
        // Save the object to persistent store
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self.tableView reloadData];
//        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
//        
//        NSError *error = nil;
//        if (![context save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//            abort();
//        }
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
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.tableView reloadData];
}

@end
