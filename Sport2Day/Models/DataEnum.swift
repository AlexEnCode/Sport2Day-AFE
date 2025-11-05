

// MARK: - LEVEL
enum LevelType: String, Codable, CaseIterable, Identifiable {
    case all = "TOUS"
    case novice = "NOVICE"
    case inter = "INTER"
    case pro = "PRO"

    var id: String { rawValue }

    var displayName: String { rawValue }

    var rawKey: String {
        switch self {
        case .all:       return "TOUS"
        case .novice:    return "NOVICE"
        case .inter:     return "INTER"
        case .pro:       return "PRO"
        }
    }
}

// MARK: - GENDER
enum GenderType: String, Codable, CaseIterable {
    case homme = "Homme"
    case femme = "Femme"
    case queer = "Queer"
    case tous = "Tous"
}

// MARK: - MINDSET
enum MindsetType: String, Codable, CaseIterable {
    case fairplay = "Fairplay"
    case inclusive = "Inclusive"
    case competitive = "Compétitive"
    case convivial = "Convivial"
    case zen = "Zen"
    case motivant = "Motivant"
    case detente = "Détente"
}



enum SportType: String, Codable, CaseIterable, Identifiable {
    case basketball = "Basketball"
    case tennis = "Tennis"
    case musculation = "Musculation"
    case volleyball = "Volley-ball"
    case football = "Football"
    case course = "Course à pied"
    case randonnee = "Randonnée"
    case rugby = "Rugby"
    case skateboard = "Skateboard"
    case autre = "Autre"
    
    var id: String { rawValue }
    
    var displayName: String { rawValue }
    
    var icon: String {
        switch self {
        case .basketball:   return "basketball.fill"
        case .tennis:       return "tennisball.fill"
        case .musculation:  return "dumbbell.fill"
        case .volleyball:   return "volleyball.fill"
        case .football:     return "soccerball"
        case .course:       return "figure.run"
        case .randonnee:    return "figure.hiking"
        case .rugby:        return "rugbyball.fill"
        case .skateboard:   return "skateboard.fill"
        case .autre:        return "questionmark.circle"
        }
    }
}
