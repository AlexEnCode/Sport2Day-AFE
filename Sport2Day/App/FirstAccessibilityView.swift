//
//  FirstAccessibilityView.swift
//  Sport2Day
//
//  Created by apprenant74 on 05/11/2025.
//
//  FirstAccessibilityView.swift
//  Sport2Day
//
//  Created by Melwic Guillaume on 05/11/2025.
//

import SwiftUI

struct FirstAccessibilityView: View {
    @State private var showMainView = false

    var body: some View {
        ZStack {
            if showMainView {
                MainTabView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                    .animation(.easeInOut(duration: 0.4), value: showMainView)
            } else {
                Color.bluePrimary
                    .ignoresSafeArea()
                    .overlay(
                        VStack {
                            AccessibilityView()

                            Button("OK, c'est parti !") {
                                withAnimation {
                                    showMainView = true
                                }
                            }
                            .padding()
                            .background(Color.orangePrimary)
                            .cornerRadius(12)
                            .font(.system(size: 18, weight: .black))
                            .foregroundColor(.white)

                            Spacer()
                        }
                    )
            }
        }
    }
}


#Preview {
    FirstAccessibilityView()
}
