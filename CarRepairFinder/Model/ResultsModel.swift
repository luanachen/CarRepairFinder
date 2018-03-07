//
//  ResultsModel.swift
//  CarRepairFinder
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

struct Result: Codable {
    let geometry: Geometry?
    let icon, id: String?
    let name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String?
    let reference: String?
    let vicinity: String?
    
    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case reference, vicinity
    }
    
    init(geometry: Geometry? = nil, icon: String? = nil, id: String? = nil, name: String, openingHours: OpeningHours? = nil, photos: [Photo]? = nil, placeID: String? = nil, reference: String? = nil, vicinity: String? = nil) {
        self.geometry = geometry
        self.icon = icon
        self.id = id
        self.name = name
        self.openingHours = openingHours
        self.photos = photos
        self.placeID = placeID
        self.reference = reference
        self.vicinity = vicinity
    }
}
