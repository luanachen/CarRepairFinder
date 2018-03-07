//
//  ShopsModel.swift
//  CarRepairFinder
//
//  Created by Luana on 05/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

class ShopsModel: Codable {
    let results: [Result]
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case results, status
    }
    
    init(results: [Result], status: String? = nil) {
        self.results = results
        self.status = status
    }
}




