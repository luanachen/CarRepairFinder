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
    
    func test_Init_TakesName() {
        let shopName = Result.init(name: "Foo", vicinity: nil)

        XCTAssertEqual(shopName.name, "Foo")
    }
    
    func test_Init_TakesAddress() {
        let shopAddress = Result.init(name: "Foo", vicinity: "Foo2")
        
        XCTAssertEqual(shopAddress.vicinity, "Foo2")
    }
   
    
}
