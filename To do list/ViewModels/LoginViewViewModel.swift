
import FirebaseAuth
import Foundation
import UIKit

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login() {
        guard validate() else {
            return
        }

        // Try log in
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            if let error = error{
                self.errorMessage="Login unsuccessful! Please check."
                print(error.localizedDescription)
            
            return
            }
        }
    }

    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Fill in all fields."
            return false
        }

        return true
    }
}
