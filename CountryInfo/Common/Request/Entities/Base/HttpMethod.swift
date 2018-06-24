//
//  HttpMethod.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

enum HttpMethod {
    case get
    case post
    case put
    case delete
    
}

extension HttpMethod {
    var method : String {
        switch self {
        case .get   : return "GET"
        case .post  : return "POST"
        case .put   : return "PUT"
        case .delete: return "DELETE"
            
        }
    }
}
