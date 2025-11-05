import SwiftUI

// Structure Accessibility
struct AccessibilityItem: Identifiable {
    var id = UUID()
    var image: String
    var description: String
}

// Données
// AJOUTER IMG -> ALEXANDRE
let arrayAccessibility: [AccessibilityItem] = [
    AccessibilityItem(image: "maleDark", description: "Indique une activité réservée aux hommes."),
    AccessibilityItem(image: "femaleDark", description: "Indique une activité réservée aux femmes."),
    AccessibilityItem(image: "queerGenderDark", description: "Indique une activité réservée aux \n personnes queers."),
    AccessibilityItem(image: "wheelchairDark", description: "Indique une activité accessible à toutes \n les formes de handicap."),
    AccessibilityItem(image: "MysteryActivityBlack", description: "Indique une activité non enregistrée, \n proposée par l’organisateur.")
]

struct AccessibilityView: View {
    var body: some View {
        
        NavigationStack {
            
            // alignment: .top = fond gris
            ZStack (alignment: .top) {
                // Arrière-plan bleu
                Color.bluePrimary
                    .ignoresSafeArea()
                
                Rectangle()
                    .frame(width: 356, height: 560)
                    .foregroundColor(.containerGray)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // En-tête
                    HStack(spacing: 20) {
                        // Bouton info
                        ZStack {
                            Circle()
                            // .ultraThinMaterial : Liquide Glass
                                .fill(.ultraThinMaterial)
                                .frame(width: 36, height: 36)
                            
                            Image(systemName: "info")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        
                        // Titre
                        VStack(alignment: .leading) {
                            // spacing 0 : retire l'espace de Sport2Day
                            HStack(spacing: 0) {
                                Text("SPORT")
                                Text("2")
                                    .foregroundColor(.orangePrimary)
                                Text("DAY")
                            }
                            .font(.system(size: 24))
                            .bold()
                            .foregroundColor(.whitePrimary)
                            
                            Text("Le sport pour tous")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundColor(.whitePrimary)
                        }
                        
                        Spacer()
                    }
                        // Bouton fermer : Registration -> Accessibility -> MapView
                        //                        NavigationLink(destination: MapView()) {
                        //                            Image(systemName: "xmark")
                        //                                .font(.system(size: 20))
                        //                                .foregroundColor(.whitePrimary)
                        //                        }
                        
                                            .padding(.top, 20)
                                            .padding(.horizontal, 40)
                        
                        
                        
                        // Introduction -> MODIFIER
                        (
                            Text("Chez ")
                            + Text("SPORT")
                            + Text("2")
                                .foregroundColor(.orangePrimary)
                            + Text("DAY")
                            + Text(", le sport est pour tout le monde. Découvrez les pictogrammes d’accessibilité qui permettent à chacun de participer, de partager et de bouger ensemble.")
                        )
                        .font(.system(size: 12))
                        .italic()
                        .foregroundColor(.whitePrimary)
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                        
                        // Liste d’accessibilités
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(arrayAccessibility) { accessibility in
                                HStack(alignment: .center, spacing: 12) {
                                    ZStack {
                                        
                                        Rectangle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.whitePrimary)
                                            .cornerRadius(8)
                                        
                                        Image(accessibility.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                    }
                                    
                                    Text(accessibility.description)
                                        .font(.system(size: 12))
                                        .foregroundColor(.whitePrimary)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 40)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Message de respect
                        VStack(alignment: .leading, spacing: 20) {
                            Text("🌐 Chacun a droit au respect, quelle que soit son identité ou sa situation.")
                            
                            Text("🚫 Toute atteinte à ce principe entraînera une exclusion de l’espace.")
                        }
                        .font(.system(size: 12))
                        .italic()
                        .foregroundColor(.orangePrimary)
                        .padding(.horizontal, 40)
                        
                        
                        Spacer()
                    }
                }
            }
        }
    }
//}

#Preview {
    AccessibilityView()
}
