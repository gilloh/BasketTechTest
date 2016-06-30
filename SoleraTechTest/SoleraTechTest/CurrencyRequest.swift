//
//  CurrencyRequest.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

class CurrencyRequest: Request {
    
    private let key = "f0e5fa2d8378c05bfc27169861916068"
    
    override func path() -> String {
        return "?access_key=\(key)"
    }
    
    override func mappingRootClass() -> Response.Type? {
        return CurrencyResponse.self
    }
    
    override init(withBaseUrl baseUrl:String) {
        super.init(withBaseUrl: baseUrl)
    }
}