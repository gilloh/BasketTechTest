//
//  ServiceManager.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

/// Helper to call services, parse and return as concrete objects

class ServiceManager {
    
    init() {}
    
    /**
     Processes request and returns a parsed concrete response object
     
     - parameter request:    request object with necessary information regarding service endpoint and expected response mapping
     - parameter parser:     specialized parser for expected raw response
     - parameter completion: completion closure
     */
    func process(request:Request, parser:Parser, completion:(AnyObject?) -> Void){
        guard let url = NSURL(string: request.url()) else { return }
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            guard error == nil && data != nil  else {
                //Invoke closure with nothing
                completion(nil)
                return
            }
            // Dynamically load our expected root class to populate with the parsed respones
            let type = request.mappingRootClass()!
            //let string = NSString(data:data!, encoding: NSUTF8StringEncoding)
            let dictionary = parser.parse(data!) as! [String:AnyObject]
            let obj = type.init(dictionary: dictionary)
            completion(obj)
        }
        task.resume()
    }
}