//
//  APIKeyProvider.swift
//  weatherBM
//
//  Created by zyad baset on 29/01/2025.
//

import Foundation
protocol APIKeyProviderProtocol {
    func getAPIKey() -> String
}

struct APIKeyProvider: APIKeyProviderProtocol {
    func getAPIKey() -> String {
        return KeychainService.shared.getAPIKey() ?? "Default"
    }
}
