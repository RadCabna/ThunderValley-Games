//
//  Models.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 29.01.2025.
//

import Foundation
import SwiftUI

struct Thunder: Equatable {
    var itemName: String = ""
    var positionX: CGFloat
    var positionY: CGFloat
    var lineCollect = false
    var haveThunder = false
    var yourThunder = true
    var strokeActive = false
    var strokeColor = Color.white
}

struct Lines: Equatable {
    var itemName: String
    var positionX: CGFloat
    var positionY: CGFloat
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    var opacity: CGFloat = 1
    var lineActive = false
    
}

class Arrays {
    
    static var loadingArray = [
        "loadingThunder1",
        "loadingThunder2",
        "loadingThunder3",
        "loadingThunder4",
        "loadingThunder5"
        ]
    
    static var rectanglesOnGameField: [[Thunder]] = [
        [Thunder(positionX: -128, positionY: -128), Thunder(positionX: 0, positionY: -128), Thunder(positionX: 128, positionY: -128)],
        [Thunder(positionX: -97, positionY: -97), Thunder(positionX: 0, positionY: -97), Thunder(positionX: 97, positionY: -97)],
        [Thunder(positionX: -67, positionY: -67), Thunder(positionX: 0, positionY: -67), Thunder(positionX: 67, positionY: -67)],
        
        [Thunder(positionX: -128, positionY: -2), Thunder(positionX: -97, positionY: -2), Thunder(positionX: -67, positionY: -2)],
        [Thunder(positionX: 67, positionY: -2), Thunder(positionX: 97, positionY: -2), Thunder(positionX: 128, positionY: -2)],
        
        [Thunder(positionX: -67, positionY: 67), Thunder(positionX: 0, positionY: 67), Thunder(positionX: 67, positionY: 67)],
        [Thunder(positionX: -97, positionY: 97), Thunder(positionX: 0, positionY: 97), Thunder(positionX: 97, positionY: 97)],
        [Thunder(positionX: -128, positionY: 128), Thunder(positionX: 0, positionY: 128), Thunder(positionX: 128, positionY: 128)]
    ]
    
    static var blueLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "blueVertical1", positionX: -128, positionY: 0), Lines(itemName: "blueVertical2", positionX: -97, positionY: 0), Lines(itemName: "blueVertical3", positionX: -67, positionY: 0),],
    [Lines(itemName: "blueVertical1", positionX: 128, positionY: 0), Lines(itemName: "blueVertical2", positionX:97, positionY: 0), Lines(itemName: "blueVertical3", positionX: 67, positionY: 0)],
    [Lines(itemName: "blueVertical4", positionX: 0, positionY: -97), Lines(itemName: "blueVertical4", positionX: 0, positionY: 97)],
    [Lines(itemName: "blueHorizontal1", positionX: 0, positionY: -128), Lines(itemName: "blueHorizontal2", positionX: 0, positionY: -97), Lines(itemName: "blueHorizontal3", positionX: 0, positionY: -67)],
    [Lines(itemName: "blueHorizontal1", positionX: 0, positionY: 128), Lines(itemName: "blueHorizontal2", positionX: 0, positionY: 97), Lines(itemName: "blueHorizontal3", positionX: 0, positionY: 67)],
    [Lines(itemName: "blueHorizontal4", positionX: -97, positionY: 0), Lines(itemName: "blueHorizontal4", positionX: 97, positionY: 0)]
    ]
    
    static var redLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "redVertical1", positionX: -128, positionY: 0), Lines(itemName: "redVertical2", positionX: -97, positionY: 0), Lines(itemName: "redVertical3", positionX: -67, positionY: 0),],
    [Lines(itemName: "redVertical1", positionX: 128, positionY: 0), Lines(itemName: "redVertical2", positionX:97, positionY: 0), Lines(itemName: "redVertical3", positionX: 67, positionY: 0)],
    [Lines(itemName: "redVertical4", positionX: 0, positionY: -97), Lines(itemName: "redVertical4", positionX: 0, positionY: 97)],
    [Lines(itemName: "redHorizontal1", positionX: 0, positionY: -128), Lines(itemName: "redHorizontal2", positionX: 0, positionY: -97), Lines(itemName: "redHorizontal3", positionX: 0, positionY: -67)],
    [Lines(itemName: "redHorizontal1", positionX: 0, positionY: 128), Lines(itemName: "redHorizontal2", positionX: 0, positionY: 97), Lines(itemName: "redHorizontal3", positionX: 0, positionY: 67)],
    [Lines(itemName: "redHorizontal4", positionX: -97, positionY: 0), Lines(itemName: "redHorizontal4", positionX: 97, positionY: 0)]
    ]
}


