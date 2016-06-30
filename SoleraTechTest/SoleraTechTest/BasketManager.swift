//
//  BasketManager.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation
import UIKit

/// Singleton class to keep the data available through the app

class BasketManager {
    
    static let sharedInstance = BasketManager()
    private init() {
        self.items = [Item]()
        self.currenciesRawData = [(String, Double)]()
        self.currentCurrency = "USD"
        self.currentRate = 1
    }
    
    // MARK: Shared variables
    
    var items: [Item]
    var totalItems: Int {
        
        return items.count
    }
    
    var currenciesRawData: [(String, Double)]
    
    var currenciesData: [String] {
        var result: [String] = [String]()
        for currency in currenciesRawData {
            let indexStartOfCurrency = currency.0.startIndex.advancedBy(3)
            result.append("\(currency.0.substringFromIndex(indexStartOfCurrency)) rate: \(currency.1)")
        }
        return result
    }
    
    var currentCurrency: String
    var currentRate: Double
    
    var totalAmount: Double {
        var total = 0.0
        
        for item in self.items {
            total += item.totalItemPrice
        }
        return total * self.currentRate
    }
    
    // MARK: Shared methods
    
    func addProducts(items: [Item]) {
        for item in items {
            self.items.append(item)
        }
    }
    
}