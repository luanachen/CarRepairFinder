//
//  CarRepairFinderSlowTests.swift
//  CarRepairFinderSlowTests
//
//  Created by Luana on 06/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import XCTest
@testable import CarRepairFinder

class CarRepairFinderSlowTests: XCTestCase {
        
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        
        sut = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCallToGooglePlacesCompletes() {

        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Sydney&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error

            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

    
}
