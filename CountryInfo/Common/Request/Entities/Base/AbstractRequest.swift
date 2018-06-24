//
//  File.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

class AbstractRequest {
    
    init() {}
    
    var isAbsolutURL: Bool {
        return true
    }
    
    var absoluteUrl: String {
        return ""
    }
    
    var path : String {
        preconditionFailure("This method must be overridden")
    }
    
    var headers : [String: String] {
        return ["culture"       : "pt-br",
                "Content-Type"  : "application/json",
                "Accept"        : "application/json"]
    }
    
    var httpMethod : HttpMethod {
        preconditionFailure("This method must be overridden")
    }
    
    func toDictionary()-> [String : Any] {
        preconditionFailure("This method must be overridden")
    }
    
}
