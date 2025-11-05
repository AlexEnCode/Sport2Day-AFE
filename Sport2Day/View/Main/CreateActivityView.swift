// [Emilie: A faire : 1. Changer destination bouton Ajouter > CreatedActivityView ou MapView / 2. Lier MapKit à la recherche d'adresse / 3. Ajouter les observables]
// [Alex] 01/10 Form remis en page, non fonctionelle
// [Alex] 03/11 Form bindé, Model mis à jour, ne cré pas d'objet
// [Alex] 04/11 Ca marche. Pas touche.
// CreateActivityView.swift
// CreateActivityView.swift


// CreateActivityView.swift
import SwiftUI
import SwiftData

struct CreateActivityView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \User.userName) private var users: [User]
    
    private var currentUser: User {
        users.first ?? {
            let temp = User(
                name: "Utilisateur Test",
                email: "test@example.com",
                password: "123",
                location: "Lille",
                description: "",
                photo: ""
            )
            context.insert(temp)
            try? context.save()
            return temp
        }()
    }
    
    // MARK: - États
    @State private var selectedDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date().addingTimeInterval(3600)
    @State private var locationText = ""
    @State private var selectedLevel: LevelType = .novice
    @State private var selectedAccessibility: Set<String> = []
    @State private var selectedSport: SportType = .basketball  // UN SEUL SPORT
    @State private var descriptionText = ""
    @State private var participantValue: Double = 8
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    private let sports: [SportType] = [
        .basketball, .tennis, .musculation, .volleyball,
        .football, .course, .randonnee, .rugby,
        .skateboard, .autre
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Ajouter une activité")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 8)
                    
                    // SPORT - UN SEUL
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sport").foregroundColor(.white).fontWeight(.semibold)
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 5), spacing: 12) {
                            ForEach(sports, id: \.self) { sport in
                                SportButton(
                                    icon: sport.icon,
                                    title: sport.displayName,
                                    isSelected: selectedSport == sport
                                ) {
                                    selectedSport = sport  // meh
                                }
                            }
                        }
                        .frame(maxHeight: 140)
                    }
                    
                    // DATE
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Date").foregroundColor(.white).fontWeight(.semibold)
                        HStack {
                            Text("Date sélectionnée").foregroundColor(.white.opacity(0.7))
                            Spacer()
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .colorScheme(.dark)
                        }
                        .padding()
                        .background(Color.containerGray)
                        .cornerRadius(10)
                    }
                    
                    // HORAIRE
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Horaire").foregroundColor(.white).fontWeight(.semibold)
                        HStack(spacing: 12) {
                            DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .colorScheme(.dark)
                                .frame(maxWidth: .infinity)
                            Text(":").foregroundColor(.white).font(.title2.bold())
                            DatePicker("", selection: $endTime, in: startTime..., displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .colorScheme(.dark)
                                .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.containerGray)
                        .cornerRadius(10)
                    }
                    
                    // LIEU
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Lieu").foregroundColor(.white).fontWeight(.semibold)
                        HStack {
                            Image(systemName: "magnifyingglass").foregroundColor(.white.opacity(0.8))
                            TextField("Saisir une adresse", text: $locationText)
                                .foregroundColor(.white)
                                .textFieldStyle(.plain)
                                .submitLabel(.done)
                        }
                        .padding()
                        .background(Color.containerGray)
                        .cornerRadius(12)
                    }
                    
                    // NIVEAU - TOUT EN JAUNE
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Niveau").foregroundColor(.white).fontWeight(.semibold)
                        HStack(spacing: 14) {
                            ForEach(LevelType.allCases) { level in
                                LevelButton(
                                    title: level.displayName,
                                    color: level.color,
                                    isSelected: selectedLevel == level
                                ) {
                                    selectedLevel = level
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    
                    // ACCESSIBILITÉ
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Accessibilité").foregroundColor(.white).fontWeight(.semibold)
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 4), spacing: 12) {
                            ForEach(["HANDICAP", "FEMMES", "HOMMES", "QUEERS"], id: \.self) { option in
                                AccessibilityButton(
                                    option: option,
                                    isSelected: selectedAccessibility.contains(option)
                                ) {
                                    toggle(&selectedAccessibility, option)
                                }
                            }
                        }
                    }
                    
                    // DESCRIPTION
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Description").foregroundColor(.white).fontWeight(.semibold)
                        TextEditor(text: $descriptionText)
                            .scrollContentBackground(.hidden)
                            .foregroundColor(.white)
                            .padding(8)
                            .frame(height: 100)
                            .background(Color.containerGray)
                            .cornerRadius(12)
                            .overlay(
                                Group {
                                    if descriptionText.isEmpty {
                                        Text("Décrivez votre activité...")
                                            .foregroundColor(.white.opacity(0.4))
                                            .padding(12)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            )
                    }
                    
                    // PARTICIPANTS
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Nombre de joueurs").foregroundColor(.white).fontWeight(.semibold)
                            Spacer()
                            Text("\(Int(participantValue))").foregroundColor(.white).font(.headline)
                        }
                        Slider(value: $participantValue, in: 1...15, step: 1).tint(.orangePrimary)
                    }
                    
                    // BOUTON AJOUTER
                    Button {
                        createActivity()
                    } label: {
                        Text("Ajouter")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.orangePrimary)
                            .cornerRadius(18)
                            .shadow(color: .black.opacity(0.3), radius: 6)
                    }
                    .padding(.top, 12)
                }
                .padding()
            }
            .background(Color.bluePrimary.ignoresSafeArea())
            .alert("Erreur", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    //  Fonctions
    private func toggle(_ set: inout Set<String>, _ value: String) {
        if set.contains(value) {
            set.remove(value)
        } else {
            set.insert(value)
        }
    }
    
    private func showValidationError(_ message: String) {
        alertMessage = message
        showAlert = true
    }
    
    private func createActivity() {
        guard !locationText.trimmingCharacters(in: .whitespaces).isEmpty else {
            showValidationError("Veuillez saisir un lieu.")
            return
        }
        guard startTime < endTime else {
            showValidationError("L'heure de début doit être avant l'heure de fin.")
            return
        }
        guard !descriptionText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            showValidationError("Veuillez décrire votre activité.")
            return
        }
        
        let allowedGenders: Set<GenderType> = Set(selectedAccessibility.compactMap { name in
            switch name {
            case "HOMMES": return .homme
            case "FEMMES": return .femme
            case "QUEERS": return .queer
            default: return nil
            }
        })
        
        let finalGender: GenderType = allowedGenders.isEmpty ? .tous : allowedGenders.first!
        let isHandi = selectedAccessibility.contains("HANDICAP")
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: startTime)
        let finalDate = calendar.date(byAdding: timeComponents, to: calendar.date(from: dateComponents)!)!
        
        let newActivity = Activity(
            activityOrganizer: currentUser,
            activityLocation: locationText,
            activitySport: Sport(
                sportName: selectedSport.displayName,
                sportLogo: selectedSport.icon,
                sportLevel: levelData.first ?? Level(levelName: "Débutant", levelColor: "green")
            ),
            dateString: {
                let df = DateFormatter()
                df.dateFormat = "dd-MM-yyyy"
                return df.string(from: selectedDate)
            }(),
            activityStartTime: {
                let comp = Calendar.current.dateComponents([.hour, .minute], from: startTime)
                return (comp.hour ?? 0) * 100 + (comp.minute ?? 0)
            }(),
            activityEndTime: {
                let comp = Calendar.current.dateComponents([.hour, .minute], from: endTime)
                return (comp.hour ?? 0) * 100 + (comp.minute ?? 0)
            }(),
            activityGenders: genderData.first(where: { $0.genderName == "Tous" })
                ?? Gender(genderName: "Tous", genderLogo: ""),
            activityHandi: selectedAccessibility.contains("HANDICAP"),
            activityLevel: levelData.first(where: { $0.levelName == selectedLevel.displayName })
                ?? Level(levelName: selectedLevel.displayName, levelColor: "yellow"),
            activityDescription: descriptionText,
            activityPlayers: Int(participantValue)
        )

        
        context.insert(newActivity)
        
        do {
            try context.save()
            NotificationCenter.default.post(name: .activityCreated, object: nil)
            dismiss()
        } catch {
            print("Erreur sauvegarde: \(error)")
            showValidationError("Erreur lors de la sauvegarde.")
        }
    }
}




