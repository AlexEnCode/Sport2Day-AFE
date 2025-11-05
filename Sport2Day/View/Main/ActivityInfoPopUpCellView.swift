
// [Alex] 29/10 on fait juste des teste en attendant la DATA
// [Alex] 30/10 amelioration du design et fond clicable pour sortir du popup sans s'incrire
// [Alex] 02/11 Mini-maj, à revoir

/*
 import SwiftUI
 
 struct ActivityInfoPopUpCellView: View {
 let activity: Activity
 var onClose: () -> Void
 
 var body: some View {
 ZStack {
 // Fond cliquable
 Color.black.opacity(0.4)
 .ignoresSafeArea()
 .onTapGesture { onClose() }
 
 // Contenu
 VStack(alignment: .leading, spacing: 16) {
 // Sport
 Text(activity.activitySport.sportName.uppercased())
 .font(.headline)
 .foregroundColor(.orangePrimary)
 
 // Titre
 Text(activity.activityTitle)
 .font(.title2.bold())
 .foregroundColor(.white)
 
 // Infos
 HStack {
 Image(systemName: "mappin.and.ellipse")
 Text(activity.activityLocation)
 }
 .foregroundColor(.white.opacity(0.8))
 
 HStack {
 Image(systemName: "calendar")
 Text(activity.activityDate, style: .date)
 Text("à")
 Text(activity.activityDate, style: .time)
 }
 .foregroundColor(.white.opacity(0.8))
 
 HStack {
 Image(systemName: "person.3")
 Text("\(activity.activityPlayers) joueurs")
 }
 .foregroundColor(.white.opacity(0.8))
 
 HStack {
 Image(systemName: "figure.wave")
 Text(activity.level.rawValue)
 .padding(6)
 .background(activity.level.color)
 .foregroundColor(.white)
 .cornerRadius(8)
 }
 
 // Description
 Text(activity.activityDescription)
 .foregroundColor(.white.opacity(0.9))
 .font(.body)
 
 // Bouton fermer
 Button("Fermer") {
 onClose()
 }
 .frame(maxWidth: .infinity)
 .padding()
 .background(Color.orangePrimary)
 .foregroundColor(.white)
 .cornerRadius(12)
 }
 .padding()
 .frame(maxWidth: 340)
 .background(Color.containerGray)
 .cornerRadius(20)
 .shadow(radius: 20)
 .padding()
 }
 }
 }
 
 
 
 extension LevelType {
 var color: Color {
 switch self {
 case .novice: return Color("noviceGreen")
 case .inter:  return Color("interPurple")
 case .pro:    return Color("proBlue")
 case .all: return Color("yellow")
 
 }
 }
 }
 
 
 */
