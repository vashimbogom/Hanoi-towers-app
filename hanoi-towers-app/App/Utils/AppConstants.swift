//
//  AppConstants.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

struct AppConstants {
    
    enum Hanoi {
        
        enum Rods {
            static let source = "A"
            static let auxiliary = "B"
            static let destination = "C"
        }
        
        enum Screens {
            static let title = String(localized: "Towers of Hanoi")
            static let disksLbl = String(localized: "disks:")
            static let disksHelp = String(localized: "Disks #")
            static let velocityLbl = String(localized: "vel:")
            static let velocityHelp = String(localized: "in seconds")
            static let stepDescTake = String(localized: "Take disk")
            static let stepDescFrom = String(localized: "from rod")
            static let stepDescTo = String(localized: "to rod")
            
        }
        
        enum Images {
            static let error = "hanoi_error"
            static let background = "hanoi"
        }
        
        enum Icons {
            static let play = "play.fill"
            static let stop = "stop.fill"
        }
        
        enum Mocks {
            static let solutionSteps: String = "SolutionStepsMock.json"
        }
    }
    
}
