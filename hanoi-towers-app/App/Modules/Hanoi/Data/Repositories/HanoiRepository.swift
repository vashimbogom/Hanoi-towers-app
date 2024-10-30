//
//  HanoiRepository.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

final class DefaultHanoiRepository: HanoiRepository {
    
    private let service: HanoiService
    
    init(service: HanoiService) {
        self.service = service
    }
    
    func fetchSolutionSteps(enpoint: HanoiEndpoint) async throws -> [SolutionStepDTO] {
        try await service.fetchSolution(endpoint: enpoint)
    }
}