struct SportButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.caption2)
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 60)
            .background(isSelected ? Color.white.opacity(0.25) : Color.containerGray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? .white : Color.clear, lineWidth: 2)  
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LevelButton: View {
    let title: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
           Button(action: action) {
               Text(title)
                   .font(.caption.bold())
                   .foregroundColor(isSelected ? color : .white)
                   .frame(maxWidth: .infinity)
                   .padding(10)
                   .background(
                       isSelected
                           ? color.opacity(0.25)  // Fond coloré + transparence
                           : Color.clear
                   )
                   .overlay(
                       RoundedRectangle(cornerRadius: 12)
                           .stroke(color, lineWidth: 1.5)
                   )
                   .cornerRadius(12)
           }
           .buttonStyle(PlainButtonStyle())
       }
   }




struct AccessibilityButton: View {
    let option: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(assetName(for: option))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white) // Toujours blanc
                
                Text(option)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 60)
            .background(isSelected ? Color.white.opacity(0.25) : Color.containerGray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? .white : Color.gray.opacity(0.4), lineWidth: 1.5) // BORD BLANC
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func assetName(for option: String) -> String {
        switch option {
        case "HANDICAP", "HANDI": return "wheelchairWhite"
        case "FEMMES":           return "femaleWhite"
        case "HOMMES":           return "maleWhite"
        case "QUEERS":           return "queerGenderWhite"
        default:                 return "questionmark"
        }
    }
}

//  Notification (une seule fois !)
extension Notification.Name {
    static let activityCreated = Notification.Name("activityCreated")
}





private let levelColors: [LevelType: Color] = [
    .novice: Color("noviceGreen"),
    .inter: Color("interPurple"),
    .pro: Color("proBlue"),
    .all: Color("allYellow")
]
