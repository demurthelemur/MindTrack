//
//  LandingPage.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        VStack(alignment: .center){
            
            Image("Logo")
                .resizable()
                .border(.blue, width: 6)
                .padding()
                .frame(width: .infinity, height: 450)
            
            Text("Welcome to Mindtrack")
                .font(.title)
                .bold()
                .padding(.bottom, 7)
            
            Text("Please Login or Register to continue")
                .font(.subheadline)
                .padding(.bottom, 15)
            
            BigBlueButton(action: loginClicked, buttonText: "Login")
                .padding(.bottom)
            
            BigBlueButton(action: registerClicked, buttonText: "Register")
            
            Spacer()
        }
    }
    
    func registerClicked() {
        
    }
    
    func loginClicked() {
        
    }
    
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}


