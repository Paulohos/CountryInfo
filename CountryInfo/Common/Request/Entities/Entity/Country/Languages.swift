//
//  Language.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation
import ObjectMapper

class Languages: Mappable {
    
    var iso639_1 : String?
    var iso639 : String?
    var name : String?
    var nativeName : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.iso639_1    <- map["iso639_1"]
        self.iso639      <- map["iso639"]
        self.name        <- map["name"]
        self.nativeName  <- map["nativeName"]
        
        
    }
    
    
}
