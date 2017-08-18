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
    static func fetchOrganizations(_ completionHandler: @escaping (_ json: [String : Any]?) -> ())
    {
        let url = "http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json";
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? [String : Any])
                case .failure:
                    print("bad")
                }
        }

    }
    
//    static func parseToOrganizationArray(json: [String : Any]?) -> [Organization]
//    {
//        var organizations = [Organization]()
//        if (json != nil)
//        {
//            let jsonOrganizations = json?.first!.value as! [[String : Any]]
//            for var organization in jsonOrganizations
//            {
//                let org = NSEntityDescription.insertNewObject(forEntityName: "OrganizationModel", into: AppDelegate.instance().persistentContainer.viewContext) as! Organization
//                
//                org.name = organization["name"] as? String
//                
//                let jsonEmployee = organization["employees"] as? [[String : Any]]
//                
//                for var employee in jsonEmployee!
//                {
//                    let empl = NSEntityDescription.insertNewObject(forEntityName: "EmployeeModel", into: AppDelegate.instance().persistentContainer.viewContext) as! Employee
//                    let salary = employee["salary"]
//                    
//                    if salary is Int
//                    {
//                        empl.salary = salary as! Int32
//                    }
//                    
//                    empl.fullName = ("\(employee["first_name"] as! String) \(employee["last_name"] as! String)")
//                    empl.organization = org
//                    
//                    org.addEmployee(empl)
//                }
//                
//                organizations.append(org)
//            }
//            return organizations
//        }
//        else
//        {
//            return organizations
//        }
//        
//    }
}
