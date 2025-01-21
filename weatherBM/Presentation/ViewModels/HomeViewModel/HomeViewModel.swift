//
//  HomeViewModel.swift
//  weatherBM
//
//  Created by zyad Baset on 09/01/2025.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    var weatherPublisher:AnyPublisher<WeatherEntity,Never> { get }
    var foreCastItems: [ForecastdayEntity] { get }
    var showError: (String) -> Void { get set }
    func loadDate()
}

class HomeViewModel: HomeViewModelProtocol {
    var showError: (String) -> Void = { _ in }
    var useCase:FetchWeatherUsecaseProtocol
    var weatherPublisher: AnyPublisher<WeatherEntity, Never>{
        weatherSubject.eraseToAnyPublisher()
    }
    private var weatherSubject:PassthroughSubject<WeatherEntity, Never>
    private var errorMessage:String
    var foreCastItems: [ForecastdayEntity]
    private var subscriptions: Set<AnyCancellable>
    
    init(usecase: FetchWeatherUsecaseProtocol = FetchWeatherUsecase(), forecastItems: [ForecastdayEntity] = []) {
        weatherSubject = PassthroughSubject<WeatherEntity, Never>()
        errorMessage = ""
        self.foreCastItems = []
        self.useCase = usecase
        subscriptions = Set<AnyCancellable>()
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
                self.weatherSubject.send(weatherData)
                self.foreCastItems = weatherData.forecastDayItems
            }.store(in: &self.subscriptions)

        }

    }
}

