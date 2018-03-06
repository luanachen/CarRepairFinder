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
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case results, status
    }
    
    init(results: [Result], status: String) {
        self.results = results
        self.status = status
    }
}

class Result: Codable {
    let geometry: Geometry
    let icon, id, name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String
    let reference: String
    let vicinity: String
    
    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case reference, vicinity
    }
    
    init(geometry: Geometry, icon: String, id: String, name: String, openingHours: OpeningHours?, photos: [Photo], placeID: String, reference: String, vicinity: String) {
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

class Geometry: Codable {
    let location: Location
    
    init(location: Location) {
        self.location = location
    }
}

class Location: Codable {
    let lat, lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}

class OpeningHours: Codable {
    let openNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
    
    init(openNow: Bool) {
        self.openNow = openNow
    }
}

class Photo: Codable {
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
