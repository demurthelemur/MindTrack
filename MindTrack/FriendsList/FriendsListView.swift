//
//  FriendsListView.swift
//  MindTrack
//
//  Created by Demir Dereli on 9.09.2023.
//

import SwiftUI

struct FriendsListView: View {
    @State private var showCustomAlert = false
    @State private var ID = ""
    @State private var showAlert = false
    @State private var friendsList: [FriendModel] = []
    
    var body: some View {
            List {
                ForEach(friendsList) { friend in
                    FriendView(Name: friend.name , Score: friend.point, imageName: friend.petType, borderColor: Color.blue, id: friend.friendId)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button (role: .destructive){
                                print("Remove friend \(friend.friendId)")
                                removeFriend(friendID: friend.friendId)
                            } label: {
                                Label("Remove friend", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                }
            }
            .sheet(isPresented: $showCustomAlert, onDismiss: refreshFriends) {
                addFriendView(show: $showCustomAlert, ID: $ID, showAlert: $showAlert, friendsList: $friendsList)
            }
            .alert(isPresented: $showAlert) {
                      Alert(
                        title: Text("Couldn't find Friend"),
                        message: Text("Please check the ID and try again"),
                          dismissButton: .default(Text("OK"))
                      )
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
            .onAppear() {
                refreshFriends()
            }
    }
    
    private func addFriend() {
        showCustomAlert = true
    }
    
    private func removeFriend(friendID: String) {
        let id = UserDefaults.standard.string(forKey: "id")
        guard let url = URL(string: "http://localhost:8080/users/\(id!)/removefriend/\(friendID)") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print(error)
            } else {
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    print(response)
                } else {
                    print(response)
                }
            }

        }.resume()
    }
    
    private func refreshFriends() {
        let id = UserDefaults.standard.string(forKey: "id")
        guard let url = URL(string: "http://localhost:8080/users/friends/\(id!)") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                showAlert = true
            } else {
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    do {
                        let resultData = try JSONDecoder().decode(FriendModelArray.self, from: data!)
                        friendsList = resultData
                    } catch {
                        print("\(error)")
                    }
                } else {
                    print(response)
                    showAlert = true
                }
            }

        }.resume()
        ID = ""
    }
}


