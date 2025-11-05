//
//  CustomActivityPinView.swift
//  Sport2Day
//
//  Created by apprenant74 on 03/11/2025.
//

import SwiftUI

struct CustomActivityPinView: View {
    let iconName: String
    let count: String
    let color: Color
    
    var body: some View {
        ZStack {
            Image(systemName: "drop.fill")
                .resizable()
                .frame(width: 48, height: 68)
                .foregroundColor(.orange)
                .rotationEffect(.degrees(180))
                .shadow(color: .black.opacity(0.3), radius: 4)
            
            VStack(spacing: 2) {
                Image(systemName: iconName)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.top, 2)
                
                Text(count)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
            }
            .offset(y: -4)
        }
    }
}
