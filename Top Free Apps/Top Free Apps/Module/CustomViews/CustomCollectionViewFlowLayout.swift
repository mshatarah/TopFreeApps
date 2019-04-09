//
//  CustomCollectionViewFlowLayout.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var numberOfColumns = 3
    var widthRatio:CGFloat = 1.0
    var heightRatio:CGFloat = 1.0
    var itemHeight:CGFloat = 0
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
            
        }
        get {
            let numberOfColumns: CGFloat = CGFloat(self.numberOfColumns)
            
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            if itemHeight > 0 {
                return CGSize(width: (itemHeight > 0 ?itemHeight:itemWidth*widthRatio) , height: itemHeight > 0 ?itemHeight:itemWidth )
            }else{
                return CGSize(width: itemWidth*widthRatio , height: itemWidth*heightRatio )
            }
        }
    }
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
    }
    
    func setNumberOfColumns(number: Int) -> Void {
        self.numberOfColumns = number
    }
    
    func setWidthRatio(ratio: CGFloat) -> Void {
        self.widthRatio = ratio
    }
    
    func setHeightRatio(ratio: CGFloat) -> Void {
        self.heightRatio = ratio
    }
    
    func setCellHeight(height: CGFloat) -> Void {
        self.itemHeight = height
    }
}
