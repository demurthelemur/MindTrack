//
//  Big Blue Button.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct BigBlueButton: View {
    
    let action: () -> Void
    let buttonText: String
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 250, height: 60)
                
                Text(buttonText)
                    .foregroundColor(.white)
                    .frame(width: 250)
                    .padding()
            }
        }
    }
}
