//
//  ParametersIO.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

class ParameterIO {
    
    /// Single Object
    fileprivate final var object : Any?
    
    init() {
        
    }

    init(withObject object : Any?) {
        
        self.object = object
        
    }

    final func setObject(object : Any?) {
        
        self.object = object
        
    }

    final func getObject<T>(type : T.Type) -> T {
        
        return (self.object as? T)!
    }

    
}
