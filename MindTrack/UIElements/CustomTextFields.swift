//
//  CustomTextFields.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var binding: String
    var text: String
    var textFieldText: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.subheadline)
            HStack {
                Image(systemName: imageName)
                TextField(textFieldText, text: $binding)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}


struct CustomPasswordField: View {
    
    @Binding var binding: String
    var text: String
    var textFieldText: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.subheadline)
            HStack {
                Image(systemName: imageName)
                SecureField(textFieldText, text: $binding)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}
