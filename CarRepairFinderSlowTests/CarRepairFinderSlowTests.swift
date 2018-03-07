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
    
    var shopsArray = [Result]()
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        
        let url = Bundle.main.url(forResource: "shops", withExtension: "json")
        
        let myJson = try? Data(contentsOf: url!)
        
        do {
            let decoder = JSONDecoder()
            let shopsDataModel = try decoder.decode(ShopsModel.self, from: myJson!)
            shopsArray = shopsDataModel.results
            if shopsArray.isEmpty {
                print(shopsDataModel.status)
            }
        } catch {
            print("Error while parsing json: \(error)")
        }
        
        
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testParsingToShopModel() {
        let shops = shopsArray[0]
        XCTAssertEqual(shops.name, "Rhythmboat Cruises")
        XCTAssertEqual(shops.vicinity, "Pyrmont Bay Wharf Darling Dr, Sydney")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
