import SwiftUI

struct SportCellView: View {
    var activity: Activity
//    let level : Level
//    let sport  : Sport
//    let gender : Gender
//    let mindset : Mindset

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
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.1))
                .shadow(radius: 2)
            
            
            HStack(spacing: 14) {
                VStack(spacing: 6) {
                    if !activity.activitySport.sportLogo.isEmpty {
                        Image(systemName: activity.activitySport.sportLogo)
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                    } else {
                        Image(systemName: "sportscourt")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                    }
                    
                    Text(activity.activityLevel.levelName.uppercased())
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(activity.activityLevel.levelColor))
                }
                .frame(width: 60)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text(activity.activitySport.sportName.uppercased())
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        
                        
                        
                        NavigationLink(destination: ActivityInfoView(activity: activity)) {
//                            SportCellView(activity: activity)
                            
                            Text("DÉTAILS")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(Color.orange)
                                .cornerRadius(6)
                            }
                        }
                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                            .foregroundColor(.orange)
                            .font(.system(size: 14))
                        
                        Text("\(formattedDate) \(formattedTime)")
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                    }
                    
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.orange)
                            .font(.system(size: 14))
                        
                        Text(activity.activityLocation)
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                            .lineLimit(1)
                        
                        Text("│")
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("200m")
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }
                }
            }
            .padding(12)
        }
        .frame(maxWidth: 340)
        .frame(height: 100)
    }
}

#Preview {
    
        SportCellView(activity: activityPreview)
    }

