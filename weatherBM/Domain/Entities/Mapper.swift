//
//  Mapper.swift
//  weatherBM
//
//  Created by zyad baset on 21/01/2025.
//

import Foundation
extension WeatherResponseDTO{
    func toDomain() -> WeatherEntity {
        return .init(location: location.toDomain(),
                     current: current.toDomain(),
                     forecastDayItems: forecast.forecastday.map{ $0.toDomain()}
        )
    }
}
extension LocationDTO{
    func toDomain() -> LocationEntity{
        return .init(name: name,
                     region: region,
                     country: country,
                     localtime: localtime)
        
    }
}
extension ForecastDTO{
    func toDomain() -> [ForecastdayEntity]{
        return forecastday.map{ $0.toDomain() }
    }
}
extension ForecastdayDTO{
    func toDomain() -> ForecastdayEntity{
        return .init(date: DateOptimizer().getDayName(from: date),
                     day: day.toDomain(),
                     hour: hour.map{ $0.toDomain() })
    }
}

extension ConditionDTO{
    
    func toDomain()->Condition {
        return Condition(text: text,
                         icon: icon,
                         code: code)
    }
}
extension DayDTO{
    func toDomain() -> DayEntity{
        return .init(maxTempratureInC: maxTempratureInC,
                     minTempratureInC: minTempratureInC,
                     condition: condition.toDomain()
        )
    }
}
extension CurrentWeatherDTO{
    func toDomain()->CurrentWeatherEntity {
        
        return CurrentWeatherEntity(tempratureInC: tempratureInC,
                                    isDay: isDay,
                                    condition: condition.toDomain(),
                                    pressureMB: pressureMB,
                                    humidity: humidity,
                                    feelslikeC:feelslikeC,
                                    visKM: visKM,
                                    time: time)
    }
}
