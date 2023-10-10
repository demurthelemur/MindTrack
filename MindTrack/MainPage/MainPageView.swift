//
//  MainPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct MainPageView: View {
    
    @State private var path = NavigationPath()
    @StateObject var currentUser = User.devUser
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center){
                Image(currentUser.petType)
                    .resizable()
                    .frame(height: 350)
                    .background(Color.yellow.opacity(0.3))
                    .overlay(
                        Rectangle()
                            .stroke(.yellow, lineWidth: 7)
                    )
                    .padding()
                
                Text("Score:")
                    .padding(.top)
                    .font(.title)
                
                Text("\(currentUser.points)")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 30)
                
                BigBlueButton(action: takeQuiz, buttonText: "Take Quiz!")
                    .navigationDestination(for: String.self) { view in
                        if view == "quizView" {
                            QuizView(path: $path, currentUser: currentUser)
                        }
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    AppToolbar()
                }
            }
        }
    }
    
    private func takeQuiz() {
        path.append("quizView")
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

