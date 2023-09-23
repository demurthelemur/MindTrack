//
//  LandingPage.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct LandingPage: View {
    @Binding var userState: Bool
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack(path: $path){
            
            VStack(alignment: .center){
                
                Image("Logo")
                    .resizable()
                    .border(.cyan, width: 6)
                    .padding()
                    .frame(height: 450)
                
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
            .navigationDestination(for: String.self) { view in
                if view == "Login" {
                    LoginPageView(userState: $userState)
                } else if view == "Register" {
                    RegisterPageView(userState: $userState, path: $path)
                } else if view == "intro" {
                    IntroductionView(userState: $userState)
                }
            }
        }
    }
    
    func loginClicked() {
        path.append("Login")
    }

    
    func registerClicked() {
        path.append("Register")
    }
}

//struct LandingPage_Previews: PreviewProvider {
//    @State var test: Bool
//    static var previews: some View {
//        LandingPage(userState: $test)
//    }
//}


