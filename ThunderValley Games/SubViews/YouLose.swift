//
//  YouLose.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct YouLose: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var youLose: Bool
    var body: some View {
        ZStack {
            Image("playerTwoWinFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.25)
            VStack {
                Button(text: "RETRY", size: screenWidth*0.13)
                    .onTapGesture {
                        youLose.toggle()
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
    YouLose(youLose: .constant(true))
}
