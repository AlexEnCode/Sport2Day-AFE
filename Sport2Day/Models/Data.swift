//
//  Data.swift
//  Sport2Day
//
//  Created by apprenant74 on 04/11/2025.
//

/*
import Foundation
import SwiftData
import SwiftUI

// MARK: - LEVEL
enum LevelType: String, Codable, CaseIterable, Identifiable {
    case all = "TOUT"
    case novice = "NOVICE"
    case inter = "INTER"
    case pro = "PRO"

    var id: String { rawValue }

    var displayName: String { rawValue }

    var rawKey: String {
        switch self {
        case .all:       return "TOUT"
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




enum SeedData {
    static func load(in container: ModelContainer) async {
        let context = container.mainContext

        // Vérifie si déjà seedé
        let count = (try? context.fetchCount(FetchDescriptor<Activity>())) ?? 0
        guard count == 0 else {
            print("⚠️ Données déjà présentes, seed ignoré.")
            return
        }

        print("🌱 Insertion des données de seed...")

        // --- Création des utilisateurs ---
        let erika = User(
            name: "Erika",
            email: "erika@example.com",
            password: "123",
            location: "Lille",
            description: "Passionnée de basket et d'événements inclusifs.",
            photo: "erika"
        )

        let julie = User(
            name: "Julie",
            email: "julie@example.com",
            password: "123",
            location: "Lyon",
            description: "Sportive aguerrie.",
            photo: "julie"
        )

        let alex = User(
            name: "Alex",
            email: "alex@example.com",
            password: "123",
            location: "Lille",
            description: "Fan de running et sport collectif.",
            photo: "alex"
        )

        let nina = User(
            name: "Nina",
            email: "nina@example.com",
            password: "123",
            location: "Toulouse",
            description: "Adore les sports en plein air.",
            photo: "nina"
        )

        let lucas = User(
            name: "Lucas",
            email: "lucas@example.com",
            password: "123",
            location: "Bordeaux",
            description: "Toujours partant pour un match improvisé.",
            photo: "lucas"
        )

        // --- Insertion utilisateurs ---
        [erika, julie, alex, nina, lucas].forEach { context.insert($0) }

        // --- Création des activités ---
        let activities = [
            Activity(
                title: "Match de basket amical",
                location: "Gymnase Jean Bouin, Lille",
                date: Date().addingTimeInterval(3600 * 24),
                description: "Partie conviviale ouverte à tous les niveaux.",
                players: 8,
                organizer: erika,
                participants: [alex],
                sport: .basketball,
                level: .inter,
                mindset: .fairplay,
                gender: .tous,
                handiFriendly: true
            ),
            Activity(
                title: "Running au Parc de la Citadelle",
                location: "Parc de la Citadelle, Lille",
                date: Date().addingTimeInterval(3600 * 48),
                description: "Sortie course à pied de 5 km, rythme tranquille.",
                players: 5,
                organizer: alex,
                participants: [erika, julie],
                sport: .course,
                level: .novice,
                mindset: .fairplay,
                gender: .tous,
                handiFriendly: true
            ),
            Activity(
                title: "Foot du dimanche matin",
                location: "Stade Grimonprez-Jooris, Lille",
                date: Date().addingTimeInterval(3600 * 72),
                description: "Match mixte, bonne ambiance garantie.",
                players: 10,
                organizer: julie,
                participants: [erika, alex],
                sport: .football,
                level: .inter,
                mindset: .inclusive,
                gender: .tous,
                handiFriendly: false
            ),
            Activity(
                title: "Yoga au bord de la Garonne",
                location: "Quai de la Daurade, Bordeaux",
                date: Date().addingTimeInterval(3600 * 240),
                description: "Séance matinale au lever du soleil.",
                players: 10,
                organizer: julie,
                participants: [alex],
                sport: .randonnee, // ou .autre selon ton enum
                level: .novice,
                mindset: .fairplay,
                gender: .tous,
                          handiFriendly: true
                      )
        ]

        activities.forEach { context.insert($0) }

        // --- Sauvegarde ---
        do {
            try context.save()
            print("✅ Données de seed insérées avec succès !")
            NotificationCenter.default.post(name: .seedCompleted, object: nil)
        } catch {
            print("❌ Erreur seed : \(error)")
        }
    }
}

// MARK: - Notification
extension Notification.Name {
    static let seedCompleted = Notification.Name("seedCompleted")
}

 */
