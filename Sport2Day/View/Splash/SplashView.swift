
// création page splashscreen matito

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        
        ZStack {
            
            Image("splashScreen")
                .resizable()
                .ignoresSafeArea()
            
            VStack (spacing:20) {
                
                Image("sport2DayLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .opacity(opacity)
                    .animation(.easeIn(duration: 0.4),value: opacity)
                
                VStack (spacing: 4) {
                    
                    Text("Trouve ton équipe")
                        .font(.system(size: 18, weight: .medium))
                        .italic()
                        .foregroundStyle(Color.whitePrimary)
                        
                    Text("près de chez toi !")
                        .font(.system(size: 18, weight: .medium))
                        .italic()
                        .foregroundStyle(Color.whitePrimary)
                }
                .opacity(opacity)
                .animation(.easeIn(duration: 1.0).delay(0.2), value: opacity)
            }
        }
        .onAppear {
            withAnimation {
                opacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeInOut(duration: 2.0)) {
                    isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            WelcomeView()
                .transition(.opacity)
        }
    }
}
    
    #Preview {
       SplashView()
}
