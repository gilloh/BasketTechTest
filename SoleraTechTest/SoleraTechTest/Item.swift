//
//  Item.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation
import UIKit

class Item {
    let id: Int
    var amount: Int
    let name: String
    let price: Double
    let description: String
    let image: UIImage?
    
    var totalItemPrice: Double {
        return Double(self.amount) * self.price
    }
    
    init(id: Int, amount: Int, name: String, price: Double, description: String, image: UIImage?) {
        self.id = id
        self.amount = amount
        self.name = name
        self.price = price
        self.description = description
        self.image = image
    }
    
    convenience init(id: Int, amount: Int, name: String, price: Double, description: String) {
        self.init(id: id, amount: amount, name: name, price: price, description: description, image: nil)
    }
    
}