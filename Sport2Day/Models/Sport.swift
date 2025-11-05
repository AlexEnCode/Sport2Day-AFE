//
//  Sport.swift
//  Sport2Day
//
//  Created by apprenant74 on 05/11/2025.
//


// [Melwic] 29/10 Création de class Sport, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Sport : Identifiable {
    @Attribute(.unique) var sportID = UUID()
    var sportName: String
    var sportLogo: String
    var sportLevel: Level?
    
    init(sportID: UUID = UUID(), sportName: String, sportLogo: String, sportLevel: Level? = nil) {
        self.sportID = sportID
        self.sportName = sportName
        self.sportLogo = sportLogo
        self.sportLevel = sportLevel
    }
}

 var sportData = [
    Sport(sportName: "Basketball", sportLogo: "basketball.fill"),
    Sport(sportName: "Football", sportLogo: "soccerball"),
    Sport(sportName: "Course à pied", sportLogo: "figure.run"),
    Sport(sportName: "Volley", sportLogo: "figure.volleyball"),
    Sport(sportName: "Fitness", sportLogo: "dumbbell")
 ]