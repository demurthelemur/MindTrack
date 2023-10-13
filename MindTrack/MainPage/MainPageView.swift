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
    @State var isButtonEnabled: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center){
                Image(currentUser.petState)
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
                
                BigButtonWithCustomColor(action: takeQuiz, buttonText: "Take Quiz!", color: isButtonEnabled ? .gray : .blue)
                    .navigationDestination(for: String.self) { view in
                        if view == "quizView" {
                            QuizView(path: $path, didUserSolveQuiz: $isButtonEnabled, currentUser: currentUser)
                        }
                    }
                    .disabled(isButtonEnabled)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    AppToolbar()
                }
            }
        }.onAppear() {
            checkButtonAvailability()
        }
    }
    
    private func takeQuiz() {
        if let lastPressDate = UserDefaults.standard.object(forKey: "LastButtonPressDate") as? Date {
            print(lastPressDate)
        }
        path.append("quizView")
    }
    
    func checkButtonAvailability() {
        if let lastPressDate = UserDefaults.standard.object(forKey: "LastButtonPressDate") as? Date {
            print(lastPressDate)
            let calendar = Calendar.current
            if let tomorrow = calendar.date(byAdding: .day, value: 1, to: lastPressDate),
               let now = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) {
                if now >= tomorrow {
                    isButtonEnabled = false
                } else {
                    isButtonEnabled = true
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

