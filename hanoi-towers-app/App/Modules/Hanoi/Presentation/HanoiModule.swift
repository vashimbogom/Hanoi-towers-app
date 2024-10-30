//
//  HanoiModule.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

final class HanoiModule {
    
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    //MARK: - Hanoi Solver -> Func dependency Approach
    func generateHanoiMainScreen() -> MainScreen<HanoiViewModel> {
        MainScreen(viewModel: self.generateHanoiViewModel())
    }
    
    private func generateHanoiViewModel() -> HanoiViewModel {
        HanoiViewModel(useCase: generateHanoiTowersUseCase())
    }
    
    private func generateHanoiTowersUseCase() -> SolveHanoiTowersUseCase {
        DefaultSolveHanoiTowersUseCase(repository: generateHanoiRepository())
    }
    
    private func generateHanoiRepository() -> HanoiRepository {
        DefaultHanoiRepository(service: generateHanoiService())
    }
    
    private func generateHanoiService() -> HanoiService {
        DefaultHanoiService(apiDataService: apiDataTransferService)
    }
}
