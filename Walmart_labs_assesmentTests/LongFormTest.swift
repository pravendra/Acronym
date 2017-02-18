//
//  LongFormTest.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/18/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import XCTest

class LongFormTest: XCTestCase {
    
    func testWithEmptyData() {
        
        let json: [String:Any] = ["lf":"","freq":0,"since":0,"vars":[]]
        let longForm = LongForm(json)
        
        XCTAssertNotNil(longForm)
        XCTAssertEqual(longForm.lf, "")
        XCTAssertEqual(longForm.since, 0)
        XCTAssertEqual(longForm.frequency, 0)
        XCTAssertEqual(longForm.vars.count, 0)
    }
    
    func testWithLongData() {
        
        let variationJson: [String:Any] = ["lf":"human monocyte-macrophages","freq":3,"since":1990]
        let variation = Variation(variationJson)
        let longFormJson: [String:Any?] = ["lf":"human monocyte-macrophage","freq":2,"since":1999,"vars":[]]
        var longForm = LongForm(longFormJson)
        longForm.vars = [variation]
        
        XCTAssertNotNil(longForm)
        XCTAssertEqual(longForm.lf, "human monocyte-macrophage")
        XCTAssertEqual(longForm.since, 1999)
        XCTAssertEqual(longForm.frequency, 2)
        XCTAssertEqual(longForm.vars.count, 1)
        
        let variationData = longForm.vars[0] as! Variation
        XCTAssertEqual(variationData.lf, "human monocyte-macrophages")
        XCTAssertEqual(variationData.since, 1990)
        XCTAssertEqual(variationData.freq, 3)
    }
}
