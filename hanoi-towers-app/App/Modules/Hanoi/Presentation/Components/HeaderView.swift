//
//  HeaderView.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import SwiftUI

struct HeaderView<ViewModel>: View where ViewModel: HanoiViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    @FocusState private var disksTfFocused: Bool
    @FocusState private var velocityTFFocused: Bool
    
    let velocityFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.maximum = 5
        return formatter
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.blue.opacity(0.7))
                        .frame(height: 200)
                        .mask(
                            RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight])
                        )
                        .background(
                            BlurView(style: .systemMaterial)
                                .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                        )
                    
                    VStack {
                        
                        Text(AppConstants.Hanoi.Screens.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(AppConstants.Hanoi.Screens.disksLbl)
                            TextField(AppConstants.Hanoi.Screens.disksHelp, value: $viewModel.diskCount, formatter: NumberFormatter())
                                .focused($disksTfFocused)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Text(AppConstants.Hanoi.Screens.velocityLbl)
                                .padding(.leading)
                            TextField(AppConstants.Hanoi.Screens.velocityHelp, value: $viewModel.velocity, formatter: velocityFormatter)
                                .focused($velocityTFFocused)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .foregroundColor(.white)
                                    .padding()
                            } else {
                                Button(action: {
                                    disksTfFocused = false
                                    velocityTFFocused = false
                                    Task {
                                        await viewModel.fetchHanoiSolution()
                                    }
                                }, label: {
                                    
                                    Image(
                                        systemName: viewModel.isAnimating
                                        ? AppConstants.Hanoi.Icons.stop
                                        : AppConstants.Hanoi.Icons.play)
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                                .padding()
                            }
                            
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                }
            }
            .frame(width: geometry.size.width, height: max(geometry.safeAreaInsets.top + 150, 150))
            .edgesIgnoringSafeArea(.top)
            .onTapGesture {
                disksTfFocused = false
                velocityTFFocused = false
            }
        }
        .frame(height: 200)
        
    }
}

// Custom shape for rounded corners on specific sides
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// Blur effect wrapper
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    HeaderView(viewModel: HanoiPreviewHelper.getHanoiMockViewModel())
}
