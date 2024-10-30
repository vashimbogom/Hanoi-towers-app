//
//  HanoiDIContainer.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

class HanoiDIContainer {
    
    lazy private var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: EnvironmentConfiguration.hostURL, headers: EnvironmentConfiguration.headers)
        let sessionManager = DefaultServiceSessionManager(session: SharedURLSession.shared)
        let networkManager = DefaultServiceManager(config: config, sessionManager: sessionManager)
        return DefaultDataTransferService(networkManager: networkManager)
    }()
    
    lazy var HanoiTowersScreen: MainScreen = {
        let hanoiModule = HanoiModule(apiDataTransferService: apiDataTransferService)
        return hanoiModule.generateHanoiMainScreen()
    }()
}
