//
//  DiskView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct diskView: View {
    let diskNumber: Int
    let diskSize: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: diskSize, height: 22)
                .foregroundColor(.blue)
            Text("\(diskNumber)")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    diskView(diskNumber: 13, diskSize: 100)
}
