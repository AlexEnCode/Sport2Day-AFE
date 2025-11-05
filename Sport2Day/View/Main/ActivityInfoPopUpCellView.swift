
// [Alex] 29/10 on fait juste des teste en attendant la DATA
// [Alex] 30/10 amelioration du design et fond clicable pour sortir du popup sans s'incrire
// [Alex] 02/11 Mini-maj, à revoir



import SwiftUI

struct ActivityInfoPopupCellView: View {
    let activity: Activity
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            // En-tête avec sport
            HStack {
                Image(systemName: activity.activitySport.sportLogo)
                    .font(.title2)
                    .foregroundColor(.white)
                Text(activity.activitySport.sportName)
                    .font(.custom("BebasNeue-Regular", size: 28))
                    .foregroundColor(.white)
                Spacer()
                Button(action: onDismiss) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.8))
                }
            }

            // Description
            Text(activity.activityDescription)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.9))
                .lineLimit(3)

            // Infos rapides
            HStack {
                Label(activity.activityLocation, systemImage: "mappin.and.ellipse")
                Spacer()
                Label(formattedDateTime, systemImage: "clock")
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.8))

            // Niveau + Genre
            HStack {
                Text(activity.activityLevel.levelName)
                    .font(.headline)
                    .foregroundStyle(Color(activity.activityLevel.levelColor))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
         //           .background(Capsule().stroke(Color(activity.activityLevel.levelColor), lineWidth: 2))

                HStack(spacing: 4) {
                    Image(activity.activityGenders.genderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                    Text(activity.activityGenders.genderName)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.2))
                .cornerRadius(8)

                Spacer()
            }

            // Bouton Participer
            Button("Participer") {
                // Action
                onDismiss()
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.orangePrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding(20)
        .background(
            Color("bluePrimary")
                .opacity(0.96)
                .cornerRadius(20)
        )
        .padding(.horizontal, 32)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    private var formattedDateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let date = activity.activityDate.map { formatter.string(from: $0) } ?? activity.dateString
        let hours = activity.activityStartTime / 100
        let minutes = activity.activityStartTime % 100
        return "\(date) à \(String(format: "%02d:%02d", hours, minutes))"
    }
}
