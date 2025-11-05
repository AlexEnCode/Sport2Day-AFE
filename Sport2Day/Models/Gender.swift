// [Melwic] 29/10 Création de struct Gender, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Gender : Identifiable {
    @Attribute(.unique) var id = UUID()
    var genderName: String
    var genderLogo: String
    
    init(id: UUID = UUID(), genderName: String, genderLogo: String) {
        self.id = id
        self.genderName = genderName
        self.genderLogo = genderLogo
    }
}

var genderData = [
    Gender(genderName: "Homme", genderLogo: "maleWhite"),
    Gender(genderName: "Femme", genderLogo: "femaleWhite"),
    Gender(genderName: "Queer", genderLogo: "queerGenderWhite")
    
]
