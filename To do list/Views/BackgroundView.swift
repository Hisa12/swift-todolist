
import SwiftUI

struct BackgroundView: View {
    let background:Color
    
    var body: some View {
        ZStack{
            Color(background)
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    BackgroundView(background: .blue)
}
