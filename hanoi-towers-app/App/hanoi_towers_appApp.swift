//
//  hanoi_towers_appApp.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 29/10/24.
//

import SwiftUI

@main
struct hanoi_towers_appApp: App {
    let diContainer = HanoiDIContainer()
    
    var body: some Scene {
        WindowGroup {
            diContainer.HanoiTowersScreen
        }
    }
}
