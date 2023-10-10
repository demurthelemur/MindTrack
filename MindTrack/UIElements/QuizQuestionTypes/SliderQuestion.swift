//
//  SliderQuestion.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct SliderQuestion: View {
    let questionModel: QuestionModel
    @Binding var impactPoint: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(questionModel.Question)
                .padding(.horizontal)
            
            Slider(value: $impactPoint, in: 1...Double(questionModel.impact!), step: 1.0)
                .padding(.horizontal)
            
            HStack(alignment: .center){
                Text("1")
                    .padding(.leading)
            
                Spacer()
                
                Text("Value: \(String(format: "%.f", impactPoint))")
                
                Spacer()
                
                Text("\(questionModel.impact!)")
            }
        }
    }
}

//
//struct SliderQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderQuestion(Question: "Placeholder Question")
//    }
//}
