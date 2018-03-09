//
//  CarRepairFakeTests.swift
//  CarRepairFinderTests
//
//  Created by Luana on 08/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import XCTest
@testable import CarRepairFinder

class CarRepairFakeTests: XCTestCase {
    
    var sut: GetAPIData!
    var shopsArray: [Result]!

    override func setUp() {
        super.setUp()

        sut = GetAPIData()
        shopsArray = [Result]()
        
        let path = Bundle.main.url(forResource: "shops", withExtension: "json")
        let data = try? Data(contentsOf: path!)
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Sydney&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
        
        sut.defaultSession = sessionMock

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // Fake URLSession with DHURLSession protocol and stubs
    func test_UpdateShopListResults_ParsesData() {
        let promise = expectation(description: "Status code: 200")
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Sydney&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        
        let dataTask = sut?.defaultSession.dataTask(with: url!) {
            data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    promise.fulfill()
                    self.shopsArray = (self.sut?.updatePlacesResult(data))!
                }
            }
        }
        dataTask?.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(shopsArray.count, 4, "Didn't parse 4 items from fake response")
    }
}
