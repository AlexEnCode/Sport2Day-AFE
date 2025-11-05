import SwiftUI
import SwiftData

struct LoginView: View {
    
    // Connexion au modèle SwiftData
    // @Environment(\.modelContext) permet d’accéder au contexte de données (lecture/écriture)
    @Environment(\.modelContext) private var context
    
    // @Query permet de récupérer automatiquement les objets User du modèle SwiftData
    @Query private var users: [User]
    
    // États internes du formulaire
    @State private var userMail: String = ""
    @State private var userPassword: String = ""
    @State private var showPassword: Bool = false
    
    // Gestion des erreurs et affichage d’alerte
    @State private var formErrorMessage: String = ""
    @State private var showErrorAlert: Bool = false
    
    // Fonction de validation du formulaire
    func validateForm() -> Bool {
        // Vérifie que les champs ne sont pas vides
        if userMail.isEmpty || userPassword.isEmpty {
            formErrorMessage = "Veuillez remplir tous les champs."
            return false
        }
        
        // Vérifie la longueur minimale du mot de passe
        if userPassword.count < 6 {
            formErrorMessage = "Votre mot de passe doit contenir au moins 6 caractères."
            return false
        }
        
        // Vérifie la validité de l’e-mail avec une expression régulière
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        if !userMail.matches(emailRegex) {
            formErrorMessage = "L’adresse e-mail n’est pas valide."
            return false
        }
        
        // Si tout est bon, on retourne true
        return true
    }
    
    // Vérification des identifiants utilisateur
    func checkUserCredentials() -> Bool {
        do {
            // Création d’un descripteur de recherche pour récupérer tous les utilisateurs
            let descriptor = FetchDescriptor<User>()
            let allUsers = try context.fetch(descriptor)
            
            // Vérifie si un utilisateur correspond à l’e-mail et au mot de passe saisis
            if let _ = allUsers.first(where: {
                $0.userMail.lowercased() == userMail.lowercased() &&
                $0.userPassword == userPassword
            }) {
                // Identifiants corrects
                return true
            } else {
                // Identifiants incorrects
                formErrorMessage = "E-mail ou mot de passe incorrect."
                return false
            }
        } catch {
            // Gestion d’une éventuelle erreur de lecture du contexte
            formErrorMessage = "Erreur interne. Impossible de vérifier les identifiants."
            return false
        }
    }

    // Corps principal de la vue
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Arrière-plan coloré
                Color.bluePrimary
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Titre principal
                    Text("Connexion")
                        .font(.largeTitle.bold())
                        .foregroundColor(.whitePrimary)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    // Champ de saisie pour l’e-mail
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.system(size: 14, weight: .bold))
                        
                        TextField("", text: $userMail, prompt: Text("Remplir").foregroundColor(.gray))
                            // Empêche la majuscule automatique
                            .autocapitalization(.none)
                            // Affiche un clavier adapté aux e-mails
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.containerGray)
                            .cornerRadius(8)
                    }
                    
                    // Champ de saisie pour le mot de passe
                    VStack(alignment: .leading) {
                        Text("Mot de passe")
                            .font(.system(size: 14, weight: .bold))
                        
                        HStack {
                            // Condition : afficher ou masquer le mot de passe
                            Group {
                                if showPassword {
                                    TextField("Remplir", text: $userPassword)
                                } else {
                                    SecureField("Remplir", text: $userPassword)
                                }
                            }
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            
                            // Bouton pour basculer l’affichage du mot de passe
                            Button(action: { showPassword.toggle() }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.containerGray)
                        .cornerRadius(8)
                    }
                    
                    // Bouton "Mot de passe oublié"
                    HStack {
                        Spacer()
                        Button("Mot de passe oublié ?") {
                            // Action future : rediriger vers la page de récupération
                        }
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.orangePrimary)
                    }
                    
                    // Bouton principal de connexion
                    Button("Se connecter") {
                        // Étape 1 : Validation du formulaire
                        if validateForm() {
                            // Étape 2 : Vérification des identifiants
                            if checkUserCredentials() {
                                print("Connexion réussie")
                                // Redirection possible vers une page d’accueil ici
                            } else {
                                // Affiche l’erreur si identifiants invalides
                                showErrorAlert = true
                            }
                        } else {
                            // Affiche l’erreur si validation échoue
                            showErrorAlert = true
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 52)
                    .background(Color.orangePrimary)
                    .cornerRadius(12)
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.white)
                    // Alerte d’erreur
                    .alert("Erreur", isPresented: $showErrorAlert) {
                        Button("OK", role: .cancel) {}
                    } message: {
                        Text(formErrorMessage)
                    }
                    
                    Spacer()
                    
                    // Lien vers l’inscription
                    HStack {
                        Text("Pas encore membre ?")
                            .foregroundColor(.whitePrimary)
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("S’inscrire")
                                .foregroundColor(.orangePrimary)
                        }
                    }
                    .font(.system(size: 14, weight: .bold))
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 30)
                .foregroundColor(.whitePrimary)
            }
        }
    }
}

#Preview {
    LoginView()
}
