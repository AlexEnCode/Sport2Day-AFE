import SwiftUI

struct UserPastActivityView: View {
    #if DEBUG
    private let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    #else
    private let isPreview = false
    #endif
    
    let sampleActivities: [Activity]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                if isPreview {
                    ForEach(sampleActivities, id: \.activityID) { activity in
                        SportCellView(activity: activity)
                                        }
                } else {
                    ForEach(sampleActivities.filter { $0.activityDate ?? Date() < Date() }) { activity in
                        SportCellView(activity: activity)
                            
                    }
                }
            }
            .padding(.vertical, 20)
        }
        .background(Color("bluePrimary").ignoresSafeArea())
    }
}


#Preview {
    UserPastActivityView(sampleActivities: Array(sampleActivities.prefix(2)))
        .environment(\.colorScheme, .dark)
}
