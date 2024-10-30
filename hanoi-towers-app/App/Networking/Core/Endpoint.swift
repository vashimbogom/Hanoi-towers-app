//
//  Endpoint.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    
    var headers: [String: String]? { get }
}
