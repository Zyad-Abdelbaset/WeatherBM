//
//  NetworkManager.swift
//  weatherBM
//
//  Created by zyad Baset on 08/01/2025.
//

import Foundation
import Network

protocol ConnectionProtocol {
    func checkConnectivity(compilation: @escaping(Bool)->())
}

class Connection: ConnectionProtocol {
    static let shared = Connection()
    private init() {}
    
    func checkConnectivity(compilation: @escaping(Bool)->()) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            let status = path.status == .satisfied
            compilation(status)
            monitor.cancel()
        }
        monitor.start(queue: .main)
    }
}
