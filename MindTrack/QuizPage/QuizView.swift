//
//  QuizView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct QuizView: View {
    @StateObject var vm = QuestionViewModel()
    @Binding var didUserSolveQuiz: Bool
    @ObservedObject var currentUser: User
    @State var showAlert = false
    var questions = developmentTestQuestions.shuffled()
    
    let totalScore = 0
    @ViewBuilder
    var body: some View {
        VStack {
            Text("Mind Track Quiz")
                .font(.title)
                .bold()
                .padding()
            
            ScrollView {
                RadioButtonQuestion(questionModel: questions[0], impactPoint: $vm.question1ImpactPoint)
                RadioButtonQuestion(questionModel: questions[1], impactPoint: $vm.question2ImpactPoint)
                RadioButtonQuestion(questionModel: questions[2], impactPoint: $vm.question3ImpactPoint)
                RadioButtonQuestion(questionModel: questions[3], impactPoint: $vm.question4ImpactPoint)
                RadioButtonQuestion(questionModel: questions[4], impactPoint: $vm.question5ImpactPoint)
                RadioButtonQuestion(questionModel: questions[5], impactPoint: $vm.question6ImpactPoint)
                RadioButtonQuestion(questionModel: questions[6], impactPoint: $vm.question7ImpactPoint)

            }
            BigButtonWithCustomColor(action: submitQuestions, buttonText: "Submit", color: didUserSolveQuiz ? Color.gray : Color.red)
                .alert(isPresented: $showAlert) {
                    alert
                }
                .disabled(didUserSolveQuiz)
        }
    }
    
    private func submitQuestions() {
        vm.totalPoint = Int(vm.question1ImpactPoint) + vm.question2ImpactPoint + vm.question3ImpactPoint + Int(vm.question4ImpactPoint) + vm.question5ImpactPoint + vm.question6ImpactPoint + vm.question7ImpactPoint
        let writePoints = currentUser.points + vm.totalPoint
        currentUser.points += vm.totalPoint
        UserDefaults.standard.set(writePoints, forKey: "points")
        UserDefaults.standard.set(Date(), forKey: "LastButtonPressDate")
        sendUserPoint(point: writePoints)
        didUserSolveQuiz = true
        showAlert = true
    }
    
    private func sendUserPoint(point: Int) {
        let id = UserDefaults.standard.string(forKey: "id")
        print(id)
        guard let url = URL(string: "http://localhost:8080/users/point/\(id!)") else {return}
        print(url)
        let body: [String : String] = ["point": "\(point)"]
        let JSONBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = JSONBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response)
        }.resume()
    }
    
    private var alert: Alert {
        Alert(
            title: Text("Your results have been saved"),
            message: Text("You may return now"),
            primaryButton: .default(Text("OK")) {
                showAlert = false
            }, secondaryButton: .cancel()
        )
    }

}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView()
//    }
//}
