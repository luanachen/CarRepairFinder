//
//  ShopsListTest.swift
//  CarRepairFinderSlowTests
//
//  Created by Luana on 07/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import XCTest
@testable import CarRepairFinder

class ShopsListTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_Name() {
        let shopName = Result(name: "Foo")

        XCTAssertEqual(shopName.name, "Foo")
    }
    
    func test_Init_Address() {
        _ = Result(name: "")
        let shopAddress = Result(geometry: nil, icon: nil, id: nil, name: "", openingHours: nil, photos: nil, placeID: nil, reference: nil, vicinity: "Foo")
        
        XCTAssertEqual( shopAddress.vicinity, "Foo")
    }
   
    
}
