//
//  SolutionStep.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct SolutionStep: Decodable, Identifiable {
    let id: UUID
    let disk: Int
    let sourceRod: String
    let destinationRod: String
    
    init(disk: Int, sourceRod: String, destinationRod: String) {
        self.id = UUID()
        self.disk = disk
        self.sourceRod = sourceRod
        self.destinationRod = destinationRod
    }
    
    init(from stepDTO: SolutionStepDTO) {
        self.id = UUID()
        self.disk = stepDTO.disk
        self.sourceRod = stepDTO.sourceRod
        self.destinationRod = stepDTO.destinationRod
    }
    
    func toString() -> String {
        "Take disk \(disk) from rod \(sourceRod) to rod \(destinationRod)"
    }
}
