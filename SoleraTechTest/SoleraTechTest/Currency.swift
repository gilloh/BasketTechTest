//
//  Currency.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

class Currency {
    
    var success: Bool!
    var terms: String!
    var privacy: String!
    var timestamp: Double!
    var source: String!
    var quotes: [String : Double]!
    
    var sortedCurrencies: [(String, Double)] {
        return quotes.sort { $0.0 < $1.0 }
    }
    
    var currenciesTableArray: [String] = [String]()
    
    init(dictionary:[String: AnyObject]) {
        success = dictionary["success"] as? Bool
        terms = dictionary["terms"] as? String
        privacy = dictionary["privacy"] as? String
        timestamp = dictionary["timestamp"] as? Double
        source = dictionary["source"] as? String
        quotes = dictionary["quotes"] as? [String: Double]
    }
}
