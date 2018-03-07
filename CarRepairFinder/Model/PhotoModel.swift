//
//  PhotoModel.swift
//  CarRepairFinder
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let height: Int
    let photoReference: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height
        case photoReference = "photo_reference"
        case width
    }
    
    init(height: Int, photoReference: String, width: Int) {
        self.height = height
        self.photoReference = photoReference
        self.width = width
    }
}
