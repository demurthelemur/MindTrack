//
//  LoginPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct LoginPageView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var showAlert = false
    @State private var loginError = false
    
    @Binding var userState: Bool
    var body: some View {
        VStack {
            Spacer()
            
            Image("SmallLogo")
                .resizable()
                .frame(width: 150, height: 150)
                .border(.cyan, width: 6)
                .padding()
            
            Text("MindTrack")
                .font(.system(size: 50))
                .bold()
                .padding()
            
            CustomTextField(binding: $email, text: "Enter your email", textFieldText: "Email", imageName: "envelope.fill")
            
            CustomPasswordField(binding: $password, text: "Enter your Password", textFieldText: "Password...", imageName: "lock.fill")
                .padding(.vertical)
            
            Spacer()
            
            BigBlueButton(action: loginButtonPressed, buttonText: "Login")
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
                  Alert(
                    title: Text(loginError ? "Couldn't log in" : "Could not connect to the server"),
                    message: Text(loginError ? "Please check credentials" : "Try again later."),
                      dismissButton: .default(Text("OK"))
                  )
              }
    }
    
    func loginButtonPressed() {
        guard let url = URL(string: "http://localhost:8080/auth/login") else {return}
        
        let body: [String : String] = ["email": email, "password": password]
        let JSONBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = JSONBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            if let _ = error {
                showAlert = true
                return
            } else {
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    do {
                        let parsedData = try JSONDecoder().decode(User.self, from: data!)
                        
                        UserDefaults.standard.set(parsedData.id, forKey: "id")
                        UserDefaults.standard.set(parsedData.name, forKey: "name")
                        UserDefaults.standard.set(parsedData.lastName, forKey: "lastName")
                        UserDefaults.standard.set(parsedData.email, forKey: "email")
                        UserDefaults.standard.set(parsedData.points, forKey: "points")
                        UserDefaults.standard.set(parsedData.petType, forKey: "petType")
                        UserDefaults.standard.set(true, forKey: "userState")
                        UserDefaults.standard.set(password, forKey: "password")
                        userState = true
                    } catch {
                        print("\(error)")
                    }
                } else {
                    loginError = true
                    showAlert = true
                }
            }
        }.resume()
    }
}


//struct LoginPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPageView()
//    }
//}
