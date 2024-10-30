//
//  SharedURLSession.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

final class SharedURLSession {
    
    static var shared: URLSession {
        let configuration = URLSessionConfiguration.default
        let delegate = SharedURLSessionDelegate()
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }
}
