//
//  Models.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 29.01.2025.
//

import Foundation

struct Thunder: Codable, Equatable {
    var itemName: String = ""
    var positionX: CGFloat
    var positionY: CGFloat
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    var opacity: CGFloat = 1
}

struct Lines: Codable, Equatable {
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
}
