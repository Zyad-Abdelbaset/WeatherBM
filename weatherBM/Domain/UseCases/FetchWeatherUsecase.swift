//
//  FetchWeatherUsecase.swift
//  weatherBM
//
//  Created by zyad baset on 14/01/2025.
//

import Foundation
import Combine

protocol FetchWeatherUsecaseProtocol {
    func excute(completion: @escaping(AnyPublisher<WeatherEntity, APIError>)->Void)
}

class FetchWeatherUsecase: FetchWeatherUsecaseProtocol {
    
    private let weatherReposatory: WeatherReposatoriesProtocol
    
    init(weatherReposatory: WeatherReposatoriesProtocol = WeatherReposatories()) {
        self.weatherReposatory = weatherReposatory
    }
    
    func excute(completion: @escaping(AnyPublisher<WeatherEntity, APIError>) -> Void) {
        weatherReposatory.fetchWeatherResponse() { result in
            switch result {
            case .success(let data):
                completion(Future({ promise in
                    promise(.success(data.toDomain()))
            }).eraseToAnyPublisher())
            case .failure(let error):
                completion(Fail(error: error).eraseToAnyPublisher())
            }
        }
    }
    
}
