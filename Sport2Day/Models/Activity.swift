// [Melwic] 29/10 Création de class Activity, 30/10 maj @Model
// [Alex]  3/11 Gestion des coordoné par méthode

// [Melwic] 29/10 Création de class Activity, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Activity : Identifiable, Hashable {
    @Attribute(.unique) var activityID = UUID()
    var activityOrganizer: User
    var activityLocation: String
    var activitySport: Sport
    var dateString: String
    var activityDate : Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.date(from: dateString)
    }
    var activityStartTime: Int
    var activityEndTime: Int
    var activityGenders: Gender
    var activityHandi: Bool
    var activityLevel: Level
    var activityDescription: String
    var activityPlayers: Int
    
    init(activityID: UUID = UUID(), activityOrganizer: User, activityLocation: String, activitySport: Sport, dateString: String, activityStartTime: Int, activityEndTime: Int, activityGenders: Gender, activityHandi: Bool, activityLevel: Level, activityDescription: String, activityPlayers: Int) {
        self.activityID = activityID
        self.activityOrganizer = activityOrganizer
        self.activityLocation = activityLocation
        self.activitySport = activitySport
        self.dateString = dateString
        self.activityStartTime = activityStartTime
        self.activityEndTime = activityEndTime
        self.activityGenders = activityGenders
        self.activityHandi = activityHandi
        self.activityLevel = activityLevel
        self.activityDescription = activityDescription
        self.activityPlayers = activityPlayers
    }
}

