//
//  RodsView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct RodsView<ViewModel>: View where ViewModel: HanoiViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var diskSizeRange: [CGFloat] { (1...viewModel.diskCount).map { CGFloat($0) * CGFloat(110 / viewModel.diskCount) } }
    
    
    var body: some View {
        HStack {
            ForEach(Array(viewModel.rods.keys).sorted(), id: \.self) { rodName in
                VStack {
                    
                    Spacer()
                    
                    if let rod = viewModel.rods[rodName] {
                        ForEach(rod.sorted(), id: \.self) { disk in
                            diskView(diskNumber: disk, diskSize: diskSizeRange[disk - 1])
                        }
                    }

                    Text(rodName)
                        .bold()
                    
                }
                .frame(width: 120, height: 410)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    RodsView(viewModel: HanoiPreviewHelper.getHanoiMockViewModel())
}
