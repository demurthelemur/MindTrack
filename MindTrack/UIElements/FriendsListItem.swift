//
//  FriendsListItem.swift
//  MindTrack
//
//  Created by Demir Dereli on 9.09.2023.
//

import SwiftUI

struct FriendView: View {
    
    let Name: String
    let Score: Int
    let imageName: String
    let borderColor: Color
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Name)
                    .font(.title3)
                    .bold()
                Text("Score \(Score)")
                    .font(.callout)
            }
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(8)
                .overlay(
                    Circle()
                        .stroke(borderColor, lineWidth: 2)
                )
        }
    }
}
