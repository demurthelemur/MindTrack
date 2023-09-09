//
//  FriendsListView.swift
//  MindTrack
//
//  Created by Demir Dereli on 9.09.2023.
//

import SwiftUI

struct FriendsListView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("Destination")
                } label: {
                    FriendView(Name: "Demir", Score: 123, imageName: "Squirtle", borderColor: Color.blue)
                }
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    FriendView(Name: "Egemen", Score: 134, imageName: "Pikachu", borderColor: Color.yellow)
                }
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    FriendView(Name: "Kaan", Score: 123, imageName: "Charizard", borderColor: Color.red)
                }


            }
            .navigationTitle("Friends List")
            .toolbar {
                Button {
                    addFriend()
                } label: {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    private func addFriend() {}
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}

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