//func checkLeftVerticalLine1() {
//    if rectanglesOnGameField[0][0].haveThunder &&
//        rectanglesOnGameField[3][0].haveThunder &&
//        rectanglesOnGameField[7][0].haveThunder &&
//        rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[3][0].yourThunder &&
//        rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[7][0].yourThunder {
//        if rectanglesOnGameField[0][0].yourThunder {
//            linesOnGameField[0][0].lineActive = true
//            rectanglesOnGameField[0][0].lineCollect = true
//            rectanglesOnGameField[3][0].lineCollect = true
//            rectanglesOnGameField[7][0].lineCollect = true
//        } else {
//            enemyLinesOnGameField[0][0].lineActive = true
//            rectanglesOnGameField[0][0].lineCollect = true
//            rectanglesOnGameField[3][0].lineCollect = true
//            rectanglesOnGameField[7][0].lineCollect = true
//        }
//    } else {
//        linesOnGameField[0][0].lineActive = false
//        enemyLinesOnGameField[0][0].lineActive = false
//        rectanglesOnGameField[0][0].lineCollect = false
//        rectanglesOnGameField[3][0].lineCollect = false
//        rectanglesOnGameField[7][0].lineCollect = false
//    }
//}
//
//func checkLeftVerticalLine2() {
//    if rectanglesOnGameField[1][0].haveThunder &&
//        rectanglesOnGameField[3][1].haveThunder &&
//        rectanglesOnGameField[6][0].haveThunder &&
//        rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[3][1].yourThunder &&
//        rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[6][0].yourThunder {
//        if rectanglesOnGameField[1][0].yourThunder {
//            linesOnGameField[0][1].lineActive = true
//            rectanglesOnGameField[1][0].lineCollect = true
//            rectanglesOnGameField[3][1].lineCollect = true
//            rectanglesOnGameField[6][0].lineCollect = true
//        } else {
//            enemyLinesOnGameField[0][1].lineActive = true
//            rectanglesOnGameField[1][0].lineCollect = true
//            rectanglesOnGameField[3][1].lineCollect = true
//            rectanglesOnGameField[6][0].lineCollect = true
//        }
//    } else {
//        linesOnGameField[0][1].lineActive = false
//        enemyLinesOnGameField[0][1].lineActive = false
//        rectanglesOnGameField[1][0].lineCollect = false
//        rectanglesOnGameField[3][1].lineCollect = false
//        rectanglesOnGameField[6][0].lineCollect = false
//    }
//}
//
//func checkLeftVerticalLine3() {
//    if rectanglesOnGameField[2][0].haveThunder &&
//        rectanglesOnGameField[3][2].haveThunder &&
//        rectanglesOnGameField[5][0].haveThunder &&
//        rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[3][2].yourThunder &&
//        rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[5][0].yourThunder {
//        if rectanglesOnGameField[2][0].yourThunder {
//            linesOnGameField[0][2].lineActive = true
//            rectanglesOnGameField[2][0].lineCollect = true
//            rectanglesOnGameField[3][2].lineCollect = true
//            rectanglesOnGameField[5][0].lineCollect = true
//        } else {
//            enemyLinesOnGameField[0][2].lineActive = true
//            rectanglesOnGameField[2][0].lineCollect = true
//            rectanglesOnGameField[3][2].lineCollect = true
//            rectanglesOnGameField[5][0].lineCollect = true
//        }
//    } else {
//        linesOnGameField[0][2].lineActive = false
//        enemyLinesOnGameField[0][2].lineActive = false
//        rectanglesOnGameField[2][0].lineCollect = false
//        rectanglesOnGameField[3][2].lineCollect = false
//        rectanglesOnGameField[5][0].lineCollect = false
//    }
//}
//
//func checkRightVerticalLine1() {
//    if rectanglesOnGameField[2][2].haveThunder &&
//        rectanglesOnGameField[4][0].haveThunder &&
//        rectanglesOnGameField[5][2].haveThunder &&
//        rectanglesOnGameField[2][2].yourThunder == rectanglesOnGameField[4][0].yourThunder &&
//        rectanglesOnGameField[2][2].yourThunder == rectanglesOnGameField[5][2].yourThunder {
//        if rectanglesOnGameField[2][2].yourThunder {
//            linesOnGameField[1][2].lineActive = true
//            rectanglesOnGameField[2][2].lineCollect = true
//            rectanglesOnGameField[4][0].lineCollect = true
//            rectanglesOnGameField[5][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[1][2].lineActive = true
//            rectanglesOnGameField[2][2].lineCollect = true
//            rectanglesOnGameField[4][0].lineCollect = true
//            rectanglesOnGameField[5][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[1][2].lineActive = false
//        enemyLinesOnGameField[1][2].lineActive = false
//        rectanglesOnGameField[2][2].lineCollect = false
//        rectanglesOnGameField[4][0].lineCollect = false
//        rectanglesOnGameField[5][2].lineCollect = false
//    }
//}
//
//func checkRightVerticalLine2() {
//    if rectanglesOnGameField[1][2].haveThunder &&
//        rectanglesOnGameField[4][1].haveThunder &&
//        rectanglesOnGameField[6][2].haveThunder &&
//        rectanglesOnGameField[1][2].yourThunder == rectanglesOnGameField[4][1].yourThunder &&
//        rectanglesOnGameField[1][2].yourThunder == rectanglesOnGameField[6][2].yourThunder {
//        if rectanglesOnGameField[1][2].yourThunder {
//            linesOnGameField[1][1].lineActive = true
//            rectanglesOnGameField[1][2].lineCollect = true
//            rectanglesOnGameField[4][1].lineCollect = true
//            rectanglesOnGameField[6][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[1][1].lineActive = true
//            rectanglesOnGameField[1][2].lineCollect = true
//            rectanglesOnGameField[4][1].lineCollect = true
//            rectanglesOnGameField[6][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[1][1].lineActive = false
//        enemyLinesOnGameField[1][1].lineActive = false
//        rectanglesOnGameField[1][2].lineCollect = false
//        rectanglesOnGameField[4][1].lineCollect = false
//        rectanglesOnGameField[6][2].lineCollect = false
//    }
//}
//
//func checkRightVerticalLine3() {
//    if rectanglesOnGameField[0][2].haveThunder &&
//        rectanglesOnGameField[4][2].haveThunder &&
//        rectanglesOnGameField[7][2].haveThunder &&
//        rectanglesOnGameField[0][2].yourThunder == rectanglesOnGameField[4][2].yourThunder &&
//        rectanglesOnGameField[0][2].yourThunder == rectanglesOnGameField[7][2].yourThunder {
//        if rectanglesOnGameField[0][2].yourThunder {
//            linesOnGameField[1][0].lineActive = true
//            rectanglesOnGameField[0][2].lineCollect = true
//            rectanglesOnGameField[4][2].lineCollect = true
//            rectanglesOnGameField[7][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[1][0].lineActive = true
//            rectanglesOnGameField[0][2].lineCollect = true
//            rectanglesOnGameField[4][2].lineCollect = true
//            rectanglesOnGameField[7][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[1][0].lineActive = false
//        enemyLinesOnGameField[1][0].lineActive = false
//        rectanglesOnGameField[0][2].lineCollect = false
//        rectanglesOnGameField[4][2].lineCollect = false
//        rectanglesOnGameField[7][2].lineCollect = false
//    }
//}
//
//func checkMiddleTopLine() {
//    if rectanglesOnGameField[0][1].haveThunder &&
//        rectanglesOnGameField[1][1].haveThunder &&
//        rectanglesOnGameField[2][1].haveThunder &&
//        rectanglesOnGameField[0][1].yourThunder == rectanglesOnGameField[1][1].yourThunder &&
//        rectanglesOnGameField[0][1].yourThunder == rectanglesOnGameField[2][1].yourThunder {
//        if rectanglesOnGameField[0][1].yourThunder {
//            linesOnGameField[2][0].lineActive = true
//            rectanglesOnGameField[0][1].lineCollect = true
//            rectanglesOnGameField[1][1].lineCollect = true
//            rectanglesOnGameField[2][1].lineCollect = true
//        } else {
//            enemyLinesOnGameField[2][0].lineActive = true
//            rectanglesOnGameField[0][1].lineCollect = true
//            rectanglesOnGameField[1][1].lineCollect = true
//            rectanglesOnGameField[2][1].lineCollect = true
//        }
//    } else {
//        linesOnGameField[2][0].lineActive = false
//        enemyLinesOnGameField[2][0].lineActive = false
//        rectanglesOnGameField[0][1].lineCollect = false
//        rectanglesOnGameField[1][1].lineCollect = false
//        rectanglesOnGameField[2][1].lineCollect = false
//    }
//}
//
//func checkMiddleBottomLine() {
//    if rectanglesOnGameField[5][1].haveThunder &&
//        rectanglesOnGameField[6][1].haveThunder &&
//        rectanglesOnGameField[7][1].haveThunder &&
//        rectanglesOnGameField[5][1].yourThunder == rectanglesOnGameField[6][1].yourThunder &&
//        rectanglesOnGameField[5][1].yourThunder == rectanglesOnGameField[7][1].yourThunder {
//        if rectanglesOnGameField[5][1].yourThunder {
//            linesOnGameField[2][1].lineActive = true
//            rectanglesOnGameField[5][1].lineCollect = true
//            rectanglesOnGameField[6][1].lineCollect = true
//            rectanglesOnGameField[7][1].lineCollect = true
//        } else {
//            enemyLinesOnGameField[2][1].lineActive = true
//            rectanglesOnGameField[5][1].lineCollect = true
//            rectanglesOnGameField[6][1].lineCollect = true
//            rectanglesOnGameField[7][1].lineCollect = true
//        }
//    } else {
//        linesOnGameField[2][1].lineActive = false
//        enemyLinesOnGameField[2][1].lineActive = false
//        rectanglesOnGameField[5][1].lineCollect = false
//        rectanglesOnGameField[6][1].lineCollect = false
//        rectanglesOnGameField[7][1].lineCollect = false
//    }
//}
//
//func checkTopHorizontalLine1() {
//    if rectanglesOnGameField[0][0].haveThunder &&
//        rectanglesOnGameField[0][1].haveThunder &&
//        rectanglesOnGameField[0][2].haveThunder &&
//        rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[0][1].yourThunder &&
//        rectanglesOnGameField[0][0].yourThunder == rectanglesOnGameField[0][2].yourThunder {
//        if rectanglesOnGameField[0][0].yourThunder {
//            linesOnGameField[3][0].lineActive = true
//            rectanglesOnGameField[0][0].lineCollect = true
//            rectanglesOnGameField[0][1].lineCollect = true
//            rectanglesOnGameField[0][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[3][0].lineActive = true
//            rectanglesOnGameField[0][0].lineCollect = true
//            rectanglesOnGameField[0][1].lineCollect = true
//            rectanglesOnGameField[0][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[3][0].lineActive = false
//        enemyLinesOnGameField[3][0].lineActive = false
//        rectanglesOnGameField[0][0].lineCollect = false
//        rectanglesOnGameField[0][1].lineCollect = false
//        rectanglesOnGameField[0][2].lineCollect = false
//    }
//}
//
//func checkTopHorizontalLine2() {
//    if rectanglesOnGameField[1][0].haveThunder &&
//        rectanglesOnGameField[1][1].haveThunder &&
//        rectanglesOnGameField[1][2].haveThunder &&
//        rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[1][1].yourThunder &&
//        rectanglesOnGameField[1][0].yourThunder == rectanglesOnGameField[1][2].yourThunder {
//        if rectanglesOnGameField[1][0].yourThunder {
//            linesOnGameField[3][1].lineActive = true
//            rectanglesOnGameField[1][0].lineCollect = true
//            rectanglesOnGameField[1][1].lineCollect = true
//            rectanglesOnGameField[1][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[3][1].lineActive = true
//            rectanglesOnGameField[1][0].lineCollect = true
//            rectanglesOnGameField[1][1].lineCollect = true
//            rectanglesOnGameField[1][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[3][1].lineActive = false
//        enemyLinesOnGameField[3][1].lineActive = false
//        rectanglesOnGameField[1][0].lineCollect = false
//        rectanglesOnGameField[1][1].lineCollect = false
//        rectanglesOnGameField[1][2].lineCollect = false
//    }
//}
//
//func checkTopHorizontalLine3() {
//    if rectanglesOnGameField[2][0].haveThunder &&
//        rectanglesOnGameField[2][1].haveThunder &&
//        rectanglesOnGameField[2][2].haveThunder &&
//        rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[2][1].yourThunder &&
//        rectanglesOnGameField[2][0].yourThunder == rectanglesOnGameField[2][2].yourThunder {
//        if rectanglesOnGameField[2][0].yourThunder {
//            linesOnGameField[3][2].lineActive = true
//            rectanglesOnGameField[2][0].lineCollect = true
//            rectanglesOnGameField[2][1].lineCollect = true
//            rectanglesOnGameField[2][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[3][2].lineActive = true
//            rectanglesOnGameField[2][0].lineCollect = true
//            rectanglesOnGameField[2][1].lineCollect = true
//            rectanglesOnGameField[2][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[3][2].lineActive = false
//        enemyLinesOnGameField[3][2].lineActive = false
//        rectanglesOnGameField[2][0].lineCollect = false
//        rectanglesOnGameField[2][1].lineCollect = false
//        rectanglesOnGameField[2][2].lineCollect = false
//    }
//}
//
//func checkBottomHorizontalLine1() {
//    if rectanglesOnGameField[5][0].haveThunder &&
//        rectanglesOnGameField[5][1].haveThunder &&
//        rectanglesOnGameField[5][2].haveThunder &&
//        rectanglesOnGameField[5][0].yourThunder == rectanglesOnGameField[5][1].yourThunder &&
//        rectanglesOnGameField[5][0].yourThunder == rectanglesOnGameField[5][2].yourThunder {
//        if rectanglesOnGameField[5][0].yourThunder {
//            linesOnGameField[4][2].lineActive = true
//            rectanglesOnGameField[5][0].lineCollect = true
//            rectanglesOnGameField[5][1].lineCollect = true
//            rectanglesOnGameField[5][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[4][2].lineActive = true
//            rectanglesOnGameField[5][0].lineCollect = true
//            rectanglesOnGameField[5][1].lineCollect = true
//            rectanglesOnGameField[5][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[4][2].lineActive = false
//        enemyLinesOnGameField[4][2].lineActive = false
//        rectanglesOnGameField[5][0].lineCollect = false
//        rectanglesOnGameField[5][1].lineCollect = false
//        rectanglesOnGameField[5][2].lineCollect = false
//    }
//}
//
//func checkBottomHorizontalLine2() {
//    if rectanglesOnGameField[6][0].haveThunder &&
//        rectanglesOnGameField[6][1].haveThunder &&
//        rectanglesOnGameField[6][2].haveThunder &&
//        rectanglesOnGameField[6][0].yourThunder == rectanglesOnGameField[6][1].yourThunder &&
//        rectanglesOnGameField[6][0].yourThunder == rectanglesOnGameField[6][2].yourThunder {
//        if rectanglesOnGameField[6][0].yourThunder {
//            linesOnGameField[4][1].lineActive = true
//            rectanglesOnGameField[6][0].lineCollect = true
//            rectanglesOnGameField[6][1].lineCollect = true
//            rectanglesOnGameField[6][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[4][1].lineActive = true
//            rectanglesOnGameField[6][0].lineCollect = true
//            rectanglesOnGameField[6][1].lineCollect = true
//            rectanglesOnGameField[6][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[4][1].lineActive = false
//        enemyLinesOnGameField[4][1].lineActive = false
//        rectanglesOnGameField[6][0].lineCollect = false
//        rectanglesOnGameField[6][1].lineCollect = false
//        rectanglesOnGameField[6][2].lineCollect = false
//    }
//}
//
//func checkBottomHorizontalLine3() {
//    if rectanglesOnGameField[7][0].haveThunder &&
//        rectanglesOnGameField[7][1].haveThunder &&
//        rectanglesOnGameField[7][2].haveThunder &&
//        rectanglesOnGameField[7][0].yourThunder == rectanglesOnGameField[7][1].yourThunder &&
//        rectanglesOnGameField[7][0].yourThunder == rectanglesOnGameField[7][2].yourThunder {
//        if rectanglesOnGameField[7][0].yourThunder {
//            linesOnGameField[4][0].lineActive = true
//            rectanglesOnGameField[7][0].lineCollect = true
//            rectanglesOnGameField[7][1].lineCollect = true
//            rectanglesOnGameField[7][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[4][0].lineActive = true
//            rectanglesOnGameField[7][0].lineCollect = true
//            rectanglesOnGameField[7][1].lineCollect = true
//            rectanglesOnGameField[7][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[4][0].lineActive = false
//        enemyLinesOnGameField[4][0].lineActive = false
//        rectanglesOnGameField[7][0].lineCollect = false
//        rectanglesOnGameField[7][1].lineCollect = false
//        rectanglesOnGameField[7][2].lineCollect = false
//    }
//}
//
//func checkMiddleLeftLine() {
//    if rectanglesOnGameField[3][0].haveThunder &&
//        rectanglesOnGameField[3][1].haveThunder &&
//        rectanglesOnGameField[3][2].haveThunder &&
//        rectanglesOnGameField[3][0].yourThunder == rectanglesOnGameField[3][1].yourThunder &&
//        rectanglesOnGameField[3][0].yourThunder == rectanglesOnGameField[3][2].yourThunder {
//        if rectanglesOnGameField[3][0].yourThunder {
//            linesOnGameField[5][0].lineActive = true
//            rectanglesOnGameField[3][0].lineCollect = true
//            rectanglesOnGameField[3][1].lineCollect = true
//            rectanglesOnGameField[3][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[5][0].lineActive = true
//            rectanglesOnGameField[3][0].lineCollect = true
//            rectanglesOnGameField[3][1].lineCollect = true
//            rectanglesOnGameField[3][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[5][0].lineActive = false
//        enemyLinesOnGameField[5][0].lineActive = false
//        rectanglesOnGameField[3][0].lineCollect = false
//        rectanglesOnGameField[3][1].lineCollect = false
//        rectanglesOnGameField[3][2].lineCollect = false
//    }
//}
//
//func checkMiddleRightLine() {
//    if rectanglesOnGameField[4][0].haveThunder &&
//        rectanglesOnGameField[4][1].haveThunder &&
//        rectanglesOnGameField[4][2].haveThunder &&
//        rectanglesOnGameField[4][0].yourThunder == rectanglesOnGameField[4][1].yourThunder &&
//        rectanglesOnGameField[4][0].yourThunder == rectanglesOnGameField[4][2].yourThunder {
//        if rectanglesOnGameField[4][0].yourThunder {
//            linesOnGameField[5][1].lineActive = true
//            rectanglesOnGameField[4][0].lineCollect = true
//            rectanglesOnGameField[4][1].lineCollect = true
//            rectanglesOnGameField[4][2].lineCollect = true
//        } else {
//            enemyLinesOnGameField[5][1].lineActive = true
//            rectanglesOnGameField[4][0].lineCollect = true
//            rectanglesOnGameField[4][1].lineCollect = true
//            rectanglesOnGameField[4][2].lineCollect = true
//        }
//    } else {
//        linesOnGameField[5][1].lineActive = false
//        enemyLinesOnGameField[5][1].lineActive = false
//        rectanglesOnGameField[4][0].lineCollect = false
//        rectanglesOnGameField[4][1].lineCollect = false
//        rectanglesOnGameField[4][2].lineCollect = false
//    }
//}
