//
//  WeatherResponseDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation
// MARK: - WeatherResponse
struct WeatherResponseDTO: Decodable {
    let location: LocationDTO
    let current: CurrentWeatherDTO
    let forecast: ForecastDTO
    
    
}



