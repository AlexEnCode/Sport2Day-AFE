// [Melwic] 29/10 Création de class User, 30/10 maj @Model

// [Melwic] 29/10 Création de class User, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class User : Identifiable {
    @Attribute(.unique) var userID = UUID()
    var userName: String
    var userGender: Gender?
    var userMail: String
    var userPassword: String
    var userSport: [Sport]
    var userHandi: Bool
    var userLocation: String
    var userDescription: String
    var userEvent: [Activity]
    var userMindset: [Mindset]
    var userPhoto : String
    
    init(userID: UUID = UUID(), userName: String, userGender: Gender? = nil, userMail: String, userPassword: String, userSport: [Sport], userHandi: Bool, userLocation: String, userDescription: String, userEvent: [Activity], userMindset: [Mindset], userPhoto: String) {
        self.userID = userID
        self.userName = userName
        self.userGender = userGender
        self.userMail = userMail
        self.userPassword = userPassword
        self.userSport = userSport
        self.userHandi = userHandi
        self.userLocation = userLocation
        self.userDescription = userDescription
        self.userEvent = userEvent
        self.userMindset = userMindset
        self.userPhoto = userPhoto
    }

}

extension User {
    convenience init(
        name: String,
        email: String,
        password: String,
        location: String,
        description: String,
        gender: Gender? = nil,
        handi: Bool = false,
        mindsets: [Mindset] = [],
        photo: String = ""
    ) {
        self.init(
            userName: name,
            userGender: gender,
            userMail: email,
            userPassword: password,
            userSport: [],
            userHandi: handi,
            userLocation: location,
            userDescription: description,
            userEvent: [],
            userMindset: mindsets,
            userPhoto: photo
        )
    }
}



var userData = [
    User(userName: "Erika", userGender: genderData[2], userMail: "erika97@gmail.com", userPassword: "erika1234@",
    userSport: [
        Sport(sportName: sportData[0].sportName,sportLogo: sportData[0].sportLogo, sportLevel : levelData[0]),
        Sport(sportName: sportData[1].sportName,sportLogo: sportData[1].sportLogo, sportLevel : levelData[1]),
    ]
    , userHandi: false, userLocation: "Paris", userDescription: "Elle/She/Her 🌈",
    userEvent: [
        
    ],
    userMindset: [
        mindsetData[0],
        mindsetData[1],
        mindsetData[2]
    ]
    , userPhoto: "erika"),
    User(userName: "Julie", userGender: genderData[1], userMail: "julie.c96@gmail.com", userPassword: "xJULIE!45",
    userSport: [
        Sport(sportName: sportData[4].sportName,sportLogo: sportData[4].sportLogo, sportLevel : levelData[0]),
        Sport(sportName: sportData[1].sportName,sportLogo: sportData[1].sportLogo, sportLevel : levelData[1]),
        Sport(sportName: sportData[3].sportName,sportLogo: sportData[3].sportLogo, sportLevel : levelData[1]),
    ]
    , userHandi: false, userLocation: "Lyon", userDescription: "Vétérane de l'application, j'ai fais plein d'évenements",
    userEvent: [
        
    ],
    userMindset: [
        mindsetData[0],
        mindsetData[1],
        mindsetData[2]
    ]
    , userPhoto: "julie")
]

