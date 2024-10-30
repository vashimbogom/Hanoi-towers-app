//
//  HanoiRepositoryProtocol.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

protocol HanoiRepository {
    func fetchSolutionSteps(enpoint: HanoiEndpoint) async throws -> [SolutionStepDTO]
}
