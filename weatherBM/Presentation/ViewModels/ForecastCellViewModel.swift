//
//  ForecastCellViewModel.swift
//  weatherBM
//
//  Created by zyad baset on 10/01/2025.
//

import Foundation
import Combine

protocol ForecastdayProtocol {
    var forecastDay:ForecastdayEntity { get }
    
}
class ForecastCellViewModel:ForecastdayProtocol {
    var forecastDay:ForecastdayEntity
    init(forecastDay: ForecastdayEntity) {
        self.forecastDay = forecastDay
    }
}
