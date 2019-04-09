//
//  Constant.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit


enum StatusCode: Int {
    case SUCCESS = 200
    case CREATED = 201
    case SERVER_ERROR = 100
    case UNAUTHORIZED = 401
    case CONFLICT = 409
}

enum APIError: String, Error {
    case noNetwork = "No Network"
    case permissionDenied = "You don't have permission"
    case unauthorized = "Unauthorized"
    case serverError = "Failed to connect to service"

}

class Constant: NSObject {

    static var TOP_FREE_APPS_URL = "https://itunes.apple.com/jo/rss/topfreeapplications/limit=50/json";
    
}
