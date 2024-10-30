//
//  HanoiService.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

protocol HanoiService {
    func fetchSolution(endpoint: Endpoint) async throws -> [SolutionStepDTO]
}

final class DefaultHanoiService: HanoiService {
    
    private let apiDataService: DataTransferService
    
    init(apiDataService: DataTransferService) {
        self.apiDataService = apiDataService
    }
    
    func fetchSolution(endpoint: Endpoint) async throws -> [SolutionStepDTO] {
        try await apiDataService.request(for: endpoint)
    }
}
