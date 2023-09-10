//
//  QuizView.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct QuizView: View {
    let totalScore = 0
    var body: some View {
        VStack {
            Text("Mind Track Quiz")
                .font(.title)
                .bold()
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(developmentTestQuestions, id: \.id) {question in
                        if question.questionType == .Radio {
                            RadioButtonQuestion(Question: question.Question, AnswerOptions: question.Answers!)
                        } else {
                            SliderQuestion(Question: question.Question)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
            }
            BigButtonWithCustomColor(action: submitQuestions, buttonText: "Submit", color: Color.red)
        }
    }
    
    private func submitQuestions() {}
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
