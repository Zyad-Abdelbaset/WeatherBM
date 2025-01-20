//
//  HomeViewModel.swift
//  weatherBM
//
//  Created by zyad Baset on 09/01/2025.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    var weatherData: PassthroughSubject<WeatherEntity, Never> { get }
    var foreCastItems: [ForecastdayEntity] { get }
    var showError: (String) -> Void { get set }
    func loadDate()
}

class HomeViewModel: HomeViewModelProtocol {
    var showError: (String) -> Void = { _ in }
    var useCase:FetchWeatherUsecaseProtocol
    var weatherData:PassthroughSubject<WeatherEntity,Never>
    var errorMessage:String
    var foreCastItems: [ForecastdayEntity]
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        weatherData = PassthroughSubject<WeatherEntity, Never>()
        errorMessage = ""
        foreCastItems = []
        useCase = FetchWeatherUsecase()
    }
    
    func loadDate() {
        useCase.excute { publisher in
            publisher.sink { completion in
                switch(completion){
                            case .finished:
                                print("completed in load data")
                            case .failure(let error):
                                print(error.localizedDescription)
                                self.showError(error.localizedDescription)
                            }
            } receiveValue: {[weak self] weatherData in
                guard let self = self else {
                    return
                }
                self.weatherData.send(weatherData)
                self.foreCastItems = weatherData.forecastDayItems
            }.store(in: &self.subscriptions)

        }

    }
}

