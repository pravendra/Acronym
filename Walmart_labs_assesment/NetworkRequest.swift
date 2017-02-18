//
//  NetworkRequest.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

class NetworkRequest: NSObject {
    
    var acronymData : Acronym? = nil
    /** longFormArray for storing LongForm objects **/
    var longFormsArray = [LongForm]()
    /** variationsArray for storing Variation objects **/
    var variationsArray = [Variation]()
    
    /** search result for acronym
     CompletionHandler returns Acronym object and error
     **/
    open func searchLongFormsFor(_ acronym:String,_ completionHandler:@escaping (_ response: Acronym?, _ error: Error?) -> Void) {
        
        // construct dictionary parameters
        let params = ["sf":acronym]
        
        // Initialize NetworkManager and search acronym
        let networkManager = NetworkManager()
        networkManager.searchAcronym(baseURL, params, { (URLSessionDataTask, _ data: [Any]) in
            
            // set data models
            self.acronymData = self.parseJsonData(data)
            // success result
            completionHandler(self.acronymData,nil)
            
        }) { (URLSessionDataTask,_ error: Error) in
            
            // failure result
            completionHandler(nil,error)
        }
    }
    
    fileprivate func parseJsonData(_ responseObject:[Any]?) -> Acronym? {
        
        // check nil responseObject
        guard let responseObject = responseObject else {
            return nil
        }
        
        // Set Acronym, LongForm and Variation models
        
        for object in responseObject {
            
            self.acronymData = Acronym(object as! json)
            for longData in self.acronymData!.lfs {
                
                var longFormData = LongForm(longData as! json)
                for variation in longFormData.vars {
                    let variationData = Variation(variation as! json)
                    self.variationsArray.append(variationData)
                }
                longFormData.vars = self.variationsArray as [Any]
                self.longFormsArray.append(longFormData)
            }
            self.acronymData?.lfs = self.longFormsArray as [Any]
            
        }
        return self.acronymData
    }
}
