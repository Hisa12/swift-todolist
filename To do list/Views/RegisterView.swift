
import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
            ZStack{
           
                    BackgroundView(background: .pink)
                    
                VStack{
                    Text("Register")
                        .font(.title)
                        .padding()
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Full Name", text:$viewModel.name)
                        .padding()
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text:$viewModel.email)
                        .padding()
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text:$viewModel.password)
                        .padding()
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Create account", background: .blue){
                        viewModel.register()
                    }
                    
                    Text("Have an account?")
                    NavigationLink("Login page", destination: LoginView())
                    
                    
                }
            }.navigationBarBackButtonHidden(true) 
      
    }
}

#Preview {
    RegisterView()
}
