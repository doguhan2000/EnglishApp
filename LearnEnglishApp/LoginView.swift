import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginError: String = ""
    @State private var roosterOffset: CGFloat = -UIScreen.main.bounds.height / 2
    @State private var showLoginTitle = false
    @State private var showUsernameField = false
    @State private var showPasswordField = false
    @State private var showLoginButton = false
    @State private var navigateToWelcome = false
    
    var body: some View {
        NavigationStack {
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
                    
                    // Horoz animasyonu
                    Image("horoz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .offset(y: roosterOffset)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5)) {
                                roosterOffset = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("Giriş Yap")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .offset(x: showLoginTitle ? 0 : -UIScreen.main.bounds.width)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).delay(0.5)) {
                                showLoginTitle = true
                            }
                        }
                    
                    Spacer()
                    
                    TextField("Kullanıcı Adı", text: $username)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.7))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .offset(x: showUsernameField ? 0 : -UIScreen.main.bounds.width)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).delay(0.7)) {
                                showUsernameField = true
                            }
                        }
                    
                    SecureField("Şifre", text: $password)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.7))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .offset(x: showPasswordField ? 0 : UIScreen.main.bounds.width)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).delay(0.9)) {
                                showPasswordField = true
                            }
                        }
                    
                    if !loginError.isEmpty {
                        Text(loginError)
                            .foregroundColor(.red)
                            .padding(.bottom, 20)
                            .offset(y: showLoginButton ? 0 : UIScreen.main.bounds.height)
                    }
                    
                    Button(action: {
                        login()
                    }) {
                        Text("Giriş Yap")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 20)
                    .offset(y: showLoginButton ? 0 : UIScreen.main.bounds.height)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.5).delay(1.1)) {
                            showLoginButton = true
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
                // Animasyonlu toplar
                ForEach(0..<10) { _ in
                    FallingBallView()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .navigationDestination(isPresented: $navigateToWelcome) {
                WelcomeView(username: username)
            }
        }
    }
    
    private func login() {
        let users = UserDefaults.standard.getUsers()
        if users.contains(where: { $0.username == username && $0.password == password }) {
            // Giriş başarılı
            UserDefaults.standard.set(username, forKey: "currentUsername")
            withAnimation {
                navigateToWelcome = true
            }
        } else {
            loginError = "Geçersiz kullanıcı adı veya şifre"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

