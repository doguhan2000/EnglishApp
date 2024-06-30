import SwiftUI

struct QuestionCardView: View {
    let question: Question
    let onAnswerSelected: (String) -> Void
    
    var body: some View {
        let shuffledOptions = question.options.shuffled()
        let backgroundColors: [Color] = [.white, .gray, .blue, .green, .orange]
        let backgroundColor = backgroundColors.randomElement() ?? .white

        VStack {
            Text(question.question)
                .font(.largeTitle)
                .padding()

            ForEach(shuffledOptions, id: \.self) { option in
                Button(action: {
                    onAnswerSelected(option)
                }) {
                    Text(option)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top, 5)
                }
            }
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(
            question: Question(
                question: "Apple",
                correctAnswer: "Elma",
                options: ["Elma", "Armut", "Üzüm", "Karpuz"]
            ),
            onAnswerSelected: { _ in }
        )
    }
}

