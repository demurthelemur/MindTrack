//
//  QuizView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct QuizView: View {
    @StateObject var vm = QuestionViewModel()
    @Binding var path: NavigationPath
    @Binding var didUserSolveQuiz: Bool
    @ObservedObject var currentUser: User
    
    let totalScore = 0
    var body: some View {
        VStack {
            Text("Mind Track Quiz")
                .font(.title)
                .bold()
                .padding()
            
            ScrollView {
                SliderQuestion(questionModel: developmentTestQuestions[0], impactPoint: $vm.question1ImpactPoint)
                RadioButtonQuestion(questionModel: developmentTestQuestions[1], impactPoint: $vm.question2ImpactPoint)
                RadioButtonQuestion(questionModel: developmentTestQuestions[2], impactPoint: $vm.question3ImpactPoint)
                SliderQuestion(questionModel: developmentTestQuestions[3], impactPoint: $vm.question4ImpactPoint)
                RadioButtonQuestion(questionModel: developmentTestQuestions[4], impactPoint: $vm.question5ImpactPoint)
                RadioButtonQuestion(questionModel: developmentTestQuestions[5], impactPoint: $vm.question6ImpactPoint)
                RadioButtonQuestion(questionModel: developmentTestQuestions[6], impactPoint: $vm.question7ImpactPoint)
            }
            BigButtonWithCustomColor(action: submitQuestions, buttonText: "Submit", color: Color.red)
                // .disabled(checkDisabled())
        }
    }
    
    private func submitQuestions() {
        vm.totalPoint = Int(vm.question1ImpactPoint) + vm.question2ImpactPoint + vm.question3ImpactPoint + Int(vm.question4ImpactPoint) + vm.question5ImpactPoint + vm.question6ImpactPoint + vm.question7ImpactPoint
        currentUser.points += vm.totalPoint
        UserDefaults.standard.set(Date(), forKey: "LastButtonPressDate")
        didUserSolveQuiz = true
        path.removeLast()
    }
    
    private func checkDisabled() -> Bool {
        if vm.question1ImpactPoint == 0 ||
            vm.question2ImpactPoint == 0 ||
            vm.question3ImpactPoint == 0 ||
            vm.question4ImpactPoint == 0 || 
            vm.question5ImpactPoint == 0 || 
            vm.question6ImpactPoint == 0 ||
            vm.question7ImpactPoint == 0 
        {return true}
        return false
        
    }
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView()
//    }
//}
