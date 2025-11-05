// [Emilie]

import SwiftUI

struct RulesPopUpView: View {
    
    var body: some View{
        
        // À FAIRE : Bouton back -> activityInfoView
        // À FAIRE : Bouton Accepter -> userBookedActivityView OU userCreatedActivityView
        
        
        ZStack{
            
            Color(.bluePrimary)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.containerGray)
                .frame(width: 370, height: 700)
            
            VStack{
                HStack {
                    Text("🛡️RÈGLEMENT DE SPORT")
                        .font(.custom("BebasNeue-Regular", size : 24))
                    Text("2")
                        .foregroundColor(.orangePrimary)
                        .padding(.horizontal, -8)
                    Text("DAY")
                        .padding(.horizontal, -6)
                }
                .font(.custom("BebasNeue-Regular", size : 24))
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                Text("Pour garantir une expérience positive à tous, chaque utilisateur s'engage à respecter les règles suivantes :")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.white)
                
                    .padding(.vertical, 8)
                
                VStack(alignment:.leading) {
                    
                    Group {
                        Text("Respect avant tout")
                            .foregroundColor(.orangePrimary)
                            .fontWeight(.bold)
                            .underline()
                            .padding(.top, 4)
                        
                        Text("Traitez les autres avec courtoisie, quelles que soient leur genre, leurs origines, opinions ou niveaux sportifs.")
                        
                    }
                    
                    Group{
                        Text("Bienveillance obligatoire")
                            .foregroundColor(.orangePrimary)
                            .fontWeight(.bold)
                            .underline()
                            .padding(.top, 4)
                        
                        Text("Encouragez, soutenez, partagez. L'esprit d'équipe et la bonne humeur sont au cœur de l'application.")
                    }
                    
                    Group {
                        Text("Sécurité pour chacun")
                            .foregroundColor(.orangePrimary)
                            .fontWeight(.bold)
                            .underline()
                            .padding(.top, 4)
                        
                        Text("Chaque personne, peu importe son origine, son genre, ses opinions ou son niveau sportif, doit avoir sa sécurité garantie. Dans le cas contraire, parlez nous-en.")
                        
                    }
                    
                    Group {
                        Text("Pas d'utilisation détournée")
                            .foregroundColor(.orangePrimary)
                            .fontWeight(.bold)
                            .underline()
                            .padding(.top, 4)
                        
                        Text("Cette application n’est pas un site de rencontres amoureuses. Merci de respecter cet esprit.")
                        
                    }
                    
                    Group {
                        Text("PJeu équitable, lieu sûr")
                            .foregroundColor(.orangePrimary)
                            .fontWeight(.bold)
                            .underline()
                            .padding(.top, 4)
                        
                        Text("Respectez les règles des sports pratiqués, les lieux utilisés et les autres participants.")
                    }
                    
                }
                .font(.footnote)
                .foregroundColor(.white)
                
                
                HStack(alignment: .top, spacing: 8){
                    Text("📌")
                        .font(.title2)
                    
                    VStack (alignment: .leading, spacing: 4){
                        Text("Le non-respect de ces règles pourra entraîner la  ")
                        HStack{
                            Text("suspension")
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                            Text("ou le")
                            Text("bannissement")
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                            Text("de Sport2Day.")
                        }
                    }
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth : .infinity, alignment: .leading)
                }
                .foregroundColor(.white)
                .font(.footnote)
                .padding(.top,24)
                
                HStack{
                    Text("🤝")
                        .font(.title2)
                    
                    Text("Merci de faire de cette communauté un espace sain et inclusif 🤍.")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth : .infinity, alignment: .leading)
                    
                }
                .foregroundColor(.white)
                .font(.footnote)
                .padding(.top,4)
                
                
                // Créer la navigation pour aller vers : UserBookedActivityView ou  UserCreatedActivity (à créer) selon le cas.
                Button(action: {
                    
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 200, height: 50)
                            .foregroundColor(.orangePrimary)
                        Text("Accepter")
                            .fontWeight(.bold)
                    }
                    .padding(.top, 24)
                }
            }
            
            .frame(width: 340)
            
        }
    }
}

#Preview {
    RulesPopUpView()
}
