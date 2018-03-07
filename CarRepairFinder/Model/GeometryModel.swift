//
//  GeometryModel.swift
//  CarRepairFinder
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

struct Geometry: Codable {
    let location: Location
    
    init(location: Location) {
        self.location = location
    }
}
