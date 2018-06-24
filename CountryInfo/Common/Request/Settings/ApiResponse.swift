//
//  ApiResponse.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation

struct ApiResponse {
    
    // MARK: - StatusCode
    public struct StatusCode {
        
        // MARK: - Successful - 2xx
        struct Successful {
            
            static let OK               : Int = 200
            static let Created          : Int = 201
            static let Accepted         : Int = 202
            static let NonAuth          : Int = 203
            static let NoContent        : Int = 204
            static let RstContent       : Int = 205
            static let PrtContent       : Int = 206
        }
        
        // MARK: - ClientError - 4xx
        struct ClientError {
            
            static let BadRequest       : Int = 400
            static let Unauthorized     : Int = 401
            static let Forbidden        : Int = 403
            static let NotFound         : Int = 404
            static let NotAllowed       : Int = 405
            static let NotAcceptable    : Int = 406
        }
        
        // MARK: - ServerError - 5xx
        struct ServerError {
            
            static let Internal             : Int = 500
            static let NotImplemented       : Int = 501
            static let BadGateway           : Int = 502
            static let ServiceUnavailable   : Int = 503
            static let GatewayTimeout       : Int = 504
        }
        
        // MARK: - DomainError - 100x
        public struct DomainError {
            public static let Offline : (String, Int, String) = ("DomainError", -1009, "Sem conexão com a internet")
            public static let FacebookLogin : (String, Int, String) = ("DomainError", -2000, "Ocorreu um erro ao realizar o login com o Facebook, por favor, tente novamente")
            public static let Register : (String, Int, String) = ("DomainError", -2001, "Ocorreu um erro ao realizar a operação, por favor, tente novamente")
            public static let CepNotFound : (String, Int, String) = ("DomainError", -2002, "Nenhum endereço encontrado no CEP informado")
            public static let Unknown : (String, Int, String) = ("DomainError", 404, "Ocorreu um erro na requisição, por favor, tente novamente")
        }
        
    }
    
}
