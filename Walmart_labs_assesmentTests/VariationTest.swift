//
//  VariationTest.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/18/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import XCTest

class VariationTest: XCTestCase {
    
    func testWithEmptyData() {
        
        let json: [String:Any] = ["lf":"","since":0,"freq":0]
        let variation = Variation(json)
        
        XCTAssertNotNil(variation)
        XCTAssertEqual(variation.lf, "")
        XCTAssertEqual(variation.since, 0)
        XCTAssertEqual(variation.freq, 0)
    }
    
    func testWithVariationData() {
        
        let json: [String:Any] = ["lf":"human monocyte-macrophages","since":1990,"freq":3]
        let variation = Variation(json)
        
        XCTAssertNotNil(variation)
        XCTAssertEqual(variation.lf, "human monocyte-macrophages")
        XCTAssertEqual(variation.since, 1990)
        XCTAssertEqual(variation.freq, 3)
    }
}
