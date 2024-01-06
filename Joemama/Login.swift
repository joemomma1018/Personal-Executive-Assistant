import SwiftUI
import AuthenticationServices

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                Text("PPA.pig")
                    .font(.title)
                    .foregroundColor(.black)

                VStack {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        print("Login with Username: \(username)")
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }

                Divider()
                    .padding()

                
                Text("Log in with")
                
                GoogleSignInButton() {
                    
                    print("Google Sign-In tapped")
                }

                
                AppleSignInButton() {
                    print("Apple Sign-In tapped")
                }
                Text("Don't have an account?")
                
                Button("Sign up here") { setActivity() }
                
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 20))
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
        }
    }
}

struct GoogleSignInButton:   View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("Continue with Google")
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2))
        }
    }
}

private func setActivity(){
}


struct AppleSignInButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "applelogo")
                    .font(.system(size: 20))
                Text("Continue with Apple")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.black)
            .cornerRadius(8)
            .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2))
        }
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
