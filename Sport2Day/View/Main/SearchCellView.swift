
// [Alex] 29/10 Bar de recherche testée pour ville, a transformer en pop-up style airBnB
// [Alex] 3à/10 Transformation de la bar de recherche en popup
// [Alex] 01/11 Pas de bill Bill, c'est comme la maquette !

import SwiftUI

struct SearchCellView: View {
    @Binding var searchText: String
    @State private var showFilters = false
    var onApplyFilters: (SearchFilters) -> Void
    
    var body: some View {
        Button {
            showFilters = true
        } label: {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white.opacity(0.8))
                
                Text(searchText.isEmpty ? "Rechercher une activité" : searchText)
                    .foregroundColor(searchText.isEmpty ? .gray : .white)
                    .lineLimit(1)
                
                Spacer()
                
            }
            .padding(14)
            .background(Color.containerGray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
            )
        }
        .padding(.horizontal, 8)
        .sheet(isPresented: $showFilters) {
            SearchFilterPopUpView(searchText: $searchText) { filters in
                onApplyFilters(filters)
            }
            .presentationDetents([.large])
            .presentationCornerRadius(24)
        }
    }
}
