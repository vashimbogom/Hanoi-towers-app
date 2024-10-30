//
//  HanoiEndpoint.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

enum HanoiEndpoint {
    case solveRecursive(disks: Int)
    case solveIterative(disks: Int)
    case solveSequence(disks: Int)
}

extension HanoiEndpoint: Endpoint {
    
    init(disks: Int, algorithm: HanoiAlgorithm) {
        switch algorithm {
        case .recursive:
            self = .solveRecursive(disks: disks)
        case .iterative:
            self = .solveIterative(disks: disks)
        case .sequential:
            self = .solveSequence(disks: disks)
        }
    }
    
    var path: String {
        if EnvironmentConfiguration.appEnvironment != .Mock {
            switch self {
            case .solveRecursive(let disks):
                return "/solve/rec/\(disks)"
            case .solveIterative(let disks):
                return "/solve/iter/\(disks)"
            case .solveSequence(let disks):
                return "/solve/seq/\(disks)"

            }
        }
        else {
            return AppConstants.Hanoi.Mocks.solutionSteps
        }
    }

    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        [
            "accept": "application/json",
        ]
    }
}
