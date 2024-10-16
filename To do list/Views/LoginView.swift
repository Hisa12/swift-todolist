
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView(background: .orange)

                    VStack{
                        Text("Todo List")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Text("Login")
                            .font(.title)
                            .padding()
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Email Address", text:$viewModel.email)
                            .padding()
                            .frame(width:300, height: 50)
                            .background(.black.opacity(0.05))
                            .cornerRadius(10)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                      
                        SecureField("Password", text:
                                        $viewModel.password)
                        .padding()
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                        TLButton(title: "Login", background: .blue){
                            viewModel.login()
                        }
                        
                        Text("New here?")
                        NavigationLink("Create an account", destination: RegisterView())
 
                    }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    LoginView()
}
