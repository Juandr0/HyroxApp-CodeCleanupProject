import SwiftUI

struct UserLoginView: View {
    
    @EnvironmentObject var signInRegister: AuthenticationHandler
    @State var email = ""
    @State var password = ""
    @State var showErrorAlert = false
    
    var body: some View {
        
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    TitleView()
                    Spacer()
                }
                .padding()
                .padding(.top, 50)
                
                Spacer()
                
                CredentialsView(email: $email, password: $password)
                
                Spacer()
                Spacer()
                
                HStack {
                    Button(action: {
                        signInRegister.signIn(email: email, password: password)
                    }) {
                        SignInView()
                    }
                    
                    Button(action: {
                        signInRegister.register(email: email, password: password)
                    }) {
                        RegisterView()
                    }
                    
                }
            }
            
            SignInErrorHandler(authHandler: signInRegister, email: $email, password: $password, showAlert: $showErrorAlert)
        }
    }
}
