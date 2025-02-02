//
//  Button.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct Button: View {
    var text = "TEXT"
    var size: CGFloat = 150
    var body: some View {
       Image("buttonFrame")
            .resizable()
//            .scaledToFit()
            .frame(width: size*1.8, height: size*0.5)
            .overlay(
            Text(text)
                .font(Font.custom("Helvetica-bold", size: 0.2*size))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .shadow(color: .black, radius: 1)
            )
    }
}

#Preview {
    Button()
}
