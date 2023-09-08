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
            
            BigBlueButton(action:                 loginButtonPressed,
                buttonText: "Login")
            
            Spacer()
        }
    }
    
    func loginButtonPressed() {
        
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
