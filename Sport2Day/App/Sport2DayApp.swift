//
//  Sport2DayApp.swift
//  Sport2Day
//
//  Created by Melwic on 10/10/2024.
//
// Sport2DayApp.swift

import SwiftUI
import SwiftData

@main
struct Sport2DayApp: App {
    
    // MARK: - ModelContainer
    let container: ModelContainer = {
        let schema = Schema([User.self, Activity.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: false)
        
        do {
            // ⚠️ En dev : supprime la base (à retirer en prod)
            try? FileManager.default.removeItem(at: config.url)
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Erreur ModelContainer : \(error.localizedDescription)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            
    
            MainTabView()
                .modelContainer(container)
                .task {
                    await SeedData.load(in: container)
                }
        }
    }
}



enum SeedData {
    static func load(in container: ModelContainer) async {
        let context = container.mainContext
        let count = (try? context.fetchCount(FetchDescriptor<Activity>())) ?? 0
        guard count == 0 else { return }

        print("🌱 Insertion des données de seed depuis sampleActivities...")
        sampleActivities.forEach { context.insert($0) }

        try? context.save()
    }
}
