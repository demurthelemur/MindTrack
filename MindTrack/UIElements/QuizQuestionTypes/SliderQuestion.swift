//
//  SliderQuestion.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct SliderQuestion: View {
    let Question: String
    @State var selectedNumber: Double = 0
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(Question)
                .padding(.horizontal)
            
            Slider(value: $selectedNumber, in: 0...10, step: 1.0)
                .padding(.horizontal)
            
            HStack(alignment: .center){
                Text("1")
                    .padding(.leading)
            
                Spacer()
                
                Text("Value: \(String(format: "%.f", selectedNumber))")
                
                Spacer()
                
                Text("10")
                    .padding(.trailing)
            }
        }
    }
}

struct SliderQuestion_Previews: PreviewProvider {
    static var previews: some View {
        SliderQuestion(Question: "Placeholder Question")
    }
}
