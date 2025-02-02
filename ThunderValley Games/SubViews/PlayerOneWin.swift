//
//  PlayerOneWin.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct PlayerOneWin: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var playerOneWin: Bool
    var body: some View {
        ZStack {
            Image("playerOneWinFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.25)
            VStack {
                Button(text: "RETRY", size: screenWidth*0.13)
                    .onTapGesture {
                        playerOneWin.toggle()
                    }
                Button(text: "MENU", size: screenWidth*0.13)
                    .onTapGesture {
                        coordinator.navigate(to: .mainMenu)
                    }
            }
            .offset(y: screenHeight*0.055)
        }
    }
}

#Preview {
    PlayerOneWin(playerOneWin: .constant(true))
}
