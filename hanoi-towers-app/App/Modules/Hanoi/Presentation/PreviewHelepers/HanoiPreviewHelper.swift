//
//  HanoiPreviewHelper.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

struct HanoiPreviewHelper {
    
    static func getHanoiMockViewModel() -> HanoiViewModelMock {
        return HanoiViewModelMock()
    }
    
    static var hanoiSteps: [SolutionStep] {
        return [
            SolutionStep(
                disk: 1,
                sourceRod: AppConstants.Hanoi.Rods.source,
                destinationRod: AppConstants.Hanoi.Rods.destination
            ),
            SolutionStep(
                disk: 2,
                sourceRod: AppConstants.Hanoi.Rods.source,
                destinationRod: AppConstants.Hanoi.Rods.auxiliary
            )]
    }
    
    class HanoiViewModelMock: HanoiViewModelProtocol {
        var isPlaying: Bool = false
        var isLoading: Bool = false
        var isAnimating: Bool = false
        
        var errorMsg: String? = nil
        
        var steps: [SolutionStep] = []
        var stepHistory: [SolutionStep] = []
        
        var rods: [String : [Int]] = [
            AppConstants.Hanoi.Rods.source: [],
            AppConstants.Hanoi.Rods.auxiliary: [],
            AppConstants.Hanoi.Rods.destination: []
        ]
        
        var diskCount: Int = 3
        var velocity: Double = 1.0
        
        func fetchHanoiSolution() {
            
        }
    }
}
