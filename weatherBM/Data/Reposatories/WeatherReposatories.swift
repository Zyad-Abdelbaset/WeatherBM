//
//  WeatherReposatories.swift
//  weatherBM
//
//  Created by zyad baset on 14/01/2025.
//

import Foundation

final class WeatherReposatories: WeatherReposatoriesProtocol {
    private let networkChecker: ConnectionProtocol
    private let networkService: NetworkServiceWeatherProtocol
    
    init(networkChecker: ConnectionProtocol = Connection.shared,
         networkService: NetworkServiceWeatherProtocol = NetworkService.shared) {
        self.networkChecker = networkChecker
        self.networkService = networkService
    }
    /// Function to Fetch Weather Response and return closure with WeatherResponseDTO or APIError
    ///  - Paramters:
    ///   -
    func fetchWeatherResponse(completion: @escaping(Result<WeatherResponseDTO, APIError>) -> Void ){
        networkChecker.checkConnectivity { isConnect in
            if isConnect {
                self.networkService.fetchData(type: WeatherResponseDTO.self) { result in
                    switch result {
                    case .failure(let error):
                        completion(.failure(error))
                        
                    case .success(let weatherResponse):
                        completion(.success(weatherResponse))
                    }
                }
            } else {
                completion(.failure(.noConnection))
            }
        }
    }
}
