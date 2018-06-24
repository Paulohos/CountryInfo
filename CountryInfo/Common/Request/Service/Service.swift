//
//  Service.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

struct Service {
    
    private init(){}
    
    static let shared = Service()
    
    func request<T: AbstractRequest, U: AbstractEntity>(request: T, completion: @escaping ([U]?) -> (), fail: @escaping (NSError) -> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Request
        let url = request.isAbsolutURL ? URL(string: request.absoluteUrl) : ApiSettings.makeURL(path: request.path)
        var  urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = request.httpMethod.method
        
        //POST
        if request.httpMethod == .post || request.httpMethod == .put{
            
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: request.toDictionary(), options: [])
            
        } else { // GET
            
            if !request.isAbsolutURL {
                urlRequest.url = ApiSettings.makeURL(path: request.path, parameters: request.toDictionary() as! Dictionary<String, String>)
                
            }
            
        }
        
        //HEADERS
        for (key, value) in request.headers{
            urlRequest.allHTTPHeaderFields?[key] = value
        }
        
        print(urlRequest.urlRequest ?? "Not URL!!!!")
        print(request.toDictionary())
        
        Alamofire.request(urlRequest.url!,
                          method: HTTPMethod.init(rawValue: request.httpMethod.method)!,
                          parameters: request.toDictionary(),
                          encoding: JSONEncoding.default,
                          headers: urlRequest.allHTTPHeaderFields)
            .responseData { (data) in
                
                if data.error == nil {
                    
                    if data.response?.statusCode == ApiResponse.StatusCode.Successful.OK {

                        do {
                            let json = try JSONSerialization.jsonObject(with: data.data!) as! [[String : Any]]
                            
                            let response = Mapper<U>().mapArray(JSONArray: json)
                            completion(response)
                        } catch {
                            let requestError = ApiResponse.StatusCode.DomainError.Unknown
                            fail(NSError(domain: requestError.0, code: requestError.1, userInfo: ["message": requestError.2]))
                        }
                        
                    } else { // ERROR
                        let requestError = ApiResponse.StatusCode.DomainError.Unknown
                        fail(NSError(domain: requestError.0, code: requestError.1, userInfo: ["message": requestError.2]))
                        
                    }
                    
                } else { // WITH ERROR
                    let requestError = ApiResponse.StatusCode.DomainError.Offline
                    fail(NSError(domain: requestError.0, code: requestError.1, userInfo: ["message": requestError.2]))
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                
        }

    }
    
}
