import SwiftUI

struct SymbolTestView: View {
    let icons = ["basketball.fill", "soccerball", "rugbyball.fill", "skateboard.fill", "tennisball.fill"]
    var body: some View {
        VStack {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                    .padding(4)
            }
        }
    }
}

#Preview {
    SymbolTestView()
}
