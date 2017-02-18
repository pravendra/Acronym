//
//  Variation.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import Foundation

struct Variation {
    
    /**
     lf -> long form of variation
     freq -> frequence (3)
     since -> Since year (1990)
     **/
    var lf : String
    var freq: Int
    var since: Int
    
    /**
     Initialize Variation json object with lf,
     freqence and since year.
     **/
    init(_ json:json) {
        self.lf = JsonParsing.string(json, "lf")!
        self.freq = JsonParsing.int(json, "freq")!
        self.since = JsonParsing.int(json, "since")!
    }
}
