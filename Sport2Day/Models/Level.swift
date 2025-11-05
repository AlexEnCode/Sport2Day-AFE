//
//  Level.swift
//  Sport2Day
//
//  Created by apprenant74 on 05/11/2025.
//




// [Melwic] 29/10 Création de struct Level, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Level: Identifiable {
    @Attribute(.unique) var id = UUID()
    var levelName: String
    var levelColor: String
    
    init(levelName: String, levelColor: String ) {
        self.levelName = levelName
        self.levelColor = levelColor
    }
}

var levelData = [
    Level(levelName: "Professionnel", levelColor: "proBlue"),
    Level(levelName: "Intermédiaire", levelColor: "amatorBronze"),
    Level(levelName: "Novice", levelColor: "noviceGreen"),
    Level(levelName: "Tous", levelColor: "allYellow")
]
