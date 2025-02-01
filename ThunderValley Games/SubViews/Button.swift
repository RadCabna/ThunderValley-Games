//
//  Button.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct Button: View {
    var text = "TEXT"
    var size: CGFloat = 0.2
    var body: some View {
       Image("buttonFrame")
            .resizable()
//            .scaledToFit()
            .frame(width: screenHeight*size*3.72, height: screenHeight*size)
            .overlay(
            Text(text)
                .font(Font.custom("Helvetica-bold", size: screenHeight*0.5*size))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .shadow(color: .black, radius: 1)
            )
    }
}

#Preview {
    Button()
}
