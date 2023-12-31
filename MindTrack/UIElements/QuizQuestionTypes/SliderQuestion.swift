////
////  SliderQuestion.swift
////  MindTrack
////
////  Created by Demir Dereli on 10.09.2023.
////
//
//import SwiftUI
//
//struct SliderQuestion: View {
//    let questionModel: QuestionModel
//    @Binding var impactPoint: Int
//    @State var tempDouble: Double = 1.0
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            
//            Text(questionModel.Question)
//                .padding(.horizontal)
//            
//            Slider(value: Binding(
//                get: { tempDouble },
//                set: { newValue in
//                    tempDouble = newValue
//                    impactPoint = Int(newValue) // Convert Double to Int
//                }
//            ), in: 1...Double(questionModel.impact ?? 5), step: 1.0)
//                .padding(.horizontal)
//            
//            HStack(alignment: .center){
//                Text("1")
//                    .padding(.leading)
//            
//                Spacer()
//                
//                Text("Value: \(String(format: "%.f", impactPoint))")
//                
//                Spacer()
//                
//                Text("\(questionModel.impact ?? 5)")
//            }
//        }
//    }
//}

//
//struct SliderQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderQuestion(Question: "Placeholder Question")
//    }
//}
