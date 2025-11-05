import SwiftUI

struct ActivityListCellView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                // ✅ Fond bleu couvrant tout l'écran, y compris sous la navigation bar
                Color("bluePrimary")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    
                    HStack(spacing: 12) {
                        FilterButton(title: "Déjà créées", isSelected: selectedTab == 0) {
                            selectedTab = 0
                        }
                        
                        FilterButton(title: "Réservées", isSelected: selectedTab == 1) {
                            selectedTab = 1
                        }
                        
                        FilterButton(title: "Passées", isSelected: selectedTab == 2) {
                            selectedTab = 2
                        }
                    }
                    .padding(.top, 12)
                    
                    Group {
                        if selectedTab == 0 {
                            UserCreatedView(sampleActivities: Array(sampleActivities.prefix(2)))
                        } else if selectedTab == 1 {
                            UserBookedActivityView(sampleActivities: Array(sampleActivities.prefix(1)))
                        } else {
                            UserPastActivityView(sampleActivities: Array(sampleActivities.prefix(5)))
                        }
                    }
                    .animation(.easeInOut, value: selectedTab)
                    .transition(.opacity)
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.whitePrimary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.whitePrimary)
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityListCellView()
        .environment(\.colorScheme, .dark)
}
