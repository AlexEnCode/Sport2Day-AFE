//
//  SearchFilterPopUpView.swift
//  Sport2Day
//
//  Created by apprenant74 on 31/10/2025.
//

import SwiftUI

struct SearchFilterPopUpView: View {
    @Binding var searchText: String
    @Environment(\.dismiss) private var dismiss
    var onApply: (SearchFilters) -> Void
    
    @State private var tempSearchText: String
    @State private var selectedSport: SportType? = nil
    @State private var selectedLevel: LevelType = .all
    @State private var participantValue: Double = 1
    @State private var dateStart: Date = Date()
    @State private var dateEnd: Date = Date().addingTimeInterval(86400 * 7)
    @State private var selectedAccessibility: Set<String> = []  // décoratif
    


    
    init(searchText: Binding<String>, onApply: @escaping (SearchFilters) -> Void) {
        self._searchText = searchText
        self.onApply = onApply
        self._tempSearchText = State(initialValue: searchText.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    // Recherche
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(.white)
                        TextField("Ville", text: $tempSearchText)
                            .foregroundColor(.white)
                            .submitLabel(.search)
                            .onSubmit { applyFilters() }
                    }
                    .padding()
                    .background(Color.containerGray)
                    .cornerRadius(14)
                    
                    // Sports
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sport").foregroundColor(.white).fontWeight(.semibold)
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 5), spacing: 12) {
                            ForEach(SportType.allCases, id: \.self) { sport in
                                SportButton(
                                    icon: sport.icon,
                                    title: sport.displayName,
                                    isSelected: selectedSport == sport
                                ) {
                                    selectedSport = selectedSport == sport ? nil : sport
                                }
                            }
                        }
                        .frame(maxHeight: 140)
                    }
                    
                    // Niveau
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Niveau").foregroundColor(.white).fontWeight(.semibold)
                        HStack(spacing: 14) {
                            ForEach(LevelType.allCases) { level in
                                LevelButton(
                                    title: level.displayName,
                                    color: level.color,
                                    isSelected: selectedLevel == level
                                ) {
                                    selectedLevel = level
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    
                    // Accessibilités
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Accessibilités").foregroundColor(.white).fontWeight(.semibold)
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 4), spacing: 10) {
                            ForEach(["HANDICAP", "FEMMES", "HOMMES", "QUEERS"], id: \.self) { option in
                                AccessibilityButton(
                                    option: option,
                                    isSelected: selectedAccessibility.contains(option)
                                ) {
                                    toggle(&selectedAccessibility, option)
                                }
                            }
                        }
                    }
                    
                    // Période
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Période").foregroundColor(.white).fontWeight(.bold)
                        HStack(spacing: 0) {
                            DatePicker("Du", selection: $dateStart, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(.compact)
                                .colorScheme(.dark)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity)
                            
                            Text(":").foregroundColor(.white.opacity(0.7)).fontWeight(.semibold).padding(.horizontal, 8)
                            
                            DatePicker("Au", selection: $dateEnd, in: dateStart..., displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(.compact)
                                .colorScheme(.dark)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity)
                        }
                        .frame(height: 52)
                        .background(Color.containerGray)
                        .cornerRadius(8)
                    }
                    .padding(.top, 12)
    
                    
                    // Participants
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Participants").foregroundColor(.white).fontWeight(.semibold)
                            Spacer()
                            Text("\(Int(participantValue))").foregroundColor(.white).font(.caption)
                        }
                        Slider(value: $participantValue, in: 1...15, step: 1).tint(.orangePrimary)
                    }
                    
                    // Boutons
                    HStack(spacing: 12) {
                        
                        Button("Rechercher") {
                            applyFilters()
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.orangePrimary)
                        .cornerRadius(18)
                        .shadow(color: .black.opacity(0.3), radius: 6)
                    }
                }
                .padding()
            }
            .background(Color.bluePrimary.ignoresSafeArea())
        }
    }

    private func applyFilters() {
        searchText = tempSearchText
        let filters = SearchFilters(
            searchText: tempSearchText,
            sports: selectedSport.map { Set([$0.rawValue]) } ?? [],
            level: selectedLevel.rawValue,
            accessibility: [],  // on ignore
            participantsMin: Int(participantValue),
            participantsMax: 15,
            dateStart: dateStart,
            dateEnd: dateEnd
        )
        onApply(filters)
        dismiss()
    }
    
    
    private func toggle(_ set: inout Set<String>, _ value: String) {
        if set.contains(value) {
            set.remove(value)
        } else {
            set.insert(value)
        }
    }
}
    


struct SearchFilters {
    var searchText: String
    var sports: Set<String>
    var level: String
    var accessibility: Set<String>
    var participantsMin: Int
    var participantsMax: Int
    var dateStart: Date?
    var dateEnd: Date?
    
    init(
        searchText: String = "",
        sports: Set<String> = [],
        level: String = "TOUS",
        accessibility: Set<String> = [],
        participantsMin: Int = 1,
        participantsMax: Int = 15,
        dateStart: Date? = nil,
        dateEnd: Date? = nil
    ) {
        self.searchText = searchText
        self.sports = sports
        self.level = level
        self.accessibility = accessibility
        self.participantsMin = participantsMin
        self.participantsMax = participantsMax
        self.dateStart = dateStart
        self.dateEnd = dateEnd
    }
    
    static var empty: SearchFilters { SearchFilters() }
}



private let levelColors: [LevelType: Color] = [
    .novice: Color("noviceGreen"),
    .inter: Color("interPurple"),
    .pro: Color("proBlue"),
    .all: Color("allYellow")
]


extension LevelType {
    var color: Color {
        switch self {
        case .all:   return Color("allYellow")
        case .novice:return Color("noviceGreen")
        case .inter: return Color("interPurple")
        case .pro:   return Color("proBlue")
        }
    }
}
