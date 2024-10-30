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
            static let title = "Towers of Hanoi"
            static let disksLbl = "disks:"
            static let disksHelp = "Disks #"
            static let velocityLbl = "vel:"
            static let velocityHelp = "in seconds"
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
