import SwiftUI

struct ResultView: View {
    let isCorrect: Bool
    let onNextQuestion: () -> Void
    let onDismiss: () -> Void

    var body: some View {
        VStack {
            Text(isCorrect ? "Doğru!" : "Tekrar deneyiniz")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()

            if isCorrect {
                Button(action: {
                    onNextQuestion()
                }) {
                    Text("Sonraki Soru")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            } else {
                Button(action: {
                    onDismiss()
                }) {
                    Text("Tamam")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
        .background(isCorrect ? Color.green : Color.red)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            isCorrect: false,
            onNextQuestion: { },
            onDismiss: { }
        )
    }
}

