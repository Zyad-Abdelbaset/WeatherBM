//
//  ForecastDTO+Mapping.swift
//  weatherBM
//
//  Created by zyad baset on 17/01/2025.
//

import Foundation

extension WeatherResponseDTO {
    
    struct ForecastDTO: Decodable {
        
        let forecastday: [ForecastdayDTO]
        
        func toDomain() -> [ForecastdayEntity]{
            return forecastday.map{ $0.toDomain() }
        }
        
        struct ForecastdayDTO: Decodable {
            
            let date: String
            let day: DayDTO
            let hour: [CurrentWeatherDTO]

            enum CodingKeys: String, CodingKey {
                case date
                case day
                case hour
            }
            func toDomain() -> ForecastdayEntity{
                return .init(date: DateOptimizer().getDayName(from: date),
                             day: day.toDomain(),
                             hour: hour.map{ $0.toDomain() })
            }
            struct DayDTO: Decodable {
                let maxTempratureInC: Double
                let minTempratureInC: Double
                let condition: ConditionDTO
                enum CodingKeys: String, CodingKey {
                    case maxTempratureInC = "maxtemp_c"
                    case minTempratureInC = "mintemp_c"
                    case condition
                }
                func toDomain() -> DayEntity{
                    return .init(maxTempratureInC: maxTempratureInC,
                                 minTempratureInC: minTempratureInC,
                                 condition: condition.toDomain()
                    )
                }
            }
            
        }
    }

    

    
}
