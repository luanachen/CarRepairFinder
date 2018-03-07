//
//  LocationModel.swift
//  CarRepairFinder
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation


struct Location: Codable {
    let lat, lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}
