import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Arka plan rengi
                LinearGradient(
                    gradient: Gradient(colors: [Color.green, Color.pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Horoz resmi
                    Image("horoz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 20)
                    
                    // Yazı
                    Text("İngilizce öğrenmeye hazır mısın?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("The free, fun, and effective way to learn a language!")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    // Butonlar
                    NavigationLink(destination: LoginView()) {
                        Text("Giriş Yap")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Kayıt Ol")
                            .font(.headline)
                            .foregroundColor(.green)
                            .frame(width: 220, height: 60)
                            .background(Color.white)
                            .cornerRadius(15.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                    }
                    
                    Spacer()
                }
                
                // Animasyonlu toplar
                ForEach(0..<10) { _ in
                    FallingBallView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

