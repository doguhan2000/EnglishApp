import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var signUpError: String = ""
    @State private var showSuccessMessage = false
    @State private var roosterOffset: CGFloat = -UIScreen.main.bounds.height / 2
    @State private var showSignUpTitle = false
    @State private var showUsernameField = false
    @State private var showPasswordField = false
    @State private var showConfirmPasswordField = false
    @State private var showSignUpButton = false
    @State private var navigateToLogin = false
    
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
                    
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .offset(x: showSignUpTitle ? 0 : -UIScreen.main.bounds.width)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).delay(0.5)) {
                                showSignUpTitle = true
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
                    
                    SecureField("Şifreyi Onaylayın", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.7))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .offset(x: showConfirmPasswordField ? 0 : UIScreen.main.bounds.width)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).delay(1.1)) {
                                showConfirmPasswordField = true
                            }
                        }
                    
                    if !signUpError.isEmpty {
                        Text(signUpError)
                            .foregroundColor(.red)
                            .padding(.bottom, 20)
                            .offset(y: showSignUpButton ? 0 : UIScreen.main.bounds.height)
                    }
                    
                    Button(action: {
                        signUp()
                    }) {
                        Text("Kayıt Ol")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 20)
                    .offset(y: showSignUpButton ? 0 : UIScreen.main.bounds.height)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.5).delay(1.3)) {
                            showSignUpButton = true
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
                // Animasyonlu toplar
                ForEach(0..<10) { _ in
                    FallingBallView()
                }
                
                if showSuccessMessage {
                    Text("Kayıt Başarılı!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .transition(.scale)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    navigateToLogin = true
                                }
                            }
                        }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
    
    private func signUp() {
        // Kayıt işlemleri burada yapılacak.
        // Şifreler eşleşiyor mu kontrol edin
        if password != confirmPassword {
            signUpError = "Şifreler eşleşmiyor"
        } else if username.isEmpty || password.isEmpty {
            signUpError = "Lütfen tüm alanları doldurun"
        } else {
            // Kayıt başarılı, kullanıcıyı kaydet
            let newUser = User(username: username, password: password)
            UserDefaults.standard.saveUser(newUser)
            
            withAnimation {
                showSuccessMessage = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

