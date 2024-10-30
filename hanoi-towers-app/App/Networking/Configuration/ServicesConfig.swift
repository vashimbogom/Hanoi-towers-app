//
//  ServicesConfig.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

protocol ServiceConfigurable {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

class ApiDataNetworkConfig: ServiceConfigurable {
    
    let baseURL: String
    let headers: [String: String]
    
     init(baseURL: String,
        headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
