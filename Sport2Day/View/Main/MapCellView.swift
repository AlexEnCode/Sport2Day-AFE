
// [Alex] 29/10  récupération de mes tests mapKit
// la map s'affiche et permet des annotations
// [Alex] 30/10 mise a jour global taille / Pin / 



import SwiftUI
import MapKit
import SwiftData

struct MapCellView: View {
    @Binding var position: MapCameraPosition
    let activities: [Activity]
    @Binding var selectedActivity: Activity?
    
    
    @State private var annotations: [ActivityAnnotation] = []
    @State private var isLoading = false
    
    private var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    var body: some View {
        ZStack {
            // Fond stylisé
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.containerGray)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                )
                .shadow(color: .black.opacity(0.5), radius: 12)
                .padding(.horizontal, 16)
            
            // Map avec annotations observables
            Map(position: $position) {
                ForEach(annotations) { annotation in
                    let act = annotation.activity
                    let coord = annotation.coordinate
                    let title = act.activityLocation  // On affiche le lieu, à défaut de titre
                    
                    Annotation(title, coordinate: coord) {
                        Button {
                            selectedActivity = act
                        } label: {
                            CustomActivityPinView(
                                iconName: act.activitySport.sportLogo, // selon ton modèle
                                count: "\(act.activityPlayers)",
                                color: Color.orange  // valeur par défaut pour éviter le type-check complexe
                            )
                        }
                    }
                    .annotationTitles(.hidden)
                }
            
            }
            .mapStyle(.standard(elevation: .realistic))
            .cornerRadius(22)
            .clipped()
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            
            // Dégradé
            LinearGradient(
                colors: [.clear, .black.opacity(1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 120)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .allowsHitTesting(false)
            
            // Chargement
            if isLoading {
                ProgressView("Géolocalisation...")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .padding(32)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
            }
        }
        .task { await loadCoordinates() }
        .onChange(of: activities) { _, _ in Task { await loadCoordinates() } }
    }
    
    //  Chargement asynchrone
    private func loadCoordinates() async {
        guard !activities.isEmpty else {
            await MainActor.run {
                annotations = []
                isLoading = false
            }
            return
        }
        
        await MainActor.run { isLoading = true }
        var newAnnotations: [ActivityAnnotation] = []
        
        for (index, activity) in activities.enumerated() {
            let coord: CLLocationCoordinate2D
            
            if isPreview {
                coord = CLLocationCoordinate2D(
                    latitude: 50.6292 + Double(index) * 0.002,
                    longitude: 3.0573 + Double(index) * 0.002
                )
            } else {
                // 1) lire l'adresse sur le MainActor
                let address = await MainActor.run { activity.activityLocation }
                
                // 2) géocoder (opération asynchrone sûre hors du modèle)
                if let fetched = try? await CLGeocoder().geocodeAddressString(address).first?.location?.coordinate {
                    coord = fetched
                } else {
                    coord = CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667)
                }
            }
            
            newAnnotations.append(ActivityAnnotation(activity: activity, coordinate: coord))
        }
        
        await MainActor.run {
            annotations = newAnnotations
            isLoading = false
        }
    }
}

    
    // Choix des icônes, à supprimer ?
    private func sportIcon(for sport: String) -> String {
        switch sport.lowercased() {
        case "basketball": return "basketball.fill"
        case "tennis": return "tennisball.fill"
        case "Musculation": return "dumbbell.fill"
        case "football": return "soccerball"
        case "course à pied": return "figure.run"
        case "volley": return "volleyball.fill"
        case "Rugby": return "rugbyball.fill"
        case "Skateboard": return "skateboard.fill"
        case "Randonnée": return "figure.hiking"
        default: return "questionmark.circle"
        }
    }




import Foundation

@Observable
final class ActivityAnnotation: Identifiable {
    let id = UUID()
    let activity: Activity
    var coordinate: CLLocationCoordinate2D
    
    init(activity: Activity, coordinate: CLLocationCoordinate2D) {
        self.activity = activity
        self.coordinate = coordinate
    }
}


