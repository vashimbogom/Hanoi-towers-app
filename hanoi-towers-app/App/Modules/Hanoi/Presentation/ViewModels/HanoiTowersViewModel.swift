//
//  HanoiTowersViewModel.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

protocol HanoiViewModelProtocol: ObservableObject {

    var isPlaying: Bool { get set }
    var isLoading: Bool { get set }
    var isAnimating: Bool { get set }
    var errorMsg: String? { get set }
    var steps: [SolutionStep] { get set }
    var stepHistory:[SolutionStep] { get set }
    var rods: [String: [Int]] { get set }
    var diskCount: Int { get set }
    var velocity: Double { get set }
    
    func fetchHanoiSolution() async
}

class HanoiViewModel: HanoiViewModelProtocol {
    
    @Published var isPlaying: Bool = false
    @Published var isLoading: Bool = false
    @Published var isAnimating: Bool = false
    @Published var errorMsg: String? = nil
    @Published var steps: [SolutionStep] = []
    @Published var stepHistory:[SolutionStep] = []
    @Published var rods: [String: [Int]] = [
        AppConstants.Hanoi.Rods.source: [],
        AppConstants.Hanoi.Rods.auxiliary: [],
        AppConstants.Hanoi.Rods.destination: []
    ]
    @Published var velocity: Double = 2.0
    @Published var diskCount: Int = 3 {
        didSet {
            reset()
        }
    }
    
    private let hanoiTowerUseCase: SolveHanoiTowersUseCase!
    
    init(useCase: SolveHanoiTowersUseCase) {
        self.hanoiTowerUseCase = useCase
    }
    
    func fetchHanoiSolution() async {
        
        if isPlaying {
            stopSolution()
        } else {
            await self.startSolution()
        }
    }
    
    @MainActor
    private func startSolution() async {
        reset()
        (isPlaying, isLoading) = ( true, true )
        
        do {
            let responseSteps = try await hanoiTowerUseCase.solveHanoiTowers(numberOfdisks: diskCount, algorithm: .iterative)
            isLoading = false
            errorMsg = nil
            steps = responseSteps
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.performAnimation()
            }
        } catch {
            (self.isPlaying, self.isLoading, self.isAnimating) = ( false, false, false )
            if let error = error as? ServiceError {
                self.errorMsg = error.description
            } else {
                self.errorMsg = error.localizedDescription
            }
            
        }
    }
    
    private func stopSolution() {
        isPlaying = false
        reset()
    }
    
    private func performAnimation() {
        // Recursive animation function to process each step
        guard isAnimating, let step = steps.first else {
            self.isAnimating = false
            self.isPlaying = false
            return
        }
        stepHistory.append(step)
        
        // Remove source disk from current rod
        rods[step.sourceRod]?.removeAll(where: { $0 == step.disk })
        // Add disk to destination Rod
        rods[step.destinationRod]?.append(step.disk)
        
        // Animate the disk movement
        withAnimation(.spring) {
            DispatchQueue.main.asyncAfter(deadline: .now() + velocity) {
                if !self.steps.isEmpty {
                    self.steps.removeFirst()
                }
                self.performAnimation()
            }
        }
        
    }
    
    private func reset() {
        isLoading = false
        isAnimating = false
        errorMsg = nil
        
        rods[AppConstants.Hanoi.Rods.source] = Array(1...diskCount)
        rods[AppConstants.Hanoi.Rods.auxiliary] = []
        rods[AppConstants.Hanoi.Rods.destination] = []
        
        steps.removeAll()
        stepHistory.removeAll()
    }
}
