//
//  RadioButtonQuestion.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct RadioButtonQuestion: View {
    let questionModel: QuestionModel
    @Binding var impactPoint: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text(questionModel.Question)
                .padding(.horizontal)
            Picker("Label", selection: $impactPoint) {
                ForEach(questionModel.Answers!, id: \.id) { answer in
                    Text(answer.AnswerText).tag(answer.impactPoint)
                }
            }
            .pickerStyle(.inline)
            .padding(.top, -30)
        }
    }
}

//struct RadioButtonQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        RadioButtonQuestion(Question: "Placeholder Question", AnswerOptions: [Answer(AnswerText: "Good", impactPoint: 5), Answer(AnswerText: "Mid", impactPoint: 0), Answer(AnswerText: "Bad", impactPoint: -5)])
//    }
//}
