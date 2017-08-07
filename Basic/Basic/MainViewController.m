//
//  MainViewController.m
//  Basic
//
//  Created by Dima on 07.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController()

@property(strong, nonatomic) Employee *em;

@end

@implementation MainViewController

- (void) viewDidLoad
{
    self.organization = [[Organization alloc] initWithName:@"GGG company"];
    
    [self.organization addEmployeeWithName:@"Jim Bon"];
    [self.organization addEmployeeWithName:@"Jack Li"];
    [self.organization addEmployeeWithName:@"Nick Nu"];
    [self.organization addEmployeeWithName:@"John Ve"];
    
    [self setTitle: self.organization.name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.organization.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = [tableView
                             dequeueReusableCellWithIdentifier:@"tbCell"];
    [tableCell.textLabel setText: [self.organization.employees objectAtIndex:indexPath.row].fullName];
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setEm: [self.organization.employees objectAtIndex: indexPath.row]];
    [self performSegueWithIdentifier:@"pushId" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString: @"pushId"])
    {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        [detailVC setEmployee: self.em];
    }
        
}

@end
