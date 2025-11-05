//
//  MapListView.swift
//  Sport2Day
//
//  Created by apprenant74 on 05/11/2025.
//

import SwiftUI

struct MapListView: View {
    let activities: [Activity]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(activities) { activity in
                    SportCellView(activity: activity)
                }
            }
            .padding()
        }
    }
}
