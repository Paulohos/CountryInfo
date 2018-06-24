//
//  APISettings.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

struct ApiSettings {
    
    /*---------------------------------------------------------------------------------------------*/
    
    //MARK: - Base
    
    struct Base {
        
        static let scheme: String = ""
        
        private static let prodDomain : String = ""
        
        private static let prodBasePath : String = ""
        
        //MARK: - Domain
        static var domain : String {
            get {
                
                return Base.prodDomain
                
            }
        }
        
        //MARK: - Base Path
        static var basePath : String {
            get {
                
                return Base.prodBasePath
                
            }
        }
        
    }
    
    /*---------------------------------------------------------------------------------------------*/
    
    
    /*---------------------------------------------------------------------------------------------*/
    
    //MARK: - Make URL
    static func makeURL(path: String, parameters: Dictionary<String, String> = [:]) -> URL{
        
        var urlComponents = URLComponents()
        urlComponents.scheme = Base.scheme
        urlComponents.host = Base.domain
        urlComponents.path = "\(Base.basePath)\(path)"
        //urlComponents.port = 5000
        
        urlComponents.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
        }
        
        return urlComponents.url!
        
    }
    
}
