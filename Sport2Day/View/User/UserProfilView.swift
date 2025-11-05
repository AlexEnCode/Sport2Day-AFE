import SwiftUI

struct UserProfilView: View {
    
    var body: some View {
        
        NavigationStack {
            
            
            
            ZStack {
                
                Color(.bluePrimary)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.white, lineWidth: 2)
                                .foregroundColor(.bluePrimary)
                                .frame(width: 340, height : 360)
                            
                            // GENRE
                                .overlay(
                                    VStack(spacing: 4) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius : 8)
                                                .fill(Color.white)
                                                .frame(width: 50, height : 50)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8) .stroke(Color.white, lineWidth : 2))
                                            
                                            Image("queerGenderDark")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40)
                                            
                                        }
                                        //                                if let gender = user.userGender {
                                        //                                    Text(gender.genderName.uppercased())
                                        //                                        .foregroundColor(.white)
                                        //                                        .font(.caption)
                                        //                                        .fontWeight(.bold)
                                        //                                } else {
                                        //                                    Text("INCONNU")
                                        //                                        .foregroundColor(.gray)
                                        //                                        .font(.caption)
                                        //                                }
                                    }
                                        .frame(width: 80, height: 80)
                                        .padding(.trailing, -35)
                                        .padding(.top, 120),
                                    alignment : .topTrailing
                                )
                            
                            // NOM PROFIL
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.orangePrimary)
                                            .frame(width : 200, height : 60)
                                        Text("ERIKA")
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                                        .padding(.top, -30),
                                    alignment : .top
                                )
                            // PHOTO
                            VStack {
                                Spacer()
                                Image("erika")
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth : 1)
                                    )
                                
                                // BIO
                                Text("Elle / She / Her 🌈  \n🏀Pro | Inter⚽")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .italic()
                                    .padding(.top, 16)
                                
                                Spacer()
                                
                            }
                            .frame(width: 400, height: 360)
                            
                            // MINDSET
                            VStack{
                                HStack(spacing: 12) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("FAIRPLAY")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("INCLUSIVE")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("COMPÉTITIVE")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                }
                                .frame(height: 30)
                                .padding(.top, 360 - 15)
                            }
                        }
                        // STATS
                        VStack {
                            Text("Mes Stats")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding(.top)
                        .padding(.horizontal, 8)
                        
                        // BADGE ORGANISATION
                        HStack(spacing: 30){
                            VStack(alignment: .center, spacing: 4) {
                                Image("legendBadge")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("LÉGENDE")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Organisation de \n 23 activités")
                                    .foregroundStyle(.white)
                                    .font(.callout)
                                    .italic()
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 4)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.legendPurple, lineWidth: 2)
                                    .frame(width: 160, height : 160)
                                    .padding()
                            )
                            .padding()
                            
                            // BADGE PARTICIPATION:
                            VStack(alignment: .center, spacing: 4) {
                                Image("badgeCoach")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("COACH")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Participation à \n 17 activités")
                                    .foregroundStyle(.white)
                                    .font(.callout)
                                    .italic()
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 4)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.coachBlue, lineWidth: 2)
                                    .frame(width: 160, height : 160)
                                    .padding()
                            )
                        }
                        
                        // SPORT PRATIQUÉ 1
                        
                        VStack(alignment: .leading) {
                            Text("Sports pratiqués")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.containerGray)
                                    .frame(width: 350, height: 80)
                                HStack(spacing: 16) {
                                    Image(systemName:"basketball.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                    Text("25 évènements effectués")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding(.top)
                        
                        // SPORT PRATIQUÉ 2
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.containerGray)
                                .frame(width: 350, height: 80)
                            HStack(spacing: 16) {
                                Image(systemName:"soccerball.inverse")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                Text("12 évènements effectués")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 4)
                        
                        // SPORT PRATIQUÉ 3
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.containerGray)
                                .frame(width: 350, height: 80)
                            HStack(spacing: 16) {
                                Image(systemName:"figure.run")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                Text(" 3 évènements effectués")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 4)
                    }
                    .padding(.top)
                    
                }
            }
// MODIFIER PROFIL:
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination : UserModifyView()) {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfilView()
}
