//
//  ContentView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "chart.bar.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Tower of Hanoi Puzzle")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