var activityPreview = Activity(
    activityOrganizer: User(userName: "erika", userMail: "erika@gmail.com", userPassword: "123", userSport: [Sport(sportName: "Football", sportLogo: "soccerball")], userHandi: true, userLocation: "Toulouse", userDescription: "bg", userEvent: [], userMindset: [Mindset(mindsetName: "cool")], userPhoto: "erika"),
    activityLocation: "4 rue gobert, Toulouse",
    activitySport: Sport(sportName: "Football", sportLogo: "soccerball"),
    dateString: "18h45, 20/11/2025",
    activityStartTime: 1550,
    activityEndTime: 1750,
    activityGenders: Gender(genderName: "Queers", genderLogo: "queerGenderWhite"),
    activityHandi: true,
    activityLevel: Level(levelName: "Intermédiaire", levelColor: "amatorBronze"),
    activityDescription: "Petit foot du soir en détente avec des boissons et des snacks.",
    activityPlayers: 2)

    let sampleActivities: [Activity] = {
    let level3 = Level(levelName: "Novice", levelColor: "noviceGreen")
    let level2 = Level(levelName: "Professionnel", levelColor: "proBlue")
    let level = Level(levelName: "Intermédiaire", levelColor: "amatorBronze")
    let sport1 = Sport(sportName: "Basketball", sportLogo: "basketball.fill")
    let sport2 = Sport(sportName: "Football", sportLogo: "soccerball")
    let sport3 = Sport(sportName: "Running", sportLogo: "figure.run")
    let sport4 = Sport(sportName: "Volleyball", sportLogo: "volleyball.fill")
    let sport5 = Sport(sportName: "Musculation", sportLogo: "dumbbell.fill")
    let gender = Gender(genderName: "Queer", genderLogo: "queerGenderWhite")
    let gender2 = Gender(genderName: "Handi", genderLogo: "wheelchairWhite")
    let gender3 = Gender(genderName: "Homme", genderLogo: "maleWhite")
    let gender4 = Gender(genderName: "Femme", genderLogo: "femaleWhite")
    let mindset = Mindset(mindsetName: "Fairplay")
    let user = User(
        userName: "Erika",
        userGender: gender,
        userMail: "erika@test.com",
        userPassword: "1234",
        userSport: [sport1, sport2],
        userHandi: false,
        userLocation: "Lille",
        userDescription: "Joueuse de test",
        userEvent: [],
        userMindset: [mindset],
        userPhoto: "erika"
    )
    let user2 = User(
        userName: "Julie",
        userGender: gender2,
        userMail: "julie@test.com",
        userPassword: "1234",
        userSport: [sport1, sport2],
        userHandi: true,
        userLocation: "Lille",
        userDescription: "Joueuse de test",
        userEvent: [],
        userMindset: [mindset],
        userPhoto: "julie"
    )
        let user3 = User(
            userName: "Antony",
            userGender: gender3,
            userMail: "Anthony@test.com",
            userPassword: "1234",
            userSport: [sport3, sport4],
            userHandi: false,
            userLocation: "Paris",
            userDescription: "Joueur de test",
            userEvent: [],
            userMindset: [mindset],
            userPhoto: "antony"
        )
        let user4 = User(
            userName: "Carlos",
            userGender: gender3,
            userMail: "carlos@test.com",
            userPassword: "1234",
            userSport: [sport3, sport4],
            userHandi: false,
            userLocation: "Paris",
            userDescription: "Joueur de test",
            userEvent: [],
            userMindset: [mindset],
            userPhoto: "carlos"
        )
        let user5 = User(
            userName: "Emma",
            userGender: gender4,
            userMail: "emma@test.com",
            userPassword: "1234",
            userSport: [sport4, sport5],
            userHandi: false,
            userLocation: "Lille",
            userDescription: "Joueuse de test",
            userEvent: [],
            userMindset: [mindset],
            userPhoto: "emma"
        )
        
//        let fulluser = [user, user2, user3, user4, user5]
        
    return [
        Activity(activityOrganizer: user2, activityLocation: "4 rue Gobert - Lille", activitySport: sport1,
                 dateString: "04-11-2025", activityStartTime: 1600, activityEndTime: 1800,
                 activityGenders: gender2, activityHandi: false, activityLevel: level2,
                 activityDescription: "Basket entre amis et pour plus de fun n'oubliez pas de ramener d'autres personnes !", activityPlayers: 4),
        Activity(activityOrganizer: user, activityLocation: "5 rue du Stade - Lille", activitySport: sport2,
                 dateString: "06-11-2025", activityStartTime: 1830, activityEndTime: 2030,
                 activityGenders: gender, activityHandi: false, activityLevel: level,
                 activityDescription: "Petit foot du soir tous ensemble dans la convivialité, bien sur pas de tricheur ;)", activityPlayers: 6),
        Activity(activityOrganizer: user3, activityLocation: "Parc de la Citadelle", activitySport: sport3,
                         dateString: "01-10-2025", activityStartTime: 900, activityEndTime: 1000,
                         activityGenders: gender3, activityHandi: false, activityLevel: level3,
                         activityDescription: "Footing collectif du dimanche, niveau avancé recommandé pour cette course !", activityPlayers: 5),
        Activity(activityOrganizer: user4, activityLocation: "Gymnase Central - Lyon", activitySport: sport4,
                        dateString: "05-11-2025", activityStartTime: 1900, activityEndTime: 2100,
                        activityGenders: gender3, activityHandi: false, activityLevel: level3,
                        activityDescription: "Match amical de volley histoire de s'entrainer comme il faut et profiter de la bonne ambiance !", activityPlayers: 5),
               Activity(activityOrganizer: user5, activityLocation: "Salle UrbanFit - Lyon", activitySport: sport5,
                        dateString: "07-11-2025", activityStartTime: 1700, activityEndTime: 1830,
                        activityGenders: gender4, activityHandi: false, activityLevel: level,
                        activityDescription: "Séance fitness ouverte à tous prenez votre ballon pour que l'echauffement soit plus simple.", activityPlayers: 3)
            
    ]
}()





// [Melwic] 29/10 Création de struct Player, 30/10 maj @Model

import SwiftUI
import SwiftData

@Model
class Player {
    @Attribute(.unique) var playerID = UUID()
    var playerUser: User
    var playerActivity : Activity
    
    init(playerID: UUID = UUID(), playerUser: User, playerActivity: Activity) {
        self.playerID = playerID
        self.playerUser = playerUser
        self.playerActivity = playerActivity
    }
}



