//
//  CurrencyResponse.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

class CurrencyResponse : Response {
    var collection: [Currency]
    
    required init(dictionary: [String : AnyObject]) {
        collection = []
        super.init(dictionary: dictionary)
        
        // Populate our currency collection
        collection.append(Currency(dictionary: dictionary))
    }
}