//
//  Settings.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 02.02.2025.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("music") var music = true
    @AppStorage("sound") var sound = true
    @AppStorage("vibration") var vibration = true
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
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.34)
                .overlay(
                    VStack(spacing:screenHeight*0.01) {
                        Text("MUSIC")
                            .font(Font.custom("Helvetica-bold", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Toggle("", isOn: $music)
                            .toggleStyle(CustomToggle())
                        Text("VIBRATION")
                            .font(Font.custom("Helvetica-bold", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Toggle("", isOn: $vibration)
                            .toggleStyle(CustomToggle())
                        Text("SOUNDS")
                            .font(Font.custom("Helvetica-bold", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Toggle("", isOn: $sound)
                            .toggleStyle(CustomToggle())
                        Button(text: "RATE US", size: screenWidth*0.12)
                            .onTapGesture {
                                openAppStoreForRating()
                            }
                            .padding(.top,screenWidth*0.01)
                    }
                        .offset(y: screenWidth*0.03)
                )
        }
        
        .onChange(of: music) { _ in
            if !music {
                SoundManager.instance.stopAllSounds()
            } else {
                SoundManager.instance.playSound(sound: "mainThemeSound")
            }
        }
        
    }
    
    func openAppStoreForRating() {
        guard let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id6741468545?action=write-review") else {
            return
        }
        if UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL)
        }
    }
    
}

#Preview {
    Settings()
}

import SwiftUI

struct CustomToggle: ToggleStyle {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: screenHeight * 0.015)
                    .fill(Color.toggleback)
                    .frame(width: screenWidth * 0.14, height: screenWidth * 0.033)
                    .overlay(
                        RoundedRectangle(cornerRadius: screenHeight * 0.015)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.white)
                    )
                RoundedRectangle(cornerRadius: screenHeight * 0.015)
                    .fill(configuration.isOn ? Color.toggleon : Color.toggleoff)
                    .frame(width: screenWidth * 0.07, height: screenWidth * 0.03)
                    .shadow(radius: 1, y: 0)
                    .offset(x: configuration.isOn ? screenWidth * 0.034 : -screenWidth * 0.034)
                    .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                    .overlay(
                        RoundedRectangle(cornerRadius: screenHeight * 0.015)
                            .stroke(lineWidth: 1)
                            .frame(width: screenWidth * 0.07, height: screenWidth * 0.032)
                            .foregroundColor(.white)
                            .offset(x: configuration.isOn ? screenWidth * 0.034 : -screenWidth * 0.034)
                            .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                    )
                Text(configuration.isOn ? "ON" : "OFF")
                    .font(.custom("Helvetica-bold", size: screenWidth * 0.015))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1)
                    .offset(x: configuration.isOn ? screenWidth * 0.033 : -screenWidth * 0.033)
                    .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
            }
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
