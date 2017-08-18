//
//  RequestManager.swift
//  Basic
//
//  Created by Dima Bondar on 17.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager
{
    static func fetchOrganizations(_ getResult: @escaping (_ firt: [String : Any]?)->())
    {
        RequestManager.getRequest(getResult: getResult)
    }
    
    static func getRequest(getResult: @escaping ([String : Any]?)->())
    {
        let url = "http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json";
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    getResult(value as? [String : Any])
                case .failure:
                    print("bad")
                }
        }
        

    }
    
    static func parseToOrganizationArray(json: [String : Any]) -> [Organization]
    {
        var organizations = [Organization]();
        
        let jsonOrganizations = json.first?.value as? [[String : Any]]
        
        for var organization in jsonOrganizations!
        {
            let org = NSEntityDescription.insertNewObject(forEntityName: "OrganizationModel", into: AppDelegate.instance().persistentContainer.viewContext) as! Organization
            org.name = organization.removeValue(forKey: "name") as? String
            
            let jsonEmployee = organization.removeValue(forKey: "employees") as? [[String : Any]]
            
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
        return organizations
    }
}
