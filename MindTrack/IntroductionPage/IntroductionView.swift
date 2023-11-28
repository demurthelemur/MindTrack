//
//  IntroductionView.swift
//  MindTrack
//
//  Created by Demir Dereli on 9.09.2023.
//

import SwiftUI

struct IntroductionView: View {
    
    @Binding var userState: Bool
    
    var placeHolderText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint"
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("SmallLogo")
                .resizable()
                .frame(width: 100, height: 100)
                .border(.cyan, width: 6)
                .padding(.top)
            
            Text("MindTrack")
                .font(.system(size: 30))
                .bold()
                .padding()
            
            Text(placeHolderText)
                .multilineTextAlignment(.center)
                .padding(15)
                .background(Color.cyan.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.cyan.opacity(0.5), lineWidth: 10)
                }
                .padding(.horizontal, 30)
            
            BigBlueButton(action: enterTheApp , buttonText: "Enter the App")
                .padding(.top, 40)
            
            Spacer()
        }
    }
    
    private func enterTheApp() {
        userState = true
    }
}

//struct IntroductionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroductionView()
//    }
//}
