//
//  CurrentWeatherDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation

extension WeatherResponseDTO {
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
        
        func toDomain()->CurrentWeatherEntity {
            
            return CurrentWeatherEntity(tempratureInC: tempratureInC,
                                        isDay: isDay,
                                        condition: condition.toDomain(),
                                        pressureMB: pressureMB,
                                        humidity: humidity,
                                        feelslikeC:feelslikeC,
                                        visKM: visKM,
                                        time: time)
        }
    }

    struct ConditionDTO: Decodable {
        let text: String
        let icon: String
        let code: Int
        
        func toDomain()->Condition {
            return Condition(text: text,
                             icon: icon,
                             code: code)
        }
    }
}
