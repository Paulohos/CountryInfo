//
//  CountryEntity.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import Foundation
import ObjectMapper

class CountryEntity: AbstractEntity {
    
    var name: String?
    var alpha2Code : String?
    var alpha3Code : String?
    var capital : String?
    var flagURL: String?
    var region: String?
    var subregion: String?
    var population: Double?
    var nativeName: String?
    var border: [String]?
    var numericCode: String?
    
    var languages: [Languages]?
    
    required init?(map: Map) {
        super.init(map: map)
        
    }
    
    override func mapping(map: Map) {
        
        self.name        <- map["name"]
        self.alpha2Code  <- map["alpha2Code"]
        self.alpha3Code  <- map["alpha3Code"]
        self.capital     <- map["capital"]
        self.languages   <- map["languages"]
        self.flagURL     <- map["flag"]
        
        self.region      <- map["region"]
        self.subregion   <- map["subregion"]
        self.population  <- map["population"]
        self.nativeName  <- map["nativeName"]
        self.border      <- map["border"]
        self.numericCode <- map["numericCode"]
        
    }
    
//    {
//    "name": "Afghanistan",
//    "topLevelDomain": [
//    ".af"
//    ],
//    "alpha2Code": "AF",
//    "alpha3Code": "AFG",
//    "callingCodes": [
//    "93"
//    ],
//    "capital": "Kabul",
//    "altSpellings": [
//    "AF",
//    "Afġānistān"
//    ],
//    "region": "Asia",
//    "subregion": "Southern Asia",
//    "population": 27657145,
//    "latlng": [
//    33,
//    65
//    ],
//    "demonym": "Afghan",
//    "area": 652230,
//    "gini": 27.8,
//    "timezones": [
//    "UTC+04:30"
//    ],
//    "borders": [
//    "IRN",
//    "PAK",
//    "TKM",
//    "UZB",
//    "TJK",
//    "CHN"
//    ],
//    "nativeName": "افغانستان",
//    "numericCode": "004",
//    "currencies": [
//    {
//    "code": "AFN",
//    "name": "Afghan afghani",
//    "symbol": "؋"
//    }
//    ],
//    "languages": [
//    {
//    "iso639_1": "ps",
//    "iso639_2": "pus",
//    "name": "Pashto",
//    "nativeName": "پښتو"
//    },
//    {
//    "iso639_1": "uz",
//    "iso639_2": "uzb",
//    "name": "Uzbek",
//    "nativeName": "Oʻzbek"
//    },
//    {
//    "iso639_1": "tk",
//    "iso639_2": "tuk",
//    "name": "Turkmen",
//    "nativeName": "Türkmen"
//    }
//    ],
//    "translations": {
//    "de": "Afghanistan",
//    "es": "Afganistán",
//    "fr": "Afghanistan",
//    "ja": "アフガニスタン",
//    "it": "Afghanistan",
//    "br": "Afeganistão",
//    "pt": "Afeganistão",
//    "nl": "Afghanistan",
//    "hr": "Afganistan",
//    "fa": "افغانستان"
//    },
//    "flag": "https://restcountries.eu/data/afg.svg",
//    "regionalBlocs": [
//    {
//    "acronym": "SAARC",
//    "name": "South Asian Association for Regional Cooperation",
//    "otherAcronyms": [],
//    "otherNames": []
//    }
//    ],
//    "cioc": "AFG"
//    },
    
    
}


