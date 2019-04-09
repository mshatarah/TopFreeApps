//
//  Extensions.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit
import WebKit

public extension UIImageView {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        self.image = nil
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}

extension WKWebView {
    func setDesktopMode(on: Bool) {
        if on {
            customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36"
            return
        }
        customUserAgent = nil
    }
}
