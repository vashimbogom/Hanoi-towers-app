//
//  SolutionStepDTO.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

struct SolutionStepDTO: Decodable {
    let disk: Int
    let sourceRod: String
    let destinationRod: String
}
