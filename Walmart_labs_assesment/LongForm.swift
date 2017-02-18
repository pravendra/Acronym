//
//  LongForm.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import Foundation

struct LongForm {
    
    /**
     lf -> long form (Acronym long form)
     freq -> frequency (3)
     since -> Since year (1990)
     vars -> Array of Variations
     **/
    var lf : String
    var frequency: Int
    var since: Int
    var vars: [Any]
    
    /**
     initialize LongForm json object with lf,frequency,since year
     and array of variations.
     **/
    init(_ json:json) {
        self.lf = JsonParsing.string(json, "lf")!
        self.frequency = JsonParsing.int(json, "freq")!
        self.since = JsonParsing.int(json, "since")!
        self.vars = JsonParsing.array(json, "vars")
    }
}
