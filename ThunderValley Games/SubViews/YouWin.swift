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
    @Binding var youWin: Bool
    var body: some View {
        ZStack {
            Image("winFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenHeight*0.6)
            VStack {
                Image("coinCountFrame")
                      .resizable()
                      .scaledToFit()
                      .frame(height: screenHeight*0.1)
                      .overlay(
                      Text("+10")
                          .font(Font.custom("Helvetica-bold", size: screenHeight*0.07))
                          .foregroundColor(.white)
                          .shadow(color: .black, radius: 1)
                          .shadow(color: .black, radius: 1)
                          .offset(x: screenHeight*0.045)
                      )
                Spacer()
                    .frame(height: screenHeight*0.04)
                Button(text: "RETRY", size: 0.13)
                    .onTapGesture {
                        coinCount += 10
                        youWin.toggle()
                    }
                Button(text: "MENU", size: 0.13)
                    .onTapGesture {
                        coinCount += 10
                        coordinator.navigate(to: .mainMenu)
                    }
            }
            .offset(y: screenHeight*0.055)
        }
    }
}

#Preview {
    YouWin(youWin: .constant(true))
}
