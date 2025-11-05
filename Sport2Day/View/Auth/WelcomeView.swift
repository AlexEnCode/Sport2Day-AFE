// création welcome view matito
// création welcome view matito

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("connection")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        Text("BIENVENUE")
                            .font(.custom("BebasNeue-Regular", size: 48))
                            .foregroundColor(Color.whitePrimary)
                        Text("🔥")
                            .font(.system(size: 36))
                    }
                    
                    VStack (spacing:20) {
                        Text("Tu as déjà un compte ?")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color(.whitePrimary))
                        // a relier avec page connexion
                        NavigationLink {
                            LoginView()
                        } label : {
                            Text("Connexion")
                                .font(.system(size: 18, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orangePrimary)
                                .foregroundColor(.whitePrimary)
                                .cornerRadius(8)
                        }
                        .frame(width:250)
                        
                        HStack {
                            Rectangle()
                                .fill(Color.whitePrimary)
                                .frame(height: 1)
                            Text("ou")
                                .foregroundStyle(Color(.whitePrimary))
                                .font(.system(size: 24, weight: .medium))
                            Rectangle()
                                .fill(Color.whitePrimary)
                                .frame(height: 1)
                        }
                        .frame(width: 100)
                        // a relier avec page Inscription
                        NavigationLink {
                            RegisterView()
                        } label : {
                            Text("Inscription")
                                .font(.system(size: 18, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.orangePrimary, lineWidth: 2)
                                )
                                .foregroundStyle(Color(.orangePrimary))
                        }
                        .frame(width:250)
                        
                        Text("Inscris-toi et rejoins l’aventure !")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color(.whitePrimary))
                    }
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    WelcomeView()
}
