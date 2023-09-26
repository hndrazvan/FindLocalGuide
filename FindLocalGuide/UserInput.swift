import SwiftUI
import Combine
import FirebaseAuth

class ViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var zipCode = ""
    @Published var country = ""
    @Published var state = ""
    @Published var city = ""

    @Published private var _currentUser : User? = nil
    @Published var hasError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
        
    private var handler = Auth.auth().addStateDidChangeListener{_,_ in }
    private var userRepository: UserRepository = UserRepository()
    var currentUser: User {
        return _currentUser ?? User(uid: "", email: "", firstName:"",lastName:"", city:"", state:"",country:"", zipCode:"")
    }
        
    init(){
        handler = Auth.auth().addStateDidChangeListener{ auth,user in
            if let user = user {
                self._currentUser = User(uid: user.uid, email: user.email!, firstName: self.firstName, lastName: self.lastName, city: self.city, state:self.state, country:self.country, zipCode:self.zipCode)
                    self.isLoggedIn = true
            } else {
                self._currentUser = nil
                self.isLoggedIn = false
            }
        }
    }
        
    func signIn() async {
        hasError = false
        do{
            try await Auth.auth().signIn(withEmail: email, password: password)
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
            print(errorMessage)
        }
    }
    
    func createAccount() async {
        hasError = false
        do{
            try await Auth.auth().createUser(withEmail: email, password: password)
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
            print(errorMessage)
        }
        
        userRepository.addUser(user: currentUser)
    }
        
    func signOut() async {
        hasError = false
        do{
            try Auth.auth().signOut()
                
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
        }
            
    }
    func returnCurrentUser() -> UserInfo? {
        return Auth.auth().currentUser
    }
        
    deinit{
        Auth.auth().removeStateDidChangeListener(handler)
    }
}
struct EmailInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    
    var body: some View {
        TextField("", text: $txt, prompt: Text(placeHolder).foregroundColor(.gray))
            .keyboardType(.emailAddress)
            .onReceive(Just(txt)) { newValue in
                let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                if validString != newValue {
                    self.txt = validString
                }
            }.font(Font.custom("Roboto", size: 20)).foregroundColor(.black).offset(x: 27, y: -0.32)
    }
}

struct PasswordInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    
    var body: some View {
        SecureField(placeHolder, text: $txt, prompt: Text(placeHolder).foregroundColor(.gray))
            .keyboardType(.emailAddress)
            .onReceive(Just(txt)) { newValue in
                let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                if validString != newValue {
                    self.txt = validString
                }
        }.font(Font.custom("Roboto", size: 20)).foregroundColor(.black).offset(x: 27, y: -0.32)
    }
}

          
