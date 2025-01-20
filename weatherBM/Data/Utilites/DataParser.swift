//
//  DataParser.swift
//  weatherBM
//
//  Created by zyad baset on 16/01/2025.
//

import Foundation
final class DataParser{
    
    func parsingData<Temp: Decodable>(data: Data,model: Temp.Type) -> Result<Temp, APIError>{
        do{
            let decodedData = try JSONDecoder().decode(model, from: data)
            return .success(decodedData)
        }catch _{
            return .failure(.serializationError)
        }
    }
}
