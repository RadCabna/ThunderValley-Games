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
    @State private var rectangleStroWidth: CGFloat = 0
    @State private var yourTurn = true
    @State private var selectedRectangleRow: Int = 0
    @State private var selectedRectangleCol: Int = 0
    @State private var yourStageNumber = 1
    @State private var enemyStageNumber = 1
    @State private var yourThunderCountOnGameField = 0
    @State private var enemyThunderCountOnGameField = 0
    @State private var yourThunder = "blueThunder"
    @State private var enemyThunder = "redThunder"
    @State private var youCollectNewLine = false
    @State private var yourLineCoordinatesArray: [(Int, Int)] = [] {
        didSet {
            if yourLineCoordinatesArray.count > oldValue.count {
                youCollectNewLine = true
            }
            //            else if yourLineCoordinatesArray.count < oldValue.count {
            //                youCollectNewLine = false
            //            }
        }
    }
    @State private var enemyCollectNewLine = false
    @State private var enemyLineCoordinatesArray: [(Int, Int)] = [] {
        didSet {
            if enemyLineCoordinatesArray.count > oldValue.count {
                enemyCollectNewLine = true
            } 
//            else if enemyLineCoordinatesArray.count < oldValue.count {
//                enemyCollectNewLine = false
//            }
        }
    }
    @State private var yourThunderCount = 9
    @State private var enemyThunderCount = 9
    @State private var rectangleStrokeWidthTimer: Timer? = nil
    @State private var youCreateLine = false
    @State private var enemyCreateLine = false
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
                                            Image(yourThunder)
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
                                        if rectanglesOnGameField[row][col].strokeActive {
                                            RoundedRectangle(cornerRadius: 1.0)
                                                .stroke(lineWidth: rectangleStroWidth)
                                                .frame(width: width*0.025, height: width*0.025)
                                                .foregroundColor(rectanglesOnGameField[row][col].strokeColor)
                                                .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        }
                                        if rectanglesOnGameField[row][col].haveThunder {
                                            Image(rectanglesOnGameField[row][col].yourThunder ? yourThunder : enemyThunder)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: width*0.015)
                                                .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                                        }
                                    }
                                    .onTapGesture {
                                        if yourStageNumber == 1 || enemyStageNumber == 1 {
                                            if yourTurn && !rectanglesOnGameField[row][col].haveThunder{
                                                rectanglesOnGameField[row][col].haveThunder.toggle()
                                                rectanglesOnGameField[row][col].yourThunder = yourTurn
                                                checkLines()
                                                yourTurn.toggle()
                                                showPosibleMoves()
                                                yourThunderCount -= 1
                                            }
                                            if !yourTurn && !rectanglesOnGameField[row][col].haveThunder{
                                                rectanglesOnGameField[row][col].haveThunder.toggle()
                                                rectanglesOnGameField[row][col].yourThunder = yourTurn
                                                checkLines()
                                                yourTurn.toggle()
                                                showPosibleMoves()
                                                enemyThunderCount -= 1
                                            }
                                        }
                                        if yourStageNumber == 2 || enemyStageNumber == 2 {
                                            if yourTurn && rectanglesOnGameField[row][col].strokeActive {
                                                rectanglesOnGameField[row][col].haveThunder.toggle()
                                                checkLines()
                                                yourTurn.toggle()
                                                if yourThunderCount > 0 {
                                                    yourStageNumber = 1
                                                    showPosibleMoves()
                                                } else {
                                                    yourStageNumber = 3
                                                }
                                            } else if !yourTurn && rectanglesOnGameField[row][col].strokeActive {
                                                rectanglesOnGameField[row][col].haveThunder.toggle()
                                                checkLines()
                                                yourTurn.toggle()
                                                if enemyThunderCount > 0 {
                                                    enemyStageNumber = 1
                                                    showPosibleMoves()
                                                } else {
                                                    enemyStageNumber = 3
                                                }
                                            }
                                        }
                                        if yourStageNumber == 3 || enemyStageNumber == 3 {
                                            if yourTurn {
                                                if rectanglesOnGameField[row][col].yourThunder &&
                                                    rectanglesOnGameField[row][col].haveThunder && !arrayContainsSelectedRectangleByYou() {
                                                    rectanglesOnGameField[row][col].isSelect = true
                                                }
                                                if arrayContainsSelectedRectangleByYou() {
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Image("playerFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.21)
                            .overlay(
                                VStack {
                                    HStack {
                                        Text("PLAYER 2")
                                            .font(Font.custom("Helvetica-bold", size: width*0.015))
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1)
                                            .shadow(color: .black, radius: 1)
                                        Spacer()
                                        Text(!yourTurn ? "YOUR MOVE" : "WAITING")
                                            .font(Font.custom("Helvetica-bold", size: width*0.015))
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1)
                                            .shadow(color: .black, radius: 1)
                                    }
                                    .padding(.horizontal)
                                    Spacer()
                                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(width*0.025)), count: 5), spacing: 0) {
                                        ForEach(0..<enemyThunderCount, id: \.self) { id in
                                            Image(enemyThunder)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: width*0.028)
                                        }
                                    }
                                    Spacer()
                                }
                                    .padding(.vertical)
                            )
                    }
                    
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    
                }
            }
            .ignoresSafeArea()
        }
        
        .onChange(of: yourThunderCount) { _ in
            if yourThunderCount <= 0 {
                yourStageNumber = 3
            }
        }
        
        .onChange(of: enemyThunderCount) { _ in
            if enemyThunderCount <= 0 {
                enemyStageNumber = 3
            }
        }
        
        .onChange(of: youCollectNewLine) { _ in
            if youCollectNewLine {
                yourStageNumber = 2
                yourTurn = true
                whenYouCollectLines()
                youCollectNewLine = false
                print("yourStageNumber = 2")
            }
        }
        
        .onChange(of: enemyCollectNewLine) { _ in
            if enemyCollectNewLine {
                enemyStageNumber = 2
                yourTurn = false
                whenEnemyCollectLines()
                enemyCollectNewLine = false
            }
        }
        
        .onAppear {
            AppDelegate().setOrientation(to: .landscapeLeft)
            startTimerForRectangleStroke()
            showPosibleMoves()
            print("width: \(screenWidth)")
            print("height: \(screenHeight)")
        }
    }
    
    func findSelectedRectangleCoordinates() {
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].isSelect {
                    selectedRectangleRow = i
                    selectedRectangleCol = j
                }
            }
        }
    }
    
    func arrayContainsSelectedRectangleByYou() -> Bool {
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].isSelect {
                    return true
                }
            }
        }
        return false
    }
    
    func whenYouCollectLines() {
        var elementWithSrokeCount = 0
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].haveThunder && !rectanglesOnGameField[i][j].yourThunder && !rectanglesOnGameField[i][j].lineCollect{
                    rectanglesOnGameField[i][j].strokeActive = true
                    rectanglesOnGameField[i][j].strokeColor = Color.blue
                } else {
                    rectanglesOnGameField[i][j].strokeActive = false
                }
            }
        }
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].strokeActive {
                    elementWithSrokeCount += 1
                }
            }
        }
        if elementWithSrokeCount == 0 {
            for i in 0..<rectanglesOnGameField.count {
                for j in 0..<rectanglesOnGameField[i].count {
                    if rectanglesOnGameField[i][j].haveThunder && !rectanglesOnGameField[i][j].yourThunder {
                        rectanglesOnGameField[i][j].strokeActive = true
                        rectanglesOnGameField[i][j].strokeColor = Color.blue
                    }
                }
            }
        }
    }
    
    func whenEnemyCollectLines() {
        var elementWithSrokeCount = 0
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].haveThunder && rectanglesOnGameField[i][j].yourThunder && !rectanglesOnGameField[i][j].lineCollect{
                    rectanglesOnGameField[i][j].strokeActive = true
                    rectanglesOnGameField[i][j].strokeColor = Color.blue
                } else {
                    rectanglesOnGameField[i][j].strokeActive = false
                }
            }
        }
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if rectanglesOnGameField[i][j].strokeActive {
                    elementWithSrokeCount += 1
                }
            }
        }
        if elementWithSrokeCount == 0 {
            for i in 0..<rectanglesOnGameField.count {
                for j in 0..<rectanglesOnGameField[i].count {
                    if rectanglesOnGameField[i][j].haveThunder && rectanglesOnGameField[i][j].yourThunder {
                        rectanglesOnGameField[i][j].strokeActive = true
                        rectanglesOnGameField[i][j].strokeColor = Color.blue
                    }
                }
            }
        }
    }
    
    func startTimerForRectangleStroke() {
        withAnimation(Animation.easeOut(duration: 0.5)) {
            rectangleStroWidth = 3
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.easeOut(duration: 0.7)) {
                rectangleStroWidth = 0
            }
        }
        rectangleStrokeWidthTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(2), repeats: true) { _ in
            withAnimation(Animation.easeOut(duration: 0.5)) {
                rectangleStroWidth = 3
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeOut(duration: 0.7)) {
                    rectangleStroWidth = 0
                }
            }
        }
    }
    
    func showPosibleMoves() {
        for i in 0..<rectanglesOnGameField.count {
            for j in 0..<rectanglesOnGameField[i].count {
                if !rectanglesOnGameField[i][j].haveThunder {
                    rectanglesOnGameField[i][j].strokeActive = true
                    rectanglesOnGameField[i][j].strokeColor = .white
                } else {
                    rectanglesOnGameField[i][j].strokeActive = false
                }
            }
        }
    }
    
    func checkLines() {
        checkLineMethod(name: "checkLeftVerticalLine1", rx1: 0, ry1: 0, rx2: 3, ry2: 0, rx3: 7, ry3: 0, lx1: 0, ly1: 0)
        checkLineMethod(name: "checkLeftVerticalLine2", rx1: 1, ry1: 0, rx2: 3, ry2: 1, rx3: 6, ry3: 0, lx1: 0, ly1: 1)
        checkLineMethod(name: "checkLeftVerticalLine3", rx1: 2, ry1: 0, rx2: 3, ry2: 2, rx3: 5, ry3: 0, lx1: 0, ly1: 2)
        checkLineMethod(name: "checkRightVerticalLine1", rx1: 2, ry1: 2, rx2: 4, ry2: 0, rx3: 5, ry3: 2, lx1: 1, ly1: 2)
        checkLineMethod(name: "checkRightVerticalLine2", rx1: 1, ry1: 2, rx2: 4, ry2: 1, rx3: 6, ry3: 2, lx1: 1, ly1: 1)
        checkLineMethod(name: "checkRightVerticalLine3", rx1: 0, ry1: 2, rx2: 4, ry2: 2, rx3: 7, ry3: 2, lx1: 1, ly1: 0)
        checkLineMethod(name: "checkMiddleTopLine", rx1: 0, ry1: 1, rx2: 1, ry2: 1, rx3: 2, ry3: 1, lx1: 2, ly1: 0)
        checkLineMethod(name: "checkMiddleBottomLine", rx1: 5, ry1: 1, rx2: 6, ry2: 1, rx3: 7, ry3: 1, lx1: 2, ly1: 1)
        checkLineMethod(name: "checkTopHorizontalLine1", rx1: 0, ry1: 0, rx2: 0, ry2: 1, rx3: 0, ry3: 2, lx1: 3, ly1: 0)
        checkLineMethod(name: "checkTopHorizontalLine2", rx1: 1, ry1: 0, rx2: 1, ry2: 1, rx3: 1, ry3: 2, lx1: 3, ly1: 1)
        checkLineMethod(name: "checkTopHorizontalLine3", rx1: 2, ry1: 0, rx2: 2, ry2: 1, rx3: 2, ry3: 2, lx1: 3, ly1: 2)
        checkLineMethod(name: "checkBottomHorizontalLine1", rx1: 5, ry1: 0, rx2: 5, ry2: 1, rx3: 5, ry3: 2, lx1: 4, ly1: 2)
        checkLineMethod(name: "checkBottomHorizontalLine2", rx1: 6, ry1: 0, rx2: 6, ry2: 1, rx3: 6, ry3: 2, lx1: 4, ly1: 1)
        checkLineMethod(name: "checkBottomHorizontalLine3", rx1: 7, ry1: 0, rx2: 7, ry2: 1, rx3: 7, ry3: 2, lx1: 4, ly1: 0)
        checkLineMethod(name: "checkMiddleLeftLine", rx1: 3, ry1: 0, rx2: 3, ry2: 1, rx3: 3, ry3: 2, lx1: 5, ly1: 0)
        checkLineMethod(name: "checkMiddleRightLine", rx1: 4, ry1: 0, rx2: 4, ry2: 1, rx3: 4, ry3: 2, lx1: 5, ly1: 1)
    }
    
    
    
    func checkLineMethod(name: String, rx1: Int, ry1: Int, rx2: Int, ry2: Int, rx3: Int, ry3: Int, lx1: Int, ly1: Int) {
        if rectanglesOnGameField[rx1][ry1].haveThunder &&
            rectanglesOnGameField[rx2][ry2].haveThunder &&
            rectanglesOnGameField[rx3][ry3].haveThunder &&
            rectanglesOnGameField[rx1][ry1].yourThunder == rectanglesOnGameField[rx2][ry2].yourThunder &&
            rectanglesOnGameField[rx1][ry1].yourThunder == rectanglesOnGameField[rx3][ry3].yourThunder {
            if rectanglesOnGameField[rx1][ry1].yourThunder {
                linesOnGameField[lx1][ly1].lineActive = true
                rectanglesOnGameField[rx1][ry1].lineCollect = true
                rectanglesOnGameField[rx2][ry2].lineCollect = true
                rectanglesOnGameField[rx3][ry3].lineCollect = true
                if !yourLineCoordinatesArray.contains(where: {$0 == (lx1, ly1)}) {
                    yourLineCoordinatesArray.append((lx1, ly1))
                }
                
            } else {
                enemyLinesOnGameField[lx1][ly1].lineActive = true
                rectanglesOnGameField[rx1][ry1].lineCollect = true
                rectanglesOnGameField[rx2][ry2].lineCollect = true
                rectanglesOnGameField[rx3][ry3].lineCollect = true
                if !enemyLineCoordinatesArray.contains(where: {$0 == (lx1, ly1)}) {
                    enemyLineCoordinatesArray.append((lx1, ly1))
                }
                
            }
        } else {
            linesOnGameField[lx1][ly1].lineActive = false
            enemyLinesOnGameField[lx1][ly1].lineActive = false
            //            rectanglesOnGameField[rx1][ry1].lineCollect = false
            //            rectanglesOnGameField[rx2][ry2].lineCollect = false
            //            rectanglesOnGameField[rx3][ry3].lineCollect = false
            if yourLineCoordinatesArray.contains(where: {$0 == (lx1, ly1)}) {
                yourLineCoordinatesArray.removeAll(where: {$0 == (lx1, ly1)})
            }
            if enemyLineCoordinatesArray.contains(where: {$0 == (lx1, ly1)}) {
                enemyLineCoordinatesArray.removeAll(where: {$0 == (lx1, ly1)})
            }
        }
    }
    
    //    func notInLineNotCollect() {
    //        for i in 0..<rectanglesOnGameField.count {
    //            for j in 0..<rectanglesOnGameField[i].count {
    //                if !rectanglesOnGameField[i][j].haveThunder {
    //                    rectanglesOnGameField[i][j].lineCollect = false
    //                }
    //            }
    //        }
    //    }
    
}

#Preview {
    Game()
}
