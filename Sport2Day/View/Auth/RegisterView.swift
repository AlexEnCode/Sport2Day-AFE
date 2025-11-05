import SwiftUI
import SwiftData

// Regex Helper
extension String {
    func matches(_ regex: String) -> Bool {
        self.range(of: regex, options: .regularExpression) != nil
    }
}

struct RegisterView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    // Champs utilisateur
    @State private var userName: String = ""
    @State private var selectedGender: GenderType? = nil
    @State private var userLocation: String = ""
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var userConfirmPassword: String = ""
    @State private var userDescription: String = ""
    @State private var userHandi: Bool = false
    @State private var showPassword: Bool = false
    @State private var selectedMindsets: [MindsetType] = []
    
    // Gestion des erreurs
    @State private var formErrorMessage: String = ""
    @State private var showErrorAlert: Bool = false
    
    // Validation du formulaire
    private func validateForm() -> Bool {
        guard !userName.isEmpty,
              !userLocation.isEmpty,
              !userEmail.isEmpty,
              !userPassword.isEmpty,
              !userConfirmPassword.isEmpty,
              !userDescription.isEmpty else {
            formErrorMessage = "Veuillez remplir tous les champs obligatoires."
            return false
        }
        
        guard selectedGender != nil else {
            formErrorMessage = "Veuillez sélectionner un genre."
            return false
        }
        
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        guard userEmail.matches(emailRegex) else {
            formErrorMessage = "L'adresse e-mail n’est pas valide."
            return false
        }
        
        guard userPassword == userConfirmPassword else {
            formErrorMessage = "Les mots de passe ne correspondent pas."
            return false
        }
        
        guard userPassword.count >= 6 else {
            formErrorMessage = "Le mot de passe doit contenir au moins 6 caractères."
            return false
        }
        
        guard selectedMindsets.count == 3 else {
            formErrorMessage = "Veuillez sélectionner 3 mindsets."
            return false
        }
        
        return true
    }
    
    //  Vue principale
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bluePrimary.ignoresSafeArea()
                    .allowsHitTesting(false)
                
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Inscription")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        
                       
                        inputField(title: "Pseudo", text: $userName)
                        
                        // M Genre
                        VStack(alignment: .leading) {
                            Text("Genre")
                                .font(.system(size: 14, weight: .bold))
                            Menu {
                                ForEach(GenderType.allCases, id: \.self) { gender in
                                    Button(gender.rawValue) {
                                        selectedGender = gender
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedGender?.rawValue ?? "Sélectionner")
                                        .foregroundColor(selectedGender == nil ? .gray : .white)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                }
                                .padding()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.containerGray)
                                .cornerRadius(8)
                            }
                        }
                        
                        inputField(title: "Ville", text: $userLocation)
                        
                        inputField(title: "Email", text: $userEmail)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        passwordField(title: "Mot de passe", text: $userPassword)
                        
                        passwordField(title: "Confirmation mot de passe", text: $userConfirmPassword)
                        
                        VStack(alignment: .leading) {
                            Text("Mindset (3 max)")
                                .font(.system(size: 14, weight: .bold))
                            
                            Menu("Sélectionner vos mindsets (\(selectedMindsets.count)/3)") {
                                ForEach(MindsetType.allCases, id: \.self) { mindset in
                                    Button {
                                        if selectedMindsets.contains(mindset) {
                                            selectedMindsets.removeAll { $0 == mindset }
                                        } else if selectedMindsets.count < 3 {
                                            selectedMindsets.append(mindset)
                                        }
                                    } label: {
                                        HStack {
                                            Text(mindset.rawValue)
                                            Spacer()
                                            if selectedMindsets.contains(mindset) {
                                                Image(systemName: "checkmark")
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.containerGray)
                            .cornerRadius(8)
                        }
                        
                       
                        VStack(alignment: .leading) {
                            Text("À propos de vous")
                                .font(.system(size: 14, weight: .bold))
                            TextEditor(text: $userDescription)
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(10)
                                .background(Color.containerGray)
                                .cornerRadius(8)
                        }
                        
                        Toggle("Êtes-vous en situation de handicap ?", isOn: $userHandi)
                            .font(.system(size: 14, weight: .bold))
                            .tint(.orange)
                            .padding(.vertical, 5)
                        
                        // MBouton S’inscrire
                        Button {
                            if validateForm() {
                                let newUser = User(
                                    name: userName,
                                    email: userEmail,
                                    password: userPassword,
                                    location: userLocation,
                                    description: userDescription,
                                    photo: "" // à compléter plus tard si tu ajoutes l’upload photo
                                )
                                context.insert(newUser)
                                try? context.save()
                                print("✅ Nouvel utilisateur créé : \(newUser.userName)")
                                dismiss()
                            } else {
                                showErrorAlert = true
                            }
                        } label: {
                            Text("S’inscrire")
                                .font(.system(size: 18, weight: .black))
                                .frame(maxWidth: .infinity, maxHeight: 52)
                                .background(Color.orangePrimary)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .alert("Erreur", isPresented: $showErrorAlert) {
                            Button("OK", role: .cancel) {}
                        } message: {
                            Text(formErrorMessage)
                        }
                        
                        //  Lien vers Connexion
                        HStack {
                            Text("Déjà membre ?")
                                .foregroundColor(.white)
                            NavigationLink("Se connecter", destination: LoginView())
                                .foregroundColor(.orangePrimary)
                        }
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 15)
                    }
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    // Sous-vues réutilisables
    @ViewBuilder
    private func inputField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
            TextField("Remplir", text: text)
                .padding()
                .background(Color.containerGray)
                .cornerRadius(8)
        }
    }
    
    @ViewBuilder
    private func passwordField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
            HStack {
                if showPassword {
                    TextField("Remplir", text: text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    SecureField("Remplir", text: text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.containerGray)
            .cornerRadius(8)
        }
    }
}

#Preview {
    RegisterView()
        .preferredColorScheme(.dark)
}
