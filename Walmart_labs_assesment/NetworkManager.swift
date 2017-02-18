//
//  NetworkManager.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

/**
   NetworkManager with URLSession for 
   calling searchAcronym api to retrieve data
 **/
class NetworkManager: NSObject {
    
    var dataTask: URLSessionDataTask?
    
    // Get request for searcing long form and variations of Acronyms
    // parameters dictionary hold @{@"sf":"Acronym"}
    open func searchAcronym(_ urlString:String,_ parameters:[String:Any],_ success: @escaping ((URLSessionDataTask, [Any]) -> Void), _ failure:@escaping ((URLSessionDataTask, Error) -> Void)) {

        // constructing parameter string from parameter dictionary
        let parameterString = parameters.stringFromHttpParameters()
        
        // appending parameter string to urlString and constructing URL
        let url = URL(string:"\(urlString)?\(parameterString)")
        
        // Constructing URLRequest and setting httpMethod
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        // URLSessionDataTask
        dataTask = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            
            guard error == nil else {
                // failure block
                failure(self.dataTask!,error!)
                return
            }
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Any]
                {
                    // success block
                    success(self.dataTask!,json)
                }
            }catch {
                
                // failure block with exception
                failure(self.dataTask!,error)
            }
        }
        dataTask?.resume()
    }
}


