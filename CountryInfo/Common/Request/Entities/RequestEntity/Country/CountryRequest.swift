//
//  CountryRequest.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

class CoutryRequest: AbstractRequest {
    
    override var isAbsolutURL: Bool {
        return true
    }
    
    override var absoluteUrl: String {
        return "https://restcountries.eu/rest/v2/all"
        
    }
    
    override var path: String {
        return ""
    }
    
    override var httpMethod: HttpMethod {
        return .get
    }
    
    override var headers: [String : String] {
        return [:]
    }
    
    override func toDictionary() -> [String : Any] {
        return [:]
    }
    
}
