//
//  Menu.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 01.02.2025.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    var body: some View {
        ZStack {
            Background()
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    ZStack {
                        Image("coinCountFrame")
                              .resizable()
                              .scaledToFit()
                              .frame(height: width*0.05)
                              .overlay(
                              Text("\(coinCount)")
                                  .font(Font.custom("Helvetica-bold", size: width*0.035))
                                  .foregroundColor(.white)
                                  .shadow(color: .black, radius: 1)
                                  .shadow(color: .black, radius: 1)
                                  .offset(x: width*0.022)
                              )
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                        VStack {
                            Image("icon")
                                .resizable()
                                .scaledToFit()
                                .frame(height: width*0.12)
                            HStack {
                                Button(text: "2 PLAYERS", size: width*0.18)
                                    .onTapGesture {
                                        coordinator.navigate(to: .game)
                                    }
                                Button(text: "WITH AI", size: width*0.18)
                            }
                            HStack {
                                Button(text: "INVENTORY", size: width*0.18)
                                    .onTapGesture {
                                        coordinator.navigate(to: .inventory)
                                    }
                                Button(text: "RULES", size: width*0.18)
                                    .onTapGesture {
                                        coordinator.navigate(to: .howToPlay)
                                    }
                            }
                            Button(text: "SETTINGS", size: width*0.18)
                        }
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                   
                }
            }
        }
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                AppDelegate().setOrientation(to: .landscapeLeft)
//            }
        }
    }
}

#Preview {
    Menu()
}
