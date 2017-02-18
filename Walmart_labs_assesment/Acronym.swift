//
//  Acronym.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

struct Acronym {
    
    /** sf -> short form string of Acronym **/
    var sf : String
    /** sf -> array of long Acronym **/
    var lfs : [Any]
    
    /**
     Intialize json object with sf and array of lfs
     **/
    init(_ json:json) {
        self.sf = JsonParsing.string(json, "sf")!
        self.lfs = JsonParsing.array(json, "lfs")
    }
}
