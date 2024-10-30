//
//  StepHistory.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct StepHistory: View {
    @Binding var stepHistory: [SolutionStep]
    
    var body: some View {
        VStack {
            ForEach(stepHistory) { step in
                Text(step.toString())
                    .padding(.top, 7)
                    .padding(.bottom, 7)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.15))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
                .padding()
        )
    }
}

#Preview {
    StepHistory(stepHistory: .constant(HanoiPreviewHelper.hanoiSteps))
}
