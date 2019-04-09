//
//  Util.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

class Util {
    
    class func isPad() -> Bool {
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return true
        }
        return false
    }
    
}
