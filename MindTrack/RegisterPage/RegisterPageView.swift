//
//  RegisterPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct RegisterPageView: View {
    @State var name: String  = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State private var birthDate = Date.now
    @State var accepted: Bool = false
    @State private var showAlert = false
    @State private var registerError = false
    @State private var confirmEmail = false
    
    @Binding var userState: Bool
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            
            Image("SmallLogo")
                .resizable()
                .frame(width: 150, height: 150)
                .border(.cyan, width: 6)
                .padding()
            
            Text("Welcome to MindTrack!")
                .font(Font.largeTitle.weight(.heavy))
            
            Spacer()
            
            VStack {
                CustomTextField(binding: $name, text: "Enter your name: ", textFieldText: "Name...", imageName: "person.fill")
                
                CustomTextField(binding: $lastName, text: "Enter your Last Name: ", textFieldText: "Last Name...", imageName: "person.fill")
                
                CustomTextField(binding: $email, text: "Enter your Email: ", textFieldText: "Email...", imageName: "envelope.fill")
                
                CustomPasswordField(binding: $password, text: "Enter your Password: ", textFieldText: "Password...", imageName: "lock.fill")
            }
            
            
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Enter your birthday")
            }
            .padding()
            
            HStack {
                Toggle(isOn: $accepted) {
                    Text("Accept terms and conditions")
                }
                .toggleStyle(CheckboxToggleStyle())
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .alert(isPresented: $confirmEmail) {
                      Alert(
                        title: Text("Confirm Email"),
                        message: Text("Login "),
                          dismissButton: .default(Text("OK"))
                      )
                  }
            
            Spacer()
            BigButtonWithCustomColor(action: registerButtonClicked, buttonText: "Register", color: Color.blue)
            .disabled(checkDisabled())

        }
        .alert(isPresented: $showAlert) {
                  Alert(
                    title: Text(registerError ? "Couldn't register user" : "User registered"),
                    message: Text(registerError ? "User already exists or information given is wrong" : "Please confirm your email and login again"),
                    primaryButton: .default(Text("Return")) {
                        path.removeLast()
                    },
                    secondaryButton: .cancel()
                  )
              }
    }
    
    private func registerButtonClicked() {
        guard let url = URL(string: "http://localhost:8080/auth/register") else {return}
        
        let body: [String : String] = ["firstName": name, "lastName": lastName, "email": email, "password": password]
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
                        print(response)
                        let parsedData = try JSONDecoder().decode(User.self, from: data!)
                        UserDefaults.standard.set(parsedData.id, forKey: "id")
                        UserDefaults.standard.set(parsedData.name, forKey: "name")
                        UserDefaults.standard.set(parsedData.lastName, forKey: "lastName")
                        UserDefaults.standard.set(parsedData.email, forKey: "email")
                        UserDefaults.standard.set(parsedData.points, forKey: "points")
                        UserDefaults.standard.set(parsedData.petType, forKey: "petType")
                        UserDefaults.standard.set(true, forKey: "userState")
                        UserDefaults.standard.set(password, forKey: "password")

                    } catch {
                        showAlert = true
                        print("\(error)")
                    }
                } else {
                    registerError = true
                    showAlert = true
                }
            }
        
        }.resume()

    }
    
    
    private func checkDisabled() -> Bool {
        if name.count >= 3, lastName.count >= 3, password.count >= 7, birthDate != .now, accepted {
            
            return false
        } else {
            return true
        }
    }
}

//struct RegisterPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterPageView()
//    }
//}
//


