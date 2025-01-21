//
//  LocationDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation
//MARK: Location DTO

struct LocationDTO:Decodable {
    
    let name, region, country: String?
    let localtime: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name, region, country
        case localtime
        
    }
}
