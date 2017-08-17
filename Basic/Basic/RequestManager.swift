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
        RequestManager.parseToArrayOrganizations(getResult: getResult)
    }
    
    static func parseToArrayOrganizations(getResult: @escaping ([String : Any]?)->())
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
}
