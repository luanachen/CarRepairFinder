//
//  OpeningHoursModel.swift
//  CarRepairFinder
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation


struct OpeningHours: Codable {
    let openNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
    
    init(openNow: Bool) {
        self.openNow = openNow
    }
}
