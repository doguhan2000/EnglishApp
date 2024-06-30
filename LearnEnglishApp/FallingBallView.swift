import SwiftUI

struct FallingBallView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .red
    @State private var animationDuration: Double = 2.0
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(self.color)
                .frame(width: 30, height: 30)
                .offset(x: CGFloat.random(in: 0...geometry.size.width), y: self.offset.height)
                .onAppear {
                    self.startFalling(in: geometry.size.height)
                }
                .animation(Animation.linear(duration: self.animationDuration).repeatForever(autoreverses: false))
        }
    }
    
    private func startFalling(in height: CGFloat) {
        self.offset = CGSize(width: 0, height: -height)
        self.color = Color.random
        self.animationDuration = Double.random(in: 2...4)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.offset = CGSize(width: 0, height: height + 30)
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

struct FallingBallView_Previews: PreviewProvider {
    static var previews: some View {
        FallingBallView()
    }
}

