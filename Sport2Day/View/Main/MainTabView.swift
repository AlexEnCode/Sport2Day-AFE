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
        .tint(.white)
    }
}


// enum TabSelection {
//    case MapView(),
//    case ActivityListCellView(),
//    case UserProfilView()
//
//}

// Vue principale avec le TabView
struct MainContentView: View {
    let currentUser: User
    
    
    @State  var selectedTab: Int = 0
    
    
    var body: some View {
        
        TabView (selection: $selectedTab){
            MapView()
                .tabItem { Label("Carte", systemImage: "mappin.circle.fill") }
                .tag(0)
            ActivityListCellView()
                .tabItem { Label("Activités", systemImage: "book.fill") }
                .tag(1)
            
            UserProfilView()
                .tabItem { Label("Profil", systemImage: "person.crop.circle") }
                .tag(2)
        }
        .onReceive(NotificationCenter.default.publisher(for: .switchToTab)) { notification in
            if let tabIndex = notification.object as? Int {
                selectedTab = tabIndex
            }
        }
    }
}
extension Notification.Name {
    static let switchToTab = Notification.Name("switchToTab")
}
