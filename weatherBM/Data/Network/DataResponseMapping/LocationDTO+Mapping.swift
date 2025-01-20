//
//  LocationDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation
//MARK: Location DTO
extension WeatherResponseDTO {
    
    struct LocationDTO:Decodable {
        
        let name, region, country: String?
        let localtime: String?
        
        enum CodingKeys: String, CodingKey {
            
            case name, region, country
            case localtime
            
        }
        func toDomain() -> LocationEntity{
            
            return .init(name: name,
                         region: region,
                         country: country,
                         localtime: localtime)
            
        }
    }
    
}
