//
//  WeatherReposatoriesProtocol.swift
//  weatherBM
//
//  Created by zyad baset on 15/01/2025.
//

import Foundation
import Combine
protocol WeatherReposatoriesProtocol {
    func fetchWeatherResponse(completion: @escaping(Result<WeatherResponseDTO, APIError>) -> Void )
}
