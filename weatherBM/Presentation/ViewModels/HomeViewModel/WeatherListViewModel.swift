//
//  WeatherListViewModel.swift
//  weatherBM
//
//  Created by zyad baset on 18/01/2025.
//

import Foundation

//struct WeatherListViewModel {
//    let isDay:Int
//    let city: String
//    let date:String
//    let temperature: Double
//    let condition: String
//    let maxTemperature: Double
//    let minTemperature: Double
//    let visibility: Int
//    let feelsLike: Double
//    let humidity: Int
//    let pressure: Int
//    let forecastItemViewModels: [ForeCastItemViewModel]
//    
//    init(weatherData:WeatherEntity){
//        isDay = weatherData.current.isDay
//        city = weatherData.location.name ?? ""
//        date = weatherData.location.localtime ?? ""
//        temperature = weatherData.current.tempratureInC
//        condition = weatherData.current.condition.text
//        maxTemperature = weatherData.forecast.forecastday.first?.day.maxTempratureInC ?? 0
//        minTemperature = weatherData.forecast.forecastday.first?.day.minTempratureInC ?? 0
//        visibility = weatherData.current.visKM
//        feelsLike = weatherData.current.feelslikeC
//        humidity = weatherData.current.humidity
//        pressure = weatherData.current.pressureMB
//        forecastItemViewModels = weatherData.forecast.forecastday.map{ForeCastItemViewModel(forecastDay: $0)}
//    }
//}
//
//struct ForeCastItemViewModel {
//    let day:String
//    let icon:String
//    let maxTemperature:Double
//    let minTemperature:Double
//    
//    init(forecastDay:ForecastdayEntity){
//        day = forecastDay.date
//        icon = forecastDay.day.condition.icon
//        maxTemperature = forecastDay.day.maxTempratureInC
//        minTemperature = forecastDay.day.minTempratureInC
//    }
//}
