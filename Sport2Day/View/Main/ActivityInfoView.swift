// A RAJOUTER LA NAVIGATION EN ARRIERE ET APRES BOUTON PARTICIPER

import SwiftUI

struct ActivityInfoView: View {
    
    let participants = ["erika","julie","carlos","emma","antony"]
    let couleurCercle = [Color.proBlue,Color.amatorBronze,Color.noviceGreen]
    
    var activity : Activity
//    let fulluser : [User]
    
    private var formattedDate: String {
        if let date = activity.activityDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: date)
        } else {
            return activity.dateString
        }
    }
    private var formattedTime: String {
        let hours = activity.activityStartTime / 100
        let minutes = activity.activityStartTime % 100
        return String(format: "%02dh%02d", hours, minutes)
    }
    
    var body: some View {
        ZStack {
            Color("bluePrimary")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                HStack {
                    Image(systemName: activity.activitySport.sportLogo)
                        .font(.system(size: 40))
                        .foregroundColor(.whitePrimary)
                    
                    Text(activity.activitySport.sportName)
                        .font(.custom("BebasNeue-Regular", size: 48))
                        .foregroundColor(.whitePrimary)
                    
                    Spacer()
                    
                    Button(action: {
                        // Action menu a rajouté
                    }) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.whitePrimary)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                HStack {
                    Text("4 places restantes")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.orangePrimary)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.orangePrimary, lineWidth: 2)
                        )
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                HStack(alignment: .top, spacing: 16) {
                    Image(activity.activityOrganizer.userPhoto)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.proBlue, lineWidth: 3))
                    
                    Text(activity.activityDescription)
                        .font(.system(size: 16))
                        .foregroundColor(.whitePrimary)
                        .lineSpacing(4)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 10) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.orangePrimary)
                        HStack(spacing: -8) {
                            
                            ForEach(participants, id: \.self) { participant in
                                Image(participant)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(couleurCercle.randomElement()!, lineWidth: 3))
                            }
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.orangePrimary)
                        Text(activity.activityLocation)
                            .foregroundColor(.whitePrimary)
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "clock")
                            .foregroundColor(.orangePrimary)
                        Text("\(formattedDate) \(formattedTime)")
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                    }
                }
                .font(.system(size: 16))
                .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Text(activity.activityLevel.levelName)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color(activity.activityLevel.levelColor))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(activity.activityLevel.levelColor),lineWidth: 2)
                        )
                    
                    HStack(spacing: 6) {
                        Image(activity.activityGenders.genderLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 30)
                        Text(activity.activityGenders.genderName)
                            .font(.custom("BebasNeue-Regular", size: 20))
                    }
                    .foregroundColor(.whitePrimary)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 14)
                    .background(Color.whitePrimary.opacity(0.15))
                    .cornerRadius(10)
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.whitePrimary.opacity(0.7))
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Bouton Participer
                Button(action: {
                    // Action participation et renvoi vers la page correspondante
                }) {
                    Text("Participer")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orangePrimary)
                        .foregroundColor(.whitePrimary)
                        .cornerRadius(10)
                }
                .frame(width: 300)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 250)
        }
    }
}

#Preview {
    NavigationView {
        ActivityInfoView(activity: sampleActivities[0])
    }
}
