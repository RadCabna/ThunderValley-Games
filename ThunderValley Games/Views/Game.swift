//
//  Game.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 29.01.2025.
//

import SwiftUI

struct Game: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var translationX: CGFloat = 0
    @State private var translationY: CGFloat = 0
    @State private var rectanglesOnGameField = Arrays.rectanglesOnGameField
    @State private var linesOnGameField = Arrays.blueLinesOnGameField
    @State private var rectangleLineWidth: CGFloat = 0
    @State private var yourTurn = true
    @State private var yourThunderCount = 9
    @State private var enemyThunderCount = 9
    var body: some View {
        ZStack {
            Background()
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    Image("pauseButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: width*0.06)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(width*0.03)
                        .onTapGesture {
                            yourTurn.toggle()
                            yourThunderCount -= 1
                        }
                    HStack {
                        Image("playerFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.21)
                            .overlay(
                                VStack {
                                    HStack {
                                        Text("PLAYER 1")
                                            .font(Font.custom("Helvetica-bold", size: width*0.015))
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1)
                                            .shadow(color: .black, radius: 1)
                                        Spacer()
                                        Text(yourTurn ? "YOUR MOVE" : "WAITING")
                                            .font(Font.custom("Helvetica-bold", size: width*0.015))
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1)
                                            .shadow(color: .black, radius: 1)
                                    }
                                    .padding(.horizontal)
                                    Spacer()
                                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(width*0.025)), count: 5), spacing: 0) {
                                        ForEach(0..<yourThunderCount, id: \.self) { id in
                                                Image("blueThunder")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: width*0.028)
                                                
                                        }
                                    }
                                    Spacer()
                                }
                                    .padding(.vertical)
                            )
                        ZStack {
                            Image("gameField")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.42)
                                .offset(y: -height*0.01)
                            Image("playingFieldNoRectangles")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.28)
                            ZStack {
                                ForEach(0..<linesOnGameField.count, id: \.self) { row in
                                    ForEach(0..<linesOnGameField[row].count, id: \.self) { col in
                                        if linesOnGameField[row][col].lineActive {
                                            Image(linesOnGameField[row][col].itemName)
                                                .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                                                .offset(
                                                    x: linesOnGameField[row][col].positionX * screenWidth/932,
                                                    y: linesOnGameField[row][col].positionY * screenWidth/932
                                                )
                                        }
                                    }
                                }
                            }
                            
                            ZStack {
                                ForEach(0..<rectanglesOnGameField.count, id: \.self) { row in
                                    ForEach(0..<rectanglesOnGameField[row].count, id: \.self) { col in
                                        
                                        RoundedRectangle(cornerRadius: 1.0)
                                            .frame(width: width*0.025, height: width*0.025)
                                            .foregroundColor(.black)
                                            .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        RoundedRectangle(cornerRadius: 1.0)
                                            .stroke(lineWidth: 0)
                                            .frame(width: width*0.025, height: width*0.025)
                                            .foregroundColor(.white)
                                            .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        
                                        
                                    }
                                }
                            }
                        }
                        Image("playerFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.21)
                    }
                    
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    
                }
            }
            .ignoresSafeArea()
        }
        
        .onAppear {
            AppDelegate().setOrientation(to: .landscapeLeft)
            print("width: \(screenWidth)")
            print("height: \(screenHeight)")
        }
    }
}

#Preview {
    Game()
}
