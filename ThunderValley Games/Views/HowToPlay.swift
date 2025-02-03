//
//  HowToPlay.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 02.02.2025.
//

import SwiftUI

struct HowToPlay: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @State private var guideArray = Arrays.guidePlateArray
    @State private var guideNumber = 0
    var body: some View {
        ZStack {
            Background()
            HStack {
                Image("backButton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .onTapGesture {
                        coordinator.navigate(to: .mainMenu)
                    }
                Spacer()
                Image("coinCountFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .overlay(
                        Text("\(coinCount)")
                            .font(Font.custom("Helvetica-bold", size: screenWidth*0.035))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                            .offset(x: screenWidth*0.022)
                    )
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            HStack {
                Image("backButton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .opacity(guideNumber == 0 ? 0 : 1)
                    .onTapGesture {
                        changeGuideAnimation(direction: -1)
                    }
                    .disabled(guideNumber == 0)
                Spacer()
                    .frame(width: screenWidth*0.5)
                Image("backButton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .scaleEffect(-1)
                    .opacity(guideNumber == 5 ? 0 : 1)
                    .onTapGesture {
                        changeGuideAnimation(direction: 1)
                    }
                    .disabled(guideNumber == 5)
            }
            Image(guideArray[guideNumber])
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.35)
        }
    }
    
    func changeGuideAnimation(direction: Int) {
        withAnimation(Animation.easeOut(duration: 0.2)) {
            guideNumber += direction
            print(guideNumber)
        }
    }
    
}

#Preview {
    HowToPlay()
}
