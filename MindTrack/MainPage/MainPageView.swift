//
//  MainPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI
import UserNotifications

struct MainPageView: View {
    
    @State private var path = NavigationPath()
    @StateObject var currentUser = User.createUserFromAppData()
    @State var isButtonEnabled: Bool = false
    @ObservedObject var reloadViewHelper = ReloadViewHelper()
    @State private var showAlert = false
    @State var showingFullScreen = false
    
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
                
                NavigationLink("Take a test", destination: QuizView(didUserSolveQuiz: $isButtonEnabled, currentUser: currentUser))
                    .disabled(isButtonEnabled)
                

            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Couldn't Connect to Server"),
                    message: Text("You need the internet to use the app"),
                    dismissButton: .default(Text("OK")) {
                        //exit(0)
                    }
                )
            }
            .fullScreenCover(isPresented: $showingFullScreen) {
                StartupView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    AppToolbar(currentUser: currentUser)
                }
            }
        }.onAppear() {
            let userState = UserDefaults.standard.bool(forKey: "userState")
            if userState {
                checkButtonAvailability()
                relogin()
                reloadViewHelper.reloadView()
            } else {
                showingFullScreen = true
            }
        }
    }
    
    private func takeQuiz() {
        path.append("quizView")
    }
    
    private func relogin() {
        guard let url = URL(string: "http://localhost:8080/auth/login") else {return}
        let email = UserDefaults.standard.string(forKey: "email")
        let password = UserDefaults.standard.string(forKey: "password")
        
        let body: [String : String] = ["email": email!, "password": password!]
        let JSONBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = JSONBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                showAlert = true
                print("Error logging in")
            }
        }.resume()
        
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



class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}
