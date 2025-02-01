//
//  Pause.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 02.02.2025.
//

import SwiftUI

struct Pause: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var pauseTapped: Bool
    var body: some View {
        ZStack {
            Image("playerTwoWinFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenHeight*0.5)
            VStack {
                Button(text: "RESUME", size: 0.13)
                    .onTapGesture {
                        pauseTapped.toggle()
                    }
                Button(text: "MENU", size: 0.13)
                    .onTapGesture {
                        coordinator.navigate(to: .mainMenu)
                    }
            }
            .offset(y: screenHeight*0.055)
        }
    }
}

#Preview {
    Pause(pauseTapped: .constant(true))
}
