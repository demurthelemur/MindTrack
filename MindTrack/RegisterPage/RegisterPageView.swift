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
                
                CustomTextField(binding: $name, text: "Enter your Last Name: ", textFieldText: "Last Name...", imageName: "person.fill")
                
                CustomTextField(binding: $name, text: "Enter your Email: ", textFieldText: "Email...", imageName: "envelope.fill")
                
                CustomPasswordField(binding: $name, text: "Enter your Password: ", textFieldText: "Password...", imageName: "lock.fill")
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
            
            Spacer()
            
            BigBlueButton(action: registerButtonClicked, buttonText: "Register")
            
        }
        
    }
    
    private func registerButtonClicked() {
        
    }
}

struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}



