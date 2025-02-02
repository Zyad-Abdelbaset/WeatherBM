//
//  KeyChainServise.swift
//  weatherBM
//
//  Created by zyad baset on 29/01/2025.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    
    func saveAPIKey(_ key: String) {
        let keyData = key.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "weather_api_key",
            kSecValueData as String: keyData
        ]
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func getAPIKey() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "weather_api_key",
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        
        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
