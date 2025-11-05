//
//  Mindset.swift
//  Sport2Day
//
//  Created by apprenant74 on 05/11/2025.
//



// [Melwic] 29/10 Création de struct Mindset, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Mindset : Identifiable{
    @Attribute(.unique) var id = UUID()
    var mindsetName: String
    
    init(mindsetName: String) {
        self.mindsetName = mindsetName
    }
}

var mindsetData = [
    Mindset(mindsetName: "Fairplay"),
    Mindset(mindsetName: "Inclusive"),
    Mindset(mindsetName: "Compétitive")
]

