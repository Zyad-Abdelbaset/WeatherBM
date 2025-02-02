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
    //private let endPoint: APIEndPoint
    //private let apiKey: String//TODO: KeyChain or File
    private let longitude:Double
    private let latitude:Double
    /*private var link: URLComponents? {
        var urlComponent = URLComponents(string: endPoint.url)
        let constants = WeatherReposatoriesConstatnt()
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: "\(latitude),\(longitude)"),
            URLQueryItem(name: constants.aqi.name, value: constants.aqi.value),
            URLQueryItem(name: constants.days.name, value: constants.days.value),
            URLQueryItem(name: constants.alerts.name, value: constants.alerts.value)
        ]
        return urlComponent
    }*/
    init(longitude: Double = 31.343122, latitude: Double = 30.051584, networkChecker: ConnectionProtocol = Connection.shared,
         networkService: NetworkServiceWeatherProtocol = NetworkService()) {
        self.networkChecker = networkChecker
        self.networkService = networkService
        self.longitude = longitude
        self.latitude = latitude
        //apiKey = "e4c83b3aec244e7bb2a120019242208"
        //self.endPoint = endPoint
    }
    
    
    func fetchWeatherResponse(completion: @escaping(Result<WeatherResponseDTO, APIError>) -> Void ){
        //KeychainService().saveAPIKey(apiKey)
        networkChecker.checkConnectivity {[weak self] isConnect in
            guard let self = self else { return }
            if isConnect {
                
                guard let request = RequestDirector().buildWeatherRequest(coordinates: (self.longitude,self.latitude)) else {
                    completion(.failure(.invalidEndPoint))
                    return
                }
                 
                self.networkService.fetchData(type: WeatherResponseDTO.self, request: request) { result in
                    switch result {
                    case .failure(let error):
                        completion(.failure(error))
                        
                    case .success(let weatherResponse):
                        completion(.success(weatherResponse))
                    }
                }
            } else {
                completion(.failure(.noConnection))
                //TODO: 
            }
        }
    }
}
