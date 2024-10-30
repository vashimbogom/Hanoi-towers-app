//
//  ErrorView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(AppConstants.Hanoi.Images.error)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(radius: 2)
            
            VStack {
                Text(errorMessage)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.red)
            }
            .background()
            
        }
        .frame(
            maxWidth: 280
        )
    }
}

#Preview {
    ErrorView(errorMessage: "Some error happened")
}
