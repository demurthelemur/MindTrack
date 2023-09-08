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
            
            VStack(alignment: .leading) {
                Text("Enter your email")
                    .font(.subheadline)
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("Email...", text: $email)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .foregroundColor(.black)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Enter your Password")
                    .font(.subheadline)
                HStack {
                    Image(systemName: "lock.fill")
                    SecureField("Password...", text: $password)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .foregroundColor(.black)
            }
            .padding()
            
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
