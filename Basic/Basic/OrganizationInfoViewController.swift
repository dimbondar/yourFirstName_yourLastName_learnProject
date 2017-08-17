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
}
