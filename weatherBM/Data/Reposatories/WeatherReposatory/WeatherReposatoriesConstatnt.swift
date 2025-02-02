//
//  WeatherReposatoriesConstatnt.swift
//  weatherBM
//
//  Created by zyad baset on 23/01/2025.
//

import Foundation

protocol APIParamtersConstant{
    
}
extension WeatherReposatories{
    struct WeatherReposatoriesConstatnt: APIParamtersConstant {
        let aqi:(name:String,value:String) = ("aqi","yes")
        let days:(name:String,value:String) = ("days","3")
        let alerts:(name:String,value:String) = ("alerts","no")
        //let apiKey:(name:String,value:String) = ("key", "e4c83b3aec244e7bb2a120019242208")
    }
}
