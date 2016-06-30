//
//  Request.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

class Request {
    var baseUrl: String
    func path() -> String{
        return ""
    }
    func url() ->String{
        return baseUrl + path()
    }
    func mappingRootClass() -> Response.Type? {
        return nil
    }
    init(withBaseUrl baseUrl:String){
        self.baseUrl = baseUrl
    }
}