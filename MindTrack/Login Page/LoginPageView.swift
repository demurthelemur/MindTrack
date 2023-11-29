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
        UserDefaults.standard.set("Demir", forKey: "name")
        UserDefaults.standard.set("Dereli", forKey: "lastName")
        UserDefaults.standard.set("Test", forKey: "password")
        UserDefaults.standard.set("email", forKey: "email")
        UserDefaults.standard.set(5, forKey: "points")
        UserDefaults.standard.set("Squirtle", forKey: "petType")
        UserDefaults.standard.set(true, forKey: "userState")
        userState = true
    }
}

//struct LoginPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPageView()
//    }
//}
