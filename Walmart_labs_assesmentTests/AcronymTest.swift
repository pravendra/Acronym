//
//  AcronymTest.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/18/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import XCTest

class AcronymTest: XCTestCase {
    
    func testEmptyAcronym() {
        
        let json: [String:Any] = ["sf":"","lfs":[]]
        let acronym = Acronym(json)
        
        XCTAssertNotNil(acronym)
        XCTAssertEqual(acronym.sf,"")
        XCTAssertEqual(acronym.lfs.count, 0)
    }
    
    func testAcronymData() {
       
        let json: [String:Any] = ["sf":"HMM","lfs":[]]
        let variationJson: [String:Any] = ["lf":"human monocyte-macrophages","freq":3,"since":1990]
        let variation = Variation(variationJson)
        
        let longFormJson: [String:Any?] = ["lf":"human monocyte-macrophage","freq":2,"since":1999,"vars":[]]
        var longForm = LongForm(longFormJson)
        longForm.vars = [variation]

        var acronym = Acronym(json)
        acronym.lfs = [longForm]
        
        XCTAssertNotNil(acronym)
        XCTAssertEqual(acronym.sf,"HMM")
        XCTAssertEqual(acronym.lfs.count, 1)
        
        let longFormData = acronym.lfs[0] as! LongForm
        XCTAssertNotNil(longFormData)
        XCTAssertNotNil(longFormData.lf);
        XCTAssertEqual(longFormData.lf, "human monocyte-macrophage")
        XCTAssertEqual(longFormData.frequency, 2)
        XCTAssertEqual(longFormData.since, 1999)
        XCTAssertNotNil(longFormData.vars)
        XCTAssertEqual(longFormData.vars.count, 1)
        
        let variationData = longForm.vars[0] as! Variation
        XCTAssertEqual(variationData.lf, "human monocyte-macrophages")
        XCTAssertEqual(variationData.since, 1990)
        XCTAssertEqual(variationData.freq, 3)
    }
}
