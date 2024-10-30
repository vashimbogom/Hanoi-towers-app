//
//  EnvironmentConfiguration.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

final class EnvironmentConfiguration {
    
    static let appEnvironment: Env = {
        guard let environment = EnvironmentConfiguration.infoDictionary[ConfigurationKeys.Environment] as? String else {
            fatalError("Environment Key not set")
        }
        return Env(fromRawValue: environment)
    }()
    
    static var hostScheme: String = {
        guard let hostSheme = EnvironmentConfiguration.infoDictionary[ConfigurationKeys.HostSheme] as? String else {
            fatalError("Host Sheme Key not set")
        }
        return hostSheme
    }()
    
    static var hostURL: String = {
        guard let hostBaseURL = EnvironmentConfiguration.infoDictionary[ConfigurationKeys.HostBaseURL] as? String else {
            fatalError("Host Base URL Key not set")
        }
        return hostBaseURL
    }()
    
    static var port: Int? = {
        if let port = EnvironmentConfiguration.infoDictionary[ConfigurationKeys.HostPort] as? String {
            return Int(port)
        }
        return nil
    }()
    
    static var headers: [String: String] {
        [
            "accept": "application/json",
        ]
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Config file not found")
        }
        return dict
    }()
}

enum ConfigurationKeys {
    static let Environment = "APP_ENVIRONMENT"
    static let HostSheme = "HOST_SCHEME"
    static let HostBaseURL = "HOST_BASE_URL"
    static let HostPort = "HOST_PORT"
}
