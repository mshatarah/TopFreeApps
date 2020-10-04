//
//  APIService.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {
    func fetchTopFreeApps( complete: @escaping ( _ success: Bool, _ applications: [Application]?, _ error: APIError? )->() )
}

class APIService: APIServiceProtocol {
            
    func fetchTopFreeApps(complete: @escaping (Bool, [Application]?, APIError?) -> ()) {
        
        Alamofire.request( Constant.TOP_FREE_APPS_URL, parameters: [:]).responseData { response in
            if response.response == nil{
                complete( false, nil, APIError.noNetwork )
                return
            }
            
            let statusCode = (response.response!.statusCode) as Int
            switch (statusCode)
            {
            case StatusCode.SUCCESS.rawValue:
                
                if let data = response.result.value{
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    if let applications = try? decoder.decode(Applications.self, from: data) {
                        complete( true, applications.feed.entry, nil)
                    } else {
                        complete( false, nil, APIError.noNetwork )
                    }
                }else{
                    complete( false, nil, APIError.noNetwork )
                }
                break
            case StatusCode.UNAUTHORIZED.rawValue:
                complete( false, nil, APIError.unauthorized )
                break;
            case StatusCode.CONFLICT.rawValue:
                complete( false, nil, APIError.serverError )
                break;
            default:
                complete( false, nil, APIError.serverError )
                break
            }
        }
    }
}
