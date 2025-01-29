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
    @State private var enemyLinesOnGameField = Arrays.redLinesOnGameField
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
                                ForEach(0..<enemyLinesOnGameField.count, id: \.self) { row in
                                    ForEach(0..<enemyLinesOnGameField[row].count, id: \.self) { col in
                                        if enemyLinesOnGameField[row][col].lineActive {
                                            Image(enemyLinesOnGameField[row][col].itemName)
                                                .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                                                .offset(
                                                    x: enemyLinesOnGameField[row][col].positionX * screenWidth/932,
                                                    y: enemyLinesOnGameField[row][col].positionY * screenWidth/932
                                                )
                                        }
                                    }
                                }
                            }
                            
                                ForEach(0..<rectanglesOnGameField.count, id: \.self) { row in
                                    ForEach(0..<rectanglesOnGameField[row].count, id: \.self) { col in
                                        ZStack {
                                        RoundedRectangle(cornerRadius: 1.0)
                                            .frame(width: width*0.025, height: width*0.025)
                                            .foregroundColor(.black)
                                            .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        RoundedRectangle(cornerRadius: 1.0)
                                            .stroke(lineWidth: 0)
                                            .frame(width: width*0.025, height: width*0.025)
                                            .foregroundColor(.white)
                                            .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        if rectanglesOnGameField[row][col].haveThunder {
                                            Image(rectanglesOnGameField[row][col].yourThunder ? "blueThunder" : "redThunder")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: width*0.02)
                                                .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        }
                                    }
                                        .onTapGesture {
                                            rectanglesOnGameField[row][col].haveThunder.toggle()
                                            rectanglesOnGameField[row][col].yourThunder = yourTurn
                                           checkLines()
                                            yourTurn.toggle()
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
    
    func checkLines() {
        checkLeftVerticalLine1()
        checkLeftVerticalLine2()
        checkLeftVerticalLine3()
        checkRightVerticalLine1()
        checkRightVerticalLine2()
        checkRightVerticalLine3()
        checkMiddleTopLine()
        checkMiddleBottomLine()
        checkTopHorizontalLine1()
        checkTopHorizontalLine2()
        checkTopHorizontalLine3()
        checkBottomHorizontalLine1()
        checkBottomHorizontalLine2()
        checkBottomHorizontalLine3()
        checkMiddleLeftLine()
        checkMiddleRightLine()
    }
    
    func checkLeftVerticalLine1() {
        if rectanglesOnGameField[0][0].haveThunder && 
            rectanglesOnGameField[3][0].haveThunder &&
            rectanglesOnGameField[7][0].haveThunder &&
            rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[3][0].yourThunder &&
            rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[7][0].yourThunder {
            if rectanglesOnGameField[0][0].yourThunder {
                linesOnGameField[0][0].lineActive = true
            } else {
                enemyLinesOnGameField[0][0].lineActive = true
            }
        } else {
            linesOnGameField[0][0].lineActive = false
            enemyLinesOnGameField[0][0].lineActive = false
        }
    }
    
    func checkLeftVerticalLine2() {
        if rectanglesOnGameField[1][0].haveThunder &&
            rectanglesOnGameField[3][1].haveThunder &&
            rectanglesOnGameField[6][0].haveThunder &&
            rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[3][1].yourThunder &&
            rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[6][0].yourThunder {
            if rectanglesOnGameField[1][0].yourThunder {
                linesOnGameField[0][1].lineActive = true
            } else {
                enemyLinesOnGameField[0][1].lineActive = true
            }
        } else {
            linesOnGameField[0][1].lineActive = false
            enemyLinesOnGameField[0][1].lineActive = false
        }
    }
    
    func checkLeftVerticalLine3() {
        if rectanglesOnGameField[2][0].haveThunder &&
            rectanglesOnGameField[3][2].haveThunder &&
            rectanglesOnGameField[5][0].haveThunder &&
            rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[3][2].yourThunder &&
            rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[5][0].yourThunder {
            if rectanglesOnGameField[2][0].yourThunder {
                linesOnGameField[0][2].lineActive = true
            } else {
                enemyLinesOnGameField[0][2].lineActive = true
            }
        } else {
            linesOnGameField[0][2].lineActive = false
            enemyLinesOnGameField[0][2].lineActive = false
        }
    }
    
    func checkRightVerticalLine1() {
        if rectanglesOnGameField[2][2].haveThunder &&
            rectanglesOnGameField[4][0].haveThunder &&
            rectanglesOnGameField[5][2].haveThunder &&
            rectanglesOnGameField[2][2].yourThunder == rectanglesOnGameField[4][0].yourThunder &&
            rectanglesOnGameField[2][2].yourThunder == rectanglesOnGameField[5][2].yourThunder {
            if rectanglesOnGameField[2][2].yourThunder {
                linesOnGameField[1][2].lineActive = true
            } else {
                enemyLinesOnGameField[1][2].lineActive = true
            }
        } else {
            linesOnGameField[1][2].lineActive = false
            enemyLinesOnGameField[1][2].lineActive = false
        }
    }
    
    func checkRightVerticalLine2() {
        if rectanglesOnGameField[1][2].haveThunder &&
            rectanglesOnGameField[4][1].haveThunder &&
            rectanglesOnGameField[6][2].haveThunder &&
            rectanglesOnGameField[1][2].yourThunder == rectanglesOnGameField[4][1].yourThunder &&
            rectanglesOnGameField[1][2].yourThunder == rectanglesOnGameField[6][2].yourThunder {
            if rectanglesOnGameField[1][2].yourThunder {
                linesOnGameField[1][1].lineActive = true
            } else {
                enemyLinesOnGameField[1][1].lineActive = true
            }
        } else {
            linesOnGameField[1][1].lineActive = false
            enemyLinesOnGameField[1][1].lineActive = false
        }
    }
    
    func checkRightVerticalLine3() {
        if rectanglesOnGameField[0][2].haveThunder &&
            rectanglesOnGameField[4][2].haveThunder &&
            rectanglesOnGameField[7][2].haveThunder &&
            rectanglesOnGameField[0][2].yourThunder == rectanglesOnGameField[4][2].yourThunder &&
            rectanglesOnGameField[0][2].yourThunder == rectanglesOnGameField[7][2].yourThunder {
            if rectanglesOnGameField[0][2].yourThunder {
                linesOnGameField[1][0].lineActive = true
            } else {
                enemyLinesOnGameField[1][0].lineActive = true
            }
        } else {
            linesOnGameField[1][0].lineActive = false
            enemyLinesOnGameField[1][0].lineActive = false
        }
    }
    
    func checkMiddleTopLine() {
        if rectanglesOnGameField[0][1].haveThunder &&
            rectanglesOnGameField[1][1].haveThunder &&
            rectanglesOnGameField[2][1].haveThunder &&
            rectanglesOnGameField[0][1].yourThunder == rectanglesOnGameField[1][1].yourThunder &&
            rectanglesOnGameField[0][1].yourThunder == rectanglesOnGameField[2][1].yourThunder {
            if rectanglesOnGameField[0][1].yourThunder {
                linesOnGameField[2][0].lineActive = true
            } else {
                enemyLinesOnGameField[2][0].lineActive = true
            }
        } else {
            linesOnGameField[2][0].lineActive = false
            enemyLinesOnGameField[2][0].lineActive = false
        }
    }
    
    func checkMiddleBottomLine() {
        if rectanglesOnGameField[5][1].haveThunder &&
            rectanglesOnGameField[6][1].haveThunder &&
            rectanglesOnGameField[7][1].haveThunder &&
            rectanglesOnGameField[5][1].yourThunder == rectanglesOnGameField[6][1].yourThunder &&
            rectanglesOnGameField[5][1].yourThunder == rectanglesOnGameField[7][1].yourThunder {
            if rectanglesOnGameField[5][1].yourThunder {
                linesOnGameField[2][1].lineActive = true
            } else {
                enemyLinesOnGameField[2][1].lineActive = true
            }
        } else {
            linesOnGameField[2][1].lineActive = false
            enemyLinesOnGameField[2][1].lineActive = false
        }
    }
    
    func checkTopHorizontalLine1() {
        if rectanglesOnGameField[0][0].haveThunder &&
            rectanglesOnGameField[0][1].haveThunder &&
            rectanglesOnGameField[0][2].haveThunder &&
            rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[0][1].yourThunder &&
            rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[0][2].yourThunder {
            if rectanglesOnGameField[0][0].yourThunder {
                linesOnGameField[3][0].lineActive = true
            } else {
                enemyLinesOnGameField[3][0].lineActive = true
            }
        } else {
            linesOnGameField[3][0].lineActive = false
            enemyLinesOnGameField[3][0].lineActive = false
        }
    }
    
    func checkTopHorizontalLine2() {
        if rectanglesOnGameField[1][0].haveThunder &&
            rectanglesOnGameField[1][1].haveThunder &&
            rectanglesOnGameField[1][2].haveThunder &&
            rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[1][1].yourThunder &&
            rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[1][2].yourThunder {
            if rectanglesOnGameField[1][0].yourThunder {
                linesOnGameField[3][1].lineActive = true
            } else {
                enemyLinesOnGameField[3][1].lineActive = true
            }
        } else {
            linesOnGameField[3][1].lineActive = false
            enemyLinesOnGameField[3][1].lineActive = false
        }
    }
    
    func checkTopHorizontalLine3() {
        if rectanglesOnGameField[2][0].haveThunder &&
            rectanglesOnGameField[2][1].haveThunder &&
            rectanglesOnGameField[2][2].haveThunder &&
            rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[2][1].yourThunder &&
            rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[2][2].yourThunder {
            if rectanglesOnGameField[2][0].yourThunder {
                linesOnGameField[3][2].lineActive = true
            } else {
                enemyLinesOnGameField[3][2].lineActive = true
            }
        } else {
            linesOnGameField[3][2].lineActive = false
            enemyLinesOnGameField[3][2].lineActive = false
        }
    }
    
    func checkBottomHorizontalLine1() {
        if rectanglesOnGameField[5][0].haveThunder &&
            rectanglesOnGameField[5][1].haveThunder &&
            rectanglesOnGameField[5][2].haveThunder &&
            rectanglesOnGameField[5][0].yourThunder == rectanglesOnGameField[5][1].yourThunder &&
            rectanglesOnGameField[5][0].yourThunder == rectanglesOnGameField[5][2].yourThunder {
            if rectanglesOnGameField[5][0].yourThunder {
                linesOnGameField[4][2].lineActive = true
            } else {
                enemyLinesOnGameField[4][2].lineActive = true
            }
        } else {
            linesOnGameField[4][2].lineActive = false
            enemyLinesOnGameField[4][2].lineActive = false
        }
    }
    
    func checkBottomHorizontalLine2() {
        if rectanglesOnGameField[6][0].haveThunder &&
            rectanglesOnGameField[6][1].haveThunder &&
            rectanglesOnGameField[6][2].haveThunder &&
            rectanglesOnGameField[6][0].yourThunder == rectanglesOnGameField[6][1].yourThunder &&
            rectanglesOnGameField[6][0].yourThunder == rectanglesOnGameField[6][2].yourThunder {
            if rectanglesOnGameField[6][0].yourThunder {
                linesOnGameField[4][1].lineActive = true
            } else {
                enemyLinesOnGameField[4][1].lineActive = true
            }
        } else {
            linesOnGameField[4][1].lineActive = false
            enemyLinesOnGameField[4][1].lineActive = false
        }
    }
    
    func checkBottomHorizontalLine3() {
        if rectanglesOnGameField[7][0].haveThunder &&
            rectanglesOnGameField[7][1].haveThunder &&
            rectanglesOnGameField[7][2].haveThunder &&
            rectanglesOnGameField[7][0].yourThunder == rectanglesOnGameField[7][1].yourThunder &&
            rectanglesOnGameField[7][0].yourThunder == rectanglesOnGameField[7][2].yourThunder {
            if rectanglesOnGameField[7][0].yourThunder {
                linesOnGameField[4][0].lineActive = true
            } else {
                enemyLinesOnGameField[4][0].lineActive = true
            }
        } else {
            linesOnGameField[4][0].lineActive = false
            enemyLinesOnGameField[4][0].lineActive = false
        }
    }
    
    func checkMiddleLeftLine() {
        if rectanglesOnGameField[3][0].haveThunder &&
            rectanglesOnGameField[3][1].haveThunder &&
            rectanglesOnGameField[3][2].haveThunder &&
            rectanglesOnGameField[3][0].yourThunder == rectanglesOnGameField[3][1].yourThunder &&
            rectanglesOnGameField[3][0].yourThunder == rectanglesOnGameField[3][2].yourThunder {
            if rectanglesOnGameField[3][0].yourThunder {
                linesOnGameField[5][0].lineActive = true
            } else {
                enemyLinesOnGameField[5][0].lineActive = true
            }
        } else {
            linesOnGameField[5][0].lineActive = false
            enemyLinesOnGameField[5][0].lineActive = false
        }
    }
    
    func checkMiddleRightLine() {
        if rectanglesOnGameField[4][0].haveThunder &&
            rectanglesOnGameField[4][1].haveThunder &&
            rectanglesOnGameField[4][2].haveThunder &&
            rectanglesOnGameField[4][0].yourThunder == rectanglesOnGameField[4][1].yourThunder &&
            rectanglesOnGameField[4][0].yourThunder == rectanglesOnGameField[4][2].yourThunder {
            if rectanglesOnGameField[4][0].yourThunder {
                linesOnGameField[5][1].lineActive = true
            } else {
                enemyLinesOnGameField[5][1].lineActive = true
            }
        } else {
            linesOnGameField[5][1].lineActive = false
            enemyLinesOnGameField[5][1].lineActive = false
        }
    }
}

#Preview {
    Game()
}
