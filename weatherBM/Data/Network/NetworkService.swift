//
//  NetworkService.swift
//  weatherBM
//
//  Created by zyad Baset on 08/01/2025.
//

import Foundation
import Combine

protocol NetworkServiceWeatherProtocol {
    func fetchData<Temp: Decodable> (type: Temp.Type, completion: @escaping(Result<Temp, APIError>) -> Void )
}

protocol NetworkServiceImageProtocol {
    func fetchImage(link: String) -> AnyPublisher<Data, APIError>
}

class NetworkService: NetworkServiceWeatherProtocol, NetworkServiceImageProtocol {
    private let longitude = 31.343122
    private let latitude = 30.051584
    private let apiKey = "e4c83b3aec244e7bb2a120019242208"
    static var shared: NetworkService = NetworkService()
    private let dataParser: DataParser
    private init() {
        dataParser = DataParser()
    }
    
    private var fullURL: String {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(latitude),\(longitude)&days=3&aqi=yes&alerts=no"
        return url
    }
    
    func fetchData<Temp: Decodable> (type: Temp.Type, completion: @escaping(Result<Temp, APIError>) -> Void ) {
        guard let url = URL(string: fullURL) else {
            completion(.failure(.invalidEndPoint) )
            return
        }
        // Request and force cache it
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check Error
            if error != nil {
                completion(.failure(.apiError))
                return
            }
            // check response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            //check data
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            let serilizationResult = self.dataParser.parsingData(data: data, model: Temp.self)
            switch serilizationResult {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
        
    }
    
    func fetchImage(link: String) -> AnyPublisher<Data, APIError> {
        guard let url = URL(string: "https:\(link)") else {
            return Fail(error: APIError.invalidEndPoint).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                return APIError.invalidEndPoint
            }
            .flatMap { data, response ->AnyPublisher<Data, APIError> in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    return Fail(error: APIError.invalidResponse).eraseToAnyPublisher()
                }
                return Future({ promise in
                    promise(.success(data))
                })
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}




//        return URLSession.shared.dataTaskPublisher(for: url)
//            .mapError { error in
//                print(error.localizedDescription)
//                return APIError.invalidEndPoint }
//            .flatMap { data, response ->AnyPublisher<Temp, APIError> in
//                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                    return Fail(error: APIError.invalidResponse).eraseToAnyPublisher()
//                }
//                return Just(data)
//                    .decode(type: Temp.self, decoder: JSONDecoder())
//                    .mapError { _ in APIError.serializationError }
//                    .eraseToAnyPublisher()
//            }.eraseToAnyPublisher()


//{ weatherResponse, error in
//                if let error = error{
//                    completion(.failure(error))
//                    return
//                }
//                guard let weatherResponse = weatherResponse else {
//                    completion(.failure(.noData))
//                    return
//                }
//                completion(.success(weatherResponse))
//            }


//, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60
