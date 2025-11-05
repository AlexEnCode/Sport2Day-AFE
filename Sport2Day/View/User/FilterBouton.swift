//
//  FilterButton.swift
//  Sport2Day
//
//  Created by Mateo Groux on 03/11/2025.
//

import SwiftUI

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(isSelected ? .white : .black)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isSelected ? Color.orange : Color.white)
                .clipShape(Capsule())
        }
    }
}

#Preview("Selected") {
    FilterButton(title: "Passés", isSelected: true, action: {})
}
