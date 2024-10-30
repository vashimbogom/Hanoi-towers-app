//
//  SolveHanoiTowersUseCase.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

protocol SolveHanoiTowersUseCase {
    func solveHanoiTowers(numberOfdisks: Int, algorithm: HanoiAlgorithm) async throws -> [SolutionStep]
}

class DefaultSolveHanoiTowersUseCase: SolveHanoiTowersUseCase {
    
    private let repository: HanoiRepository
    
    init(repository: HanoiRepository) {
        self.repository = repository
    }
    
    func solveHanoiTowers(numberOfdisks: Int, algorithm: HanoiAlgorithm) async throws -> [SolutionStep] {
        try await repository.fetchSolutionSteps(enpoint: HanoiEndpoint(disks: numberOfdisks, algorithm: algorithm)).map { .init(from: $0) }
    }
}
