//
//  ApplicationDetailViewController.swift
//  Top Free Apps
//
//  Created by mohammad shatarah on 4/8/19.
//  Copyright © 2019 mohammad shatarah. All rights reserved.
//

import UIKit

class ApplicationDetailViewController: UIViewController {
    
    var application: Application?
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var rightsLabel: UILabel!
    @IBOutlet weak var dateReleasedLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView() {
        appNameLabel.text = application?.name.label
        rightsLabel.text = application?.rights.label
        categoryLabel.text = application?.category.attributes.label
        descriptionTextView.text = application?.summary.label
        dateReleasedLabel.text = application?.releaseDate.attributes.label
        
        if ((application?.images.count) != nil) {
            appImageView.downloadImage(from: URL(string: application?.images[((application?.images.count)!-1)].label ?? "")!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ApplicationDetailViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AppStoreWebViewController,
            let link = application?.link.attributes.href {
            vc.appLink = link
            
        }else if let vc = segue.destination as? LargeImageViewController{
            if ((application?.images.count) != nil) {
                vc.imageURL = application?.images[((application?.images.count)!-1)].label ?? ""
            }
        }
    }
}
