//
//  APIEndPoint.swift
//  weatherBM
//
//  Created by zyad baset on 23/01/2025.
//

import Foundation

enum APIEndPoint{
    case weather
    var url: String {
        switch self{
        case .weather:
            return "http://api.weatherapi.com/v1/forecast.json"
        }
    }
}
