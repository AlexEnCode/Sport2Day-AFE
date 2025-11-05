import SwiftUI

struct UserModifyView: View {
    
    // Liste des niveaux
    var levelData = [
        Level(levelName: "Professionnel", levelColor: ""),
        Level(levelName: "Intermédiaire", levelColor: ""),
        Level(levelName: "Novice", levelColor: "")
    ]
    
    // États internes pour formulaire
    @State private var selectedLevel: String = "Intermédiaire"
    @State private var bio: String = "Elle/She/Her 🌈  \n🏀 Pro|Inter ⚽"
    @State private var userHandi: Bool = false
    
    var body: some View {
        ZStack {
            
            // Fond bleu
            Color.bluePrimary
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 25) {
                    
                    // Icone fermeture
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                    }
                    
                    // Photo de profil
                    VStack(spacing: 10) {
                        Image("erika")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.whitePrimary, lineWidth: 3)
                            )
                            .shadow(radius: 5)
                        
                        // Bouton modifier photo
                        OrangeButton(title: "Modifier") {
                            // Action modification photo
                        }

                    }
                    
                    // Pseudo
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            
                            Text("Pseudo")
                                .font(.system(size: 14))
                                .bold()
                            
                            Spacer()
                            
                            // Bouton modifier pseudo
                            OrangeButton(title: "Modifier") {
                                // Action modification pseudo
                            }
                            
                        }
                        
                        Text("Erika")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                    }
                    
                    // Pseudo
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            
                            Text("Ville")
                                .font(.system(size: 14))
                                .bold()
                            
                            Spacer()
                            
                            // Bouton modifier ville
                            OrangeButton(title: "Modifier") {
                                // Action modification ville
                            }
                            
                        }
                        
                        Text("Lille")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                    }
                    
                    // Email
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            
                            Text("Adresse e-mail")
                                .font(.system(size: 14))
                                .bold()
                            
                            Spacer()
                            
                            // Bouton modifier email
                            OrangeButton(title: "Modifier") {
                                // Action modification email
                            }
                        }
                        
                        Text("erika76@gmail.com")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                    }
                    
                    // Nouveau mot de passe
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nouveau mot de passe")
                                .font(.system(size: 14))
                                .bold()
                            
                            Text("* * * * * *")
                        }
                        Spacer()
                    }
                    
                    // Confirmation du mot de passe
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Confirmer le mot de passe")
                                .font(.system(size: 14))
                                .bold()
                            
                            Text("* * * * * *")
                        }
                        Spacer()
                    }
                    
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        // Accessibilité
                        Text("Accessibilité")
                            .font(.system(size: 14))
                            .bold()
                        
                            HStack {
                                // Fauteuil roulant
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.bluePrimary)
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.interPurple, lineWidth: 2)
                                            )
                                    
                                    Image("wheelchairWhite")
                                }
                                .padding(.trailing, 20)
                                
                                
                                // Homme
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.bluePrimary)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.interPurple, lineWidth: 2)
                                        )
                                    
                                    Image("maleWhite")
                                }
                                .padding(.trailing, 20)

                                
                                // Femme
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.bluePrimary)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.interPurple, lineWidth: 2)
                                        )
                                    
                                    Image("femaleWhite")
                                }
                                .padding(.trailing, 20)

                                
                                // Queers
                                ZStack {
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    
                                    Image("queerGenderDark")
                                }
                                
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
                                .padding(.leading, 15)
                            }
                    }
                        
                        .padding(.top, 5)
                        
                        // Niveau (menu déroulant)
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Niveau")
                                .font(.system(size: 14))
                                .bold()
                            
                            Picker("Choisir un niveau", selection: $selectedLevel) {
                                ForEach(levelData, id: \.levelName) {
                                    level in
                                    Text(level.levelName)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.whitePrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .background(.containerGray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.interPurple, lineWidth: 2)
                            )
                            
                            
                        }
                        
                        // État d’esprit
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                
                                Text("État d’esprit")
                                    .font(.system(size: 14))
                                    .bold()
                                
                                Spacer()
                                
                                // Bouton modifier pseudo
                                OrangeButton(title: "Modifier") {
                                    // Action modification pseudo
                                }
                                
                            }
                            
                            HStack {
                                // fair play
                                ZStack {
                                    Rectangle()
                                        .frame(width: 80, height: 40)
                                        .cornerRadius(8)
                                    
                                    Text("FAIR PLAY")
                                        .font(.custom("BebasNeue-Regular", size: 16))                                    .foregroundColor(.bluePrimary)
                                }
                                
                                Spacer()
                                
                                // Inclusive
                                ZStack {
                                    Rectangle()
                                        .frame(width: 80, height: 40)
                                        .cornerRadius(8)
                                    
                                    Text("INCLUSIVE")
                                        .font(.custom("BebasNeue-Regular", size: 16))                                    .foregroundColor(.bluePrimary)
                                }
                                
                                Spacer()
                                
                                // Compétitive
                                ZStack {
                                    Rectangle()
                                        .frame(width: 80, height: 40)
                                        .cornerRadius(8)
                                    
                                    Text("COMPÉTITIVE")
                                        .font(.custom("BebasNeue-Regular", size: 16))                                    .foregroundColor(.bluePrimary)
                                }
                            }
                            .padding(.top, 5)
                            
                        }
                        
                        // Bio
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Bio")
                                .font(.system(size: 14))
                                .bold()
                            
                            TextEditor(text: $bio)
                            // cache le fond blanc par défaut
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(5)
                                .background(.containerGray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.interPurple, lineWidth: 2)
                                )
                        }
                        
                        // Handicape
                        Toggle("Êtes vous en situation de handicap ?", isOn: $userHandi)
                            .font(.system(size: 14))
                            .bold()
                            .padding(.vertical, 5)
                        
                        Spacer()
                    
                    // Bouton valider
                    Button {
                        
                        // Action
                        
                    } label : {
                        Text("Valider")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 52)
                    .padding()
                    .background(.orangePrimary)
                    .cornerRadius(12)
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.white)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            }
        }
    }
}

// Extraction de vue pour bouton
struct OrangeButton: View {
    var title: String = "Modifier"
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12))
                .bold()
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .foregroundColor(.orangePrimary)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.orangePrimary, lineWidth: 1)
                )
        }
    }
}

#Preview {
    UserModifyView()
}
