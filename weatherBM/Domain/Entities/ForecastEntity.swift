//
//  Forecast.swift
//  weatherBM
//
//  Created by zyad Baset on 08/01/2025.
//

import Foundation

struct ForecastdayEntity {
    let date: String
    let day: DayEntity
    let hour: [CurrentWeatherEntity]
}

struct DayEntity {
    let maxTempratureInC: Double 
    let minTempratureInC: Double //
    let condition: Condition
}
