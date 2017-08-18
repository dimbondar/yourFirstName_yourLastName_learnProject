//
//  OrganizationInfoViewController.swift
//  Basic
//
//  Created by Dima Bondar on 16.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

import UIKit
import BigInt
import SVProgressHUD

class OrganizationInfoViewController: UIViewController
{
    static let notificationChangeOrder = NSNotification.Name("ChangeOrderNotification")
    static let notificationUpdateTable = NSNotification.Name("UpdateTableNotification")

    
    @IBOutlet weak var container: UIView!
    var organization: Organization?
    
    @IBAction func changeemployeeOrder(_ sender: UIButton)
    {
        NotificationCenter.default.post(name: OrganizationInfoViewController.notificationChangeOrder, object: nil)
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
        RequestManager.fetchOrganizations() { response in
            let organizations = Organization.parse(toOrganizationArray: response)
            do
            {
                let appDel = AppDelegate.instance()
                let context = appDel!.persistentContainer.viewContext
                let coord = appDel?.persistentContainer.persistentStoreCoordinator
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OrganizationModel")
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                
                do
                {
                    try coord?.execute(deleteRequest, with: context)
                } catch let error as NSError {
                    debugPrint(error)
                }
                
                try AppDelegate.instance().persistentContainer.viewContext.save()
                
            } catch
            {
                print("Error while saving to core data")
            }
            
            let actionSheet = UIAlertController(title: "Organizations", message: nil, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            
            for organization in organizations!
            {
                let action = UIAlertAction(title: organization.name, style: UIAlertActionStyle.default, handler:
                { alert in
                    NotificationCenter.default.post(name: OrganizationInfoViewController.notificationUpdateTable, object: alert.title!)
                })
                actionSheet.addAction(action)
            }
            
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
    @IBAction func clickOnCalculateFibonachiNumber(_ sender: UIButton)
    {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setDefaultMaskType(.black)
        DispatchQueue.global(qos: .background).async {
            var i = BigInt(0)
            var j = BigInt(1)
            var amount = 1;
            while amount < 100000
            {
                j = j + i
                i = j - i
                amount += 1
                print(amount)
            }
            
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                print(j.description)
                
                let alert = UIAlertController(title: "Done", message: "see log", preferredStyle: .actionSheet)
                
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
