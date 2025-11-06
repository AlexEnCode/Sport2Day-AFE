
// [Alex] 29/10 on fait juste des teste en attendant la DATA
// [Alex] 30/10 amelioration du design et fond clicable pour sortir du popup sans s'incrire
// [Alex] 02/11 Mini-maj, à revoir


import SwiftUI


struct ActivityInfoPopupCellView: View {
    let activity: Activity
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            headerSection
            
            descriptionSection
            

                VStack( spacing: 16) {
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.orangePrimary)
                        Text(activity.activityLocation)
                            .font(.caption)
                            .foregroundStyle(.whitePrimary)
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.orangePrimary)
                        Text(formattedDateTime)
                            .font(.caption)
                            .foregroundStyle(.whitePrimary)
                        Spacer()
                    }

                }
        //    Label(formattedDateTime, systemImage: "clock")
        //                          .foregroundColor(.orangePrimary)
            
            badgesSection
            
            Spacer(minLength: 12)
            
            participateButton
        }
        .padding(20)
        .multilineTextAlignment(.leading)
    }
    
    private var headerSection: some View {
        HStack {
            Image(systemName: activity.activitySport.sportLogo)
                .font(.title2)
                .foregroundColor(.white)
            
            Text(activity.activitySport.sportName.uppercased())
                .font(.custom("BebasNeue-Regular", size: 26))
                .foregroundColor(.white)
                .lineLimit(1)
            
            Spacer()
            
            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
    
   
    private var descriptionSection: some View {
        Text(activity.activityDescription)
            .lineLimit(50)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(.white.opacity(0.92))
            .lineLimit(3)
            .multilineTextAlignment(.leading)
            
    }
   
    

    

    private var badgesSection: some View {
        HStack(spacing: 12) {
            // Niveau
            LevelButton(
                title: activity.activityLevel.levelName,
                color: Color(activity.activityLevel.levelColor),
                isSelected: true
            ) {}
            .frame(maxWidth: .infinity)
            
            // Genre
            HStack(spacing: 6) {
                Image(activity.activityGenders.genderLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(activity.activityGenders.genderName)
                    .font(.caption.bold())
            }
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(Color.white.opacity(0.22))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
        }
    }
  
    
    private var participateButton: some View {
        Button("Participer") {
            // TODO: Logique de participation
            onDismiss()
        }
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color.orangePrimary)
        .foregroundColor(.white)
        .cornerRadius(12)
        .shadow(color: .orangePrimary.opacity(0.3), radius: 4, y: 2)
    }
    
    // MARK: - Formatage Date/Heure
    private var formattedDateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        let dateStr = activity.activityDate.map { formatter.string(from: $0) } ?? activity.dateString
        
        let hours = activity.activityStartTime / 100
        let minutes = activity.activityStartTime % 100
        return "\(dateStr) à \(String(format: "%02d:%02d", hours, minutes))"
    }
}
