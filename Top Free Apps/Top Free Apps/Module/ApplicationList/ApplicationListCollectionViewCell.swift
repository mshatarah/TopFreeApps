//
//  TestCollectionViewCell.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

class ApplicationListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    
    var appListCellViewModel : AppListCellViewModel? {
        didSet {
            appNameLabel.text = appListCellViewModel?.appName
            appImageView.downloadImage(from: URL(string: appListCellViewModel?.imageUrl ?? "")!)
        }
    }
}
