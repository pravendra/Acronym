//
//  JsonParsing.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import Foundation

// This is the Json object which we will be passing around.
typealias json = [String:Any]

/// This class will handle all the Json parsing for us.
open class JsonParsing {
    
    /**
     This the function to extract String value by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - A String Object or nil.
     */
    
    class func string(_ json: json,_ key: String) -> String? {
        guard let value = json[key] else {
            return nil
        }
        return value as? String
    }
    
    /**
     This the function to extract Int value by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - An Int Value or nil.
     */

    class func int(_ json: json,_ key: String) -> Int? {
        guard let value = json[key] else {
            return nil
        }
        return value as? Int
    }
    
    /**
     This the function to extract Double value by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - A Double Object or nil.
     */
    
    class func double(_ json: json,_ key: String) -> Double? {
        guard let value = json[key] else {
            return nil
        }
        return value as? Double
    }
    
    /**
     This the function to extract Bool value by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - A Boolean Object true/false.
     */
    
    class func bool(_ json: json,_ key: String) -> Bool {
        guard let value = json[key] else {
            return false
        }
        return value as! Bool
    }
    
    /**
     This the function to extract Json object by passing key for that object.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - A Json Object or nil.
     */
    
    class func object(_ json: json,_ key: String) -> json? {
        guard let value = json[key] else {
            return json
        }
        return value as? json
    }
    
    /**
     This the function to extract Array by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - An Array Object or nil.
     */
    
    class func array(_ json: json,_ key: String) -> [json] {
        guard let value = json[key] else {
            return []
        }
        return value as! [json]
    }
    
    /**
     This the function to extract Data by passing key for that value.
     Parameters :
     - json : The full json object which is returned from server
     - key : For which you need the value.
     
     Returns :
     - An Data Object or nil.
     */
    class func data(_ json: json,_ key: String) -> NSData? {
        guard let value = json[key] else {
            return nil
        }
        let data = (value as? String)?.data(using:String.Encoding.utf8, allowLossyConversion:true)
        return NSData(data: data!)
    }
    
}
