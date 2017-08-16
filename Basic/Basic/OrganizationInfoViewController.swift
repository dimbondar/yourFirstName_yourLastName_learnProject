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

    var organization:Organization?
    var salarySum:Int32?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func  showSalarySum(_ sender: UIButton)
    {
        if (salarySum == nil)
        {
            salarySum = 0;
            for item:Employee in (organization!.employees)!
            {
                salarySum! +=  item.salary
            }
        }
        
        let alert = UIAlertController(title: "Organization: \(organization!.name!)", message: "Sum of salaries of all employees is: \(salarySum!)", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("done")});
        
        alert.addAction(okAction);
        self.present(alert, animated: true, completion: nil);
    }
}
