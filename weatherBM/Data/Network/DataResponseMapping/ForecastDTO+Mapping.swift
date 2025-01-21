//
//  ForecastDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation

    
struct ForecastDTO: Decodable {
    
    let forecastday: [ForecastdayDTO]
    
    
}
        
struct ForecastdayDTO: Decodable {
    
    let date: String
    let day: DayDTO
    let hour: [CurrentWeatherDTO]
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case hour
    }

}
struct DayDTO: Decodable {
    let maxTempratureInC: Double
    let minTempratureInC: Double
    let condition: ConditionDTO
    enum CodingKeys: String, CodingKey {
        case maxTempratureInC = "maxtemp_c"
        case minTempratureInC = "mintemp_c"
        case condition
    }
}
