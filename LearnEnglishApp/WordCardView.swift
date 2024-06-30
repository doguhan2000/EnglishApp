import SwiftUI

struct WordCardView: View {
    var word: Word
    var onSwipe: (SwipeDirection) -> Void
    
    @State private var offset = CGSize.zero
    @State private var backgroundColor = Color.white
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
                .shadow(radius: 5)
            
            VStack {
                Text(word.text)
                    .font(.largeTitle)
                    .padding()
                
                if offset.width > 50 {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 100))
                        .offset(x: 100)
                } else if offset.width < -50 {
                    Image(systemName: "arrow.left.circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 100))
                        .offset(x: -100)
                }
            }
        }
        .frame(width: 300, height: 400)
        .offset(x: offset.width, y: 0)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                    self.updateBackgroundColor()
                }
                .onEnded { _ in
                    if self.offset.width > 100 {
                        self.onSwipe(.right)
                        self.resetCard()
                    } else if self.offset.width < -100 {
                        self.onSwipe(.left)
                        self.resetCard()
                    } else {
                        self.resetCard()
                    }
                }
        )
        .animation(.spring(), value: offset)
    }
    
    private func updateBackgroundColor() {
        if offset.width > 0 {
            backgroundColor = Color.red.opacity(Double(offset.width / 100))
        } else if offset.width < 0 {
            backgroundColor = Color.green.opacity(Double(-offset.width / 100))
        } else {
            backgroundColor = Color.white
        }
    }
    
    private func resetCard() {
        offset = .zero
        backgroundColor = Color.white
    }
}

enum SwipeDirection {
    case left, right
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(word: Word(text: "Example"), onSwipe: { _ in })
    }
}

