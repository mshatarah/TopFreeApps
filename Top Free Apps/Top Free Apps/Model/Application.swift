//
//  Application.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

import Foundation

struct Applications: Codable {
    let feed: Entry
}

struct Entry: Codable {
     let entry: [Application]
}

struct Application: Codable {

    let name: Label
    let images: [Label]
    let summary: Label
    let category: Attribute
    let releaseDate: Attribute
    let link: LinkAttribute
    let rights: Label
    
    enum CodingKeys: String, CodingKey {
        case name = "im:name"
        case images = "im:image"
        case summary
        case category
        case releaseDate = "im:releaseDate"
        case link
        case rights
    }
}

struct Label: Codable {
     let label:String
}

struct Attribute: Codable {
    let attributes: Label
}

struct LinkAttribute: Codable {
    let attributes: Link
}

struct Link: Codable {
    let href:String
}
