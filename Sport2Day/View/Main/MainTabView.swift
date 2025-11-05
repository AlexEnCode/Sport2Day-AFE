import SwiftUI
import SwiftData

struct MainTabView: View {
    
    @Query(filter: #Predicate<User> { $0.userName == "Erika" }) private var erikaUsers: [User]
    
    var body: some View {
        Group {
            if let currentUser = erikaUsers.first {
                MainContentView(currentUser: currentUser)
            } else {
        
                ContentUnavailableView(
                    "Utilisateur non trouvé",
                    systemImage: "person.crop.circle.badge.exclamationmark",
                    description: Text("Erika n'est pas disponible.")
                )
            }
        }
        .tint(.orangePrimary)
    }
}





// Vue principale avec le TabView
struct MainContentView: View {
    let currentUser: User
    
    var body: some View {
        TabView {
            MapView()
                .tabItem { Label("Carte", systemImage: "mappin.circle.fill") }
            
            ActivityListCellView()
                .tabItem { Label("Activités", systemImage: "book.fill") }
            
            UserProfilView()
                .tabItem { Label("Profil", systemImage: "person.crop.circle") }
        }
    }
}
