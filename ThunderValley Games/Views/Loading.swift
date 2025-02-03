//
//  Loading.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 29.01.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("completeLevel") var completeLevel = false
    @State private var loadingArray = Arrays.loadingArray
    @State private var loadingImage = "loadingThunder1"
    @State private var timer: Timer? = nil
    @State private var generalOpacity: CGFloat = 0
    var body: some View {
        ZStack {
            Background()
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    VStack {
                        Image(loadingImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: height*0.3)
                            .opacity(generalOpacity)
                        Text("LOADING")
                            .font(Font.custom("Helvetica-bold", size: height*0.13))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                    }
                    
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    VStack {
                        Image(loadingImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: width*0.3)
                            .opacity(generalOpacity)
                        Text("LOADING")
                            .font(Font.custom("Helvetica-bold", size: width*0.13))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                    }
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        
        .onChange(of: completeLevel) { _ in
            if completeLevel {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    coordinator.navigate(to: .mainMenu)
                }
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                AppDelegate().setOrientation(to: .landscapeLeft)
            }
            opacityAnimation()
            startTimer()
        }
        
    }
    
    func opacityAnimation() {
        withAnimation(Animation.easeInOut(duration: 1)) {
            generalOpacity = 1
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.7), repeats: true) { _ in
            for i in 0..<loadingArray.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.12*TimeInterval(i)) {
                    
                    loadingImage = loadingArray[i]
                    
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
}

#Preview {
    Loading()
}
