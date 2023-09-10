//
//  MainPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                Image("Pikachu")
                    .resizable()
                    .frame(width: .infinity, height: 350)
                    .background(Color.yellow.opacity(0.3))
                    .overlay(
                        Rectangle()
                            .stroke(.yellow, lineWidth: 7)
                    )
                    .padding()
                
                Text("Score:")
                    .padding(.top)
                    .font(.title)
                
                Text("932")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 30)
                
                BigBlueButton(action: takeQuiz, buttonText: "Take Quiz!")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    AppToolbar()
                }
            }
        }
    }
    
    private func takeQuiz() {}
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

