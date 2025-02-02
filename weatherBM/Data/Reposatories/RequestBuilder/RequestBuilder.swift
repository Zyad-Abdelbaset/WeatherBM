//
//  RequestBuilder.swift
//  weatherBM
//
//  Created by zyad baset on 29/01/2025.
//

import Foundation



//Product
//URLRequest

//Builder
class RequestBuilder {
    private var baseURL: APIEndPoint?
    private var parameters: [String: String] = [:]
    private var apiKey: String?
    
    func addBaseURL(url: APIEndPoint) -> RequestBuilder {
        baseURL = url
        return self
    }
    
    func addApiKey(key: String) -> RequestBuilder{
        apiKey = key
        return self
    }
    
    func addQueryparameters(name: String, value: String) -> RequestBuilder {
        parameters[name] = value
        return self
    }
    
    func build() -> URLRequest? {
        guard let baseURL = baseURL, let apiKey = apiKey else {
            return nil
        }
        guard var urlComponent = URLComponents(string: baseURL.url) else {
            return nil
        }
        parameters["key"] = apiKey
        urlComponent.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        guard let url = urlComponent.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}

//Director
class RequestDirector {
    func buildWeatherRequest(coordinates: (longitude: Double, latitude: Double)) -> URLRequest? {
        
        let constant = WeatherReposatories.WeatherReposatoriesConstatnt()
        let requestBuilder = RequestBuilder()
            .addApiKey(key: APIKeyProvider().getAPIKey())
            .addBaseURL(url: .weather)
            .addQueryparameters(
            name: "q",
            value: "\(coordinates.latitude),\(coordinates.longitude)"
        )
            .addQueryparameters(
            name: constant.alerts.name,
            value: constant.alerts.value
        )
            .addQueryparameters(
            name: constant.aqi.name,
            value: constant.aqi.value
        )
            .addQueryparameters(
            name: constant.days.name,
            value: constant.days.value
        )
        guard let request = requestBuilder.build() else {
            return nil
        }
        return request
    }
}
