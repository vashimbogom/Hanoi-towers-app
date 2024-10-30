//
//  ContentView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 29/10/24.
//

import SwiftUI

struct MainScreen<ViewModel>: View where ViewModel: HanoiViewModelProtocol {
    
    @StateObject var viewModel: HanoiViewModel
    
    var body: some View {
        
        ZStack {
            
            BGHanoiImage()
            
            ScrollView {
                VStack {
                    
                    HeaderView(viewModel: viewModel)
                    
                    if let error = viewModel.errorMsg {
                        
                        ErrorView(errorMessage: error)
                        
                    }
                    else
                    {
                        
                        RodsView(viewModel: viewModel)
                            .frame(height: 400)
                        
                        if let step = viewModel.steps.first {
                            Text(step.toString())
                                .foregroundStyle(.blue)
                                .padding(.top)
                        }
                    
                        StepHistory(stepHistory: $viewModel.stepHistory)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HanoiDIContainer().HanoiTowersScreen
}
