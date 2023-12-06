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
            
            do {
                let parsedData = try JSONDecoder().decode(User.self, from: data!)
                UserDefaults.standard.set(parsedData.id, forKey: "id")
                UserDefaults.standard.set(parsedData.name, forKey: "name")
                UserDefaults.standard.set(parsedData.lastName, forKey: "lastName")
                UserDefaults.standard.set(parsedData.email, forKey: "email")
                UserDefaults.standard.set(parsedData.points, forKey: "points")
                UserDefaults.standard.set(parsedData.petType, forKey: "petType")
                UserDefaults.standard.set(true, forKey: "userState")
                userState = true
            } catch {
                print("\(error)")
            }

            
        }.resume()
        
    }
}


//struct LoginPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPageView()
//    }
//}
