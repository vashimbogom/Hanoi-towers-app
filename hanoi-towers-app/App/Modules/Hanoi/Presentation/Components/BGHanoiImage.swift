//
//  BGHanoiImage.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct BGHanoiImage: View {
    var body: some View {
        
        Image(AppConstants.Hanoi.Images.background)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 8)
    }
}
