//
//  JSONParser.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

/// Assuming JSON this class parses raw data

class JSONParser : Parser {
    override func parse(data: NSData) -> AnyObject? {
        var retVal:AnyObject? = nil
        do {
            retVal = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
        } catch {
        }
        return retVal
    }
}