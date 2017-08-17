//
//  OrganizationInfoViewController.swift
//  Basic
//
//  Created by Dima Bondar on 16.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

import UIKit

class OrganizationInfoViewController: UIViewController
{
    static let notificationName = NSNotification.Name("ChangeOrderNotification")
    var organization: Organization?
    
    @IBAction func changeemployeeOrder(_ sender: UIButton)
    {
        NotificationCenter.default.post(name: OrganizationInfoViewController.notificationName, object: nil)
    }
    @IBAction func  showSalarySum(_ sender: UIButton)
    {
        var salarySum:Int32 = 0;

        for employee in self.organization!.employees!
        {
            salarySum +=  (employee as! Employee).salary
        }
        
        let alert = UIAlertController(title: "Organization: \(self.organization!.name!)", message: "Sum of salaries of all employees is: \(salarySum)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil);
        
        alert.addAction(okAction);
        self.present(alert, animated: true, completion: nil);
    }
    @IBAction func clickFetchOrganizations(_ sender: UIButton)
    {
//        let organizations = RequestManager.fetchOrganizations(RequestManager.parseToArrayOrganizations)
        RequestManager.fetchOrganizations(){ json in
            var organizations = [Organization]();
            
            let jsonOrganizations =  json?.first?.value as? [[String : Any]]
            
            for var organization in jsonOrganizations!
            {
                let org = NSEntityDescription.insertNewObject(forEntityName: "OrganizationModel", into: AppDelegate.instance().persistentContainer.viewContext) as! Organization
                org.name = organization.removeValue(forKey: "name") as? String
                
                let jsonEmployee =  organization.removeValue(forKey: "employees") as? [[String : Any]]
                
                for var employee in jsonEmployee!
                {
                    let empl = NSEntityDescription.insertNewObject(forEntityName: "EmployeeModel", into: AppDelegate.instance().persistentContainer.viewContext) as! Employee
                    let salary = employee.removeValue(forKey: "salary")
                    
                    if (salary as? NSNull) == nil
                    {
                        empl.salary = salary as! Int32
                    }
                    
                    empl.fullName = ("\(employee.removeValue(forKey: "first_name") as! String) \(employee.removeValue(forKey: "last_name") as! String)")
                    empl.organization = org
                    
                    org.addEmployee(empl)
                }
                
                organizations.append(org)
            }
            print((organizations[0].employees!.firstObject as! Employee).fullName ?? "NOOOOOOO")
        }
//        print(organizations[0].name!)
    }
}
