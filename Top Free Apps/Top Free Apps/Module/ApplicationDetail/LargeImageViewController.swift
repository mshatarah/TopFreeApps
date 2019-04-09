//
//  LargeImageViewController.swift
//  Top Free Apps
//
//  Created by mohammad shatarah on 4/8/19.
//  Copyright © 2019 mohammad shatarah. All rights reserved.
//

import UIKit

class LargeImageViewController: UIViewController {
    
    var imageURL: String?
    @IBOutlet weak var appImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (imageURL != nil) {
            appImageView.downloadImage(from: URL(string: imageURL!)!)
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
