//
//  YouWin.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct YouWin: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("sound") var sound = true
    @AppStorage("vibration") var vibration = true
    @Binding var youWin: Bool
    var body: some View {
        ZStack {
            Image("winFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.29)
            VStack {
                Image("coinCountFrame")
                      .resizable()
                      .scaledToFit()
                      .frame(height: screenWidth*0.05)
                      .overlay(
                      Text("+10")
                        .font(Font.custom("Helvetica-bold", size: screenWidth*0.035))
                          .foregroundColor(.white)
                          .shadow(color: .black, radius: 1)
                          .shadow(color: .black, radius: 1)
                          .offset(x: screenWidth*0.022)
                      )
                Spacer()
                    .frame(height: screenWidth*0.02)
                Button(text: "RETRY", size: screenWidth*0.13)
                    .onTapGesture {
                        coinCount += 10
                        youWin.toggle()
                    }
                Button(text: "MENU", size: screenWidth*0.13)
                    .onTapGesture {
                        coinCount += 10
                        coordinator.navigate(to: .mainMenu)
                    }
            }
            .offset(y: screenWidth*0.025)
        }
        
        .onAppear {
            if sound {
                SoundManager.instance.playSound(sound: "failSound")
                if vibration {
                    generateImpactFeedback(style: .heavy)
                }
            }
        }
    }
    func generateImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        if vibration {
            generator.prepare()
            generator.impactOccurred()
        }
    }
}

#Preview {
    YouWin(youWin: .constant(true))
}
