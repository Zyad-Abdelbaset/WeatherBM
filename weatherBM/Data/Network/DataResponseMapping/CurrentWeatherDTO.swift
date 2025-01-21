//
//  CurrentWeatherDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation

struct CurrentWeatherDTO: Decodable {
    
    let tempratureInC: Double
    let isDay: Int
    let condition: ConditionDTO
    let pressureMB: Int
    let humidity: Int
    let feelslikeC : Double
    let visKM: Int
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case tempratureInC = "temp_c"
        case isDay = "is_day"
        case condition
        case pressureMB = "pressure_mb"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
        case time
    }
}
struct ConditionDTO: Decodable {
    let text: String
    let icon: String
    let code: Int
}
