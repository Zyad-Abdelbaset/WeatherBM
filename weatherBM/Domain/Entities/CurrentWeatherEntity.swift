//
//  CurrentWeather.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation
// MARK: - Current
struct CurrentWeatherEntity {

    let tempratureInC: Double
    let isDay: Int
    let condition: Condition
    let pressureMB: Int
    let humidity: Int
    let feelslikeC : Double
    let visKM: Int
    let time: String?
}

struct Condition {
    let text: String
    let icon: String
    let code: Int
}
