//
//  CoinCountFrame.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct CoinCountFrame: View {
    @AppStorage("coinCount") var coinCount = 0
    var body: some View {
      Image("coinCountFrame")
            .resizable()
            .scaledToFit()
            .frame(height: screenHeight*0.1)
            .overlay(
            Text("\(coinCount)")
                .font(Font.custom("Helvetica-bold", size: screenHeight*0.07))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .shadow(color: .black, radius: 1)
                .offset(x: screenHeight*0.045)
            )
    }
}

#Preview {
    CoinCountFrame()
}
