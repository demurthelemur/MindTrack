//
//  RadioButtonQuestion.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct RadioButtonQuestion: View {
    let Question: String
    let AnswerOptions : [Answer]
    @State var answerSelected: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text(Question)
                .padding(.horizontal)
            Picker("Label", selection: $answerSelected) {
                ForEach(AnswerOptions, id: \.id) { answer in
                    Text(answer.AnswerText).tag(answer.AnswerText)
                }
            }
            .pickerStyle(.inline)
            .padding(.top, -30)
        }
    }
}

struct RadioButtonQuestion_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonQuestion(Question: "Placeholder Question", AnswerOptions: [Answer(AnswerText: "Good", impactPoint: 5), Answer(AnswerText: "Mid", impactPoint: 0), Answer(AnswerText: "Bad", impactPoint: -5)])
    }
}